package today.whatdo.festival.api;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import today.whatdo.festival.vo.boxoffice.BoxOfficeResponseVO;
import today.whatdo.festival.vo.boxoffice.DailyBoxOfficeListVO;

@Component
@PropertySource("classpath:env.properties")
public class ApiBoxOfficeByRestTemplate {
	@Value("${movie.url}")
	private String movieUrl;
	
	@Autowired
	private ApiCall apiCall;
	
	public List<DailyBoxOfficeListVO> getBoxOfficeList(int cnt){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = Date.from(Instant.now().minus(Duration.ofDays(cnt)));
		String sdfDate = sdf.format(date);
		List<DailyBoxOfficeListVO> result = apiCall.getDataToAPI(movieUrl+sdfDate, BoxOfficeResponseVO.class).getBoxOfficeResult().getDailyBoxOfficeList();
		for(DailyBoxOfficeListVO res: result) {
			res.setTargetDt(sdf.format(Date.from(Instant.now())));
		}
		return result;
	}

}
