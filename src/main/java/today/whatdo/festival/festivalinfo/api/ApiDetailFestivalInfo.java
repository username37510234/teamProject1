package today.whatdo.festival.festivalinfo.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	@Autowired
	private ObjectMapper om;
	
	public FestivalInformationVO getFestivalInformationDetail(FestivalInformationVO festivalInfo) {
		String url = dataUrl+"/detailCommon?";
		url += "&contentTypeId=15&_type=json&MobileOS=ETC&MobileApp=APPTest&overviewYN=Y&defaultYN=Y&serviceKey=";
		url += festivalKey+"&contentId="+festivalInfo.getContentid();
		Map<String,Object> result = apiCall.getDataToAPI(url, Map.class);

		int numOfRows = (int)((Map<String,Object>)((Map<String,Object>)result.get("response")).get("body")).get("numOfRows");
		if(numOfRows==0) {
			return null;
		}

		FestivalResultVO result2 = om.convertValue(result, FestivalResultVO.class);
		if(result2 != null && result2.getResponse().getBody().getNumOfRows()!=0) {
		return result2.getResponse().getBody().getItems().getItem().get(0);
		}
		return null;
	}
}
