package today.whatdo.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.mapper.FestivalInformationMapper;
import today.whatdo.festival.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.vo.festivalInfo.FestivalResultVO;

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
	
	public List<FestivalInformationVO> getFestivalInformationListAll(FestivalInformationVO festivalInfo){
		return festivalInformationMapper.selectFestivalInformationLists(festivalInfo);
	}
}
