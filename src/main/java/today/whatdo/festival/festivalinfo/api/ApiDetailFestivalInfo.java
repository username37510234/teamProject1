package today.whatdo.festival.festivalinfo.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResultVO;

@Component
@PropertySource("classpath:env.properties")
public class ApiDetailFestivalInfo {
	@Autowired
	private ApiCall apiCall;
	@Value("${datago.url}")
	private String dataUrl;
	@Value("${festival.api.key}")
	private String festivalKey;
	
	public FestivalInformationVO getFestivalInformationDetail(FestivalInformationVO festivalInfo) {
		String url = dataUrl+"/detailCommon?";
		url += "&contentTypeId=15&_type=json&MobileOS=ETC&MobileApp=APPTest&overviewYN=Y&defaultYN=Y&serviceKey=";
		url += festivalKey+"&contentId="+festivalInfo.getContentid();
		FestivalResultVO result = apiCall.getDataToAPI(url, FestivalResultVO.class);
		if(result != null) {
		return result.getResponse().getBody().getItems().getItem().get(0);
		}
		return null;
	}
}
