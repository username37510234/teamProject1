package today.whatdo.festival.festivalinfo.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResultVO;

@Component
@PropertySource("classpath:env.properties")
@Slf4j
public class ApiNearFestivalInfo {
	@Autowired
	private ApiCall apiCall;
	@Value("${datago.url}")
	private String dataUrl;
	@Value("${festival.api.key}")
	private String festivalKey;
	
	public List<FestivalInformationVO> getLocationInformationByMap(FestivalInformationVO festivalInfo) {
		String url = dataUrl+"/locationBasedList?";
		url += "&radius=5000&contentTypeId=12&arrange=E&numOfRows=10&_type=json&MobileOS=ETC&MobileApp=APPTest&serviceKey=";
		url += festivalKey+"&mapX="+festivalInfo.getMapx()+"&mapY="+festivalInfo.getMapy();
		return apiCall.getDataToAPI(url, FestivalResultVO.class).getResponse().getBody().getItems().getItem();
	}
}
