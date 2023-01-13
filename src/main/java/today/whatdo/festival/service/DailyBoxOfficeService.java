package today.whatdo.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.api.ApiBoxOfficeByRestTemplate;
import today.whatdo.festival.mapper.DailyBoxOfficeMapper;
import today.whatdo.festival.vo.boxoffice.DailyBoxOfficeListVO;

@Service
public class DailyBoxOfficeService {
	@Autowired
	private DailyBoxOfficeMapper dailyBoxOfficeMapper;
	@Autowired
	private ApiBoxOfficeByRestTemplate apiBoxOfficeByRestTemplate;
	
	public int addDailyBoxOfficeList(List<DailyBoxOfficeListVO> parameter) {
		return dailyBoxOfficeMapper.insertDailyBoxOffices(parameter);
	}
	
	public boolean addBoxOfficeItem(DailyBoxOfficeListVO parameter) {
		return dailyBoxOfficeMapper.insertBoxOffice(parameter)==1;
	}
	
	
	public List<DailyBoxOfficeListVO> loadBoxofficeListFromRDS(DailyBoxOfficeListVO parameter){
		return dailyBoxOfficeMapper.selectBoxOfficeList(parameter);
	}
	
	public int insertDailyBoxOfficeList() {
		List<DailyBoxOfficeListVO> dailyBoxOfficeList = apiBoxOfficeByRestTemplate.getBoxOfficeList(1);
		return dailyBoxOfficeMapper.insertDailyBoxOffices(dailyBoxOfficeList);
	}
}
