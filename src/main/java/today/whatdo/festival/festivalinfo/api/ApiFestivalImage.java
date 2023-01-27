package today.whatdo.festival.festivalinfo.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResultVO;

@Component
@PropertySource("classpath:env.properties")
public class ApiFestivalImage {
	@Autowired
	private ApiCall apiCall;
	@Value("${datago.url}")
	private String dataUrl;
	@Value("${festival.api.key}")
	private String festivalKey;
	
	public List<FestivalInformationVO> getFestivalImages(FestivalInformationVO festivalInfo) {
		String url = dataUrl+"/detailImage?";
		url += "_type=json&MobileOS=ETC&MobileApp=APPTest&subImageYN=Y&serviceKey=";
		url += festivalKey+"&contentId="+festivalInfo.getContentid();
		FestivalResultVO result = apiCall.getDataToAPI(url, FestivalResultVO.class);
		if(result != null) {
		return result.getResponse().getBody().getItems().getItem();
		}
		return null;
	}

}
