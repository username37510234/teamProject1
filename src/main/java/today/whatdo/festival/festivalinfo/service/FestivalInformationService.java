package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import lombok.AllArgsConstructor;
import today.whatdo.festival.festivalinfo.api.ApiDetailFestivalInfo;
import today.whatdo.festival.festivalinfo.api.ApiFestivalImage;
import today.whatdo.festival.festivalinfo.api.ApiNearFestivalInfo;
import today.whatdo.festival.festivalinfo.mapper.FestivalInformationMapper;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResponseVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResultVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.SearchParameterVO;

@Service
@AllArgsConstructor
public class FestivalInformationService {
	private final FestivalInformationMapper festivalInformationMapper;

	public int insertFestivalInformationList(FestivalResultVO festivalInfos) {
		return festivalInformationMapper
				.insertFestivalInformations(festivalInfos.getResponse().getBody().getItems().getItem());
	}

	public int insertFestivalInformation(FestivalInformationVO festivalInfo) {
		return festivalInformationMapper.insertFestivalInformation(festivalInfo);
	}

	// 마이리스트 축제 정보 불러오기
	public FestivalInformationVO selectFestivalInformationByNum(int fiNum) {
		return festivalInformationMapper.selectFestivalInformationByNum(fiNum);
	}

	// 메인 페이지 조회수 높은 축제 정보 10개 불러오기
	public List<FestivalInformationVO> selectFestivalInformationByReadcount(FestivalInformationVO festivalInfo) {
		return festivalInformationMapper.selectFestivalInformationByReadcount(festivalInfo);
	}

	// 축제 데이터 업데이트용 서비스
	// 이미 존재하는 데이터일경우 변경사항을 업데이트만 하고
	// 존재하지 않는 데이터일경우 새로 인서트 하는 로직
	public int dailyUpdateFestivalInformation(FestivalResultVO festivalInfos) {
		int updateCnt = 0;
		if (festivalInfos != null) {
			for (FestivalInformationVO festivalInfo : festivalInfos.getResponse().getBody().getItems().getItem()) {
				FestivalInformationVO tmp = festivalInformationMapper
						.selectFestivalInformation(festivalInfo.getContentid());
				if (tmp == null) { // 존재여부 확인
					updateCnt += festivalInformationMapper.insertFestivalInformation(festivalInfo); // 없을경우 인서트
				} else {
					festivalInfo.setFiNum(tmp.getFiNum()); // 현재 있는 FiNum으로 설정
					updateCnt += festivalInformationMapper.updateFestivalInformation(festivalInfo); // 있을경우 업데이트
				}
			}
		}
		return updateCnt;
	}

	public PageInfo<FestivalInformationVO> getFestivalInformationListAll(SearchParameterVO searchParameter) {
		PageHelper.startPage(searchParameter.getPage(), 10);
		return PageInfo.of(festivalInformationMapper.selectFestivalInformationLists(searchParameter));
	}

	public PageInfo<FestivalInformationVO> getFinishedInformationList(SearchParameterVO searchParameter) {
		PageHelper.startPage(searchParameter.getPage(), 10);
		return PageInfo.of(festivalInformationMapper.selectFinishedInformationLists(searchParameter));
	}

	public PageInfo<FestivalInformationVO> getMostLikeFestival(SearchParameterVO searchParameter) {
		PageHelper.startPage(searchParameter.getPage(), 10);
		return PageInfo.of(festivalInformationMapper.selectMostLikedfestivalLists(searchParameter));
	}

	public FestivalInformationVO getFestivalInformation(int fiNum) {
		return festivalInformationMapper.selectFestivalInformationByNum(fiNum);
	}

	public PageInfo<FestivalInformationVO> getFestvalInformationsBySearch(SearchParameterVO searchParameter) {
		PageHelper.startPage(searchParameter.getPage(), 10);
		return PageInfo.of(festivalInformationMapper.selectFestivalInformationBySearch(searchParameter));
	}

	// api 호출을 위한 api 선언
	private final ApiNearFestivalInfo apiNearFestivalInfo;
	private final ApiDetailFestivalInfo apiDetailFestivalInfo;
	private final ApiFestivalImage apiFestivalImage;

	public FestivalResponseVO getFestivalDetails(FestivalInformationVO festivalInfo) {
		FestivalResponseVO response = new FestivalResponseVO();
		FestivalInformationVO detail = apiDetailFestivalInfo.getFestivalInformationDetail(festivalInfo);
		response.setFestivalInfo(detail);
		if ("0".equals(festivalInfo.getMapx())) { // 맵좌표가 없을경우 주변 명소를 가져오지 않고 리턴
			return response;
		}
		response.setFestivalImages(apiFestivalImage.getFestivalImages(festivalInfo));
		response.setLocationInfo(apiNearFestivalInfo.getLocationInformationByMap(festivalInfo));
		return response;
	}
}
