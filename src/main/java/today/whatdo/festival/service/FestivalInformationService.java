package today.whatdo.festival.service;

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

	public int dailyUpdateFestivalInformation(FestivalResultVO festivalInfos) {
		int updateCnt = 0;
		for (FestivalInformationVO festivalInfo : festivalInfos.getResponse().getBody().getItems().getItem()) {
			if (festivalInformationMapper.selectFestivalInformation(festivalInfo.getContentid()) == null) {
				festivalInformationMapper.insertFestivalInformation(festivalInfo);
			} else {
				festivalInfo.setFiNum(festivalInformationMapper.selectFestivalInformation(festivalInfo.getContentid()).getFiNum());
				updateCnt += festivalInformationMapper.updateFestivalInformation(festivalInfo);
			}
		}

		return updateCnt;
	}
}
