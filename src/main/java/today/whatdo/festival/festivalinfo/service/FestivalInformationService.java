package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import today.whatdo.festival.festivalinfo.api.ApiDetailFestivalInfo;
import today.whatdo.festival.festivalinfo.api.ApiFestivalImage;
import today.whatdo.festival.festivalinfo.api.ApiLinkedOpenData;
import today.whatdo.festival.festivalinfo.api.ApiNearFestivalInfo;
import today.whatdo.festival.festivalinfo.mapper.FestivalInformationMapper;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResponseVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResultVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.SearchParameterVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData.LinkedBindingsVO;

@Service
public class FestivalInformationService {
	@Autowired
	private FestivalInformationMapper festivalInformationMapper;

	public int insertFestivalInformationList(FestivalResultVO festivalInfos) {
		return festivalInformationMapper
				.insertFestivalInformations(festivalInfos.getResponse().getBody().getItems().getItem());
	}

	public int insertFestivalInformation(FestivalInformationVO festivalInfo) {
		return festivalInformationMapper.insertFestivalInformation(festivalInfo);
	}
	
	//마이리스트 축제 정보 불러오기
	public FestivalInformationVO selectFestivalInformationByNum(int fiNum) {
		return festivalInformationMapper.selectFestivalInformationByNum(fiNum);
	}

	// 축제 데이터 업데이트용 서비스
	// 이미 존재하는 데이터일경우 변경사항을 업데이트만 하고
	// 존재하지 않는 데이터일경우 새로 인서트 하는 로직
	public int dailyUpdateFestivalInformation(FestivalResultVO festivalInfos) {
		int updateCnt = 0;
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
		return updateCnt;
	}
	
	public PageInfo<FestivalInformationVO> getFestivalInformationListAll(SearchParameterVO searchParameter){
		PageHelper.startPage(searchParameter.getPage(),10);
		return PageInfo.of(festivalInformationMapper.selectFestivalInformationLists(searchParameter));
	}
	
	@Autowired
	private ApiNearFestivalInfo apiNearFestivalInfo;
	@Autowired
	private ApiDetailFestivalInfo apiDetailFestivalInfo;
	@Autowired
	private ApiFestivalImage apiFestivalImage;
	
	public FestivalResponseVO getFestivalInformation(int fiNum) {
		FestivalResponseVO response = new FestivalResponseVO();
		FestivalInformationVO festivalInfo = festivalInformationMapper.selectFestivalInformationByNum(fiNum);
		FestivalInformationVO detail = apiDetailFestivalInfo.getFestivalInformationDetail(festivalInfo);
		if(detail!=null) {
			festivalInfo.setOverview(detail.getOverview());
			festivalInfo.setHomepage(detail.getHomepage());
		}
		response.setFestivalInfo(festivalInfo); 
		if("0".equals(festivalInfo.getMapx())) { // 맵좌표가 없을경우 주변 명소를 가져오지 않고 리턴
			return response;
		}
		response.setLocationInfo(apiNearFestivalInfo.getLocationInformationByMap(festivalInfo)); 
		response.setFestivalImages(apiFestivalImage.getFestivalImages(festivalInfo));
		return response;
	}
}
