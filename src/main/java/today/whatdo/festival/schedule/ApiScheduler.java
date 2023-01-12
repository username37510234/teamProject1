package today.whatdo.festival.schedule;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.api.ApiCall;
import today.whatdo.festival.service.FestivalInformationService;
import today.whatdo.festival.vo.festivalInfo.FestivalResultVO;

@Component
@Slf4j
@PropertySource("classpath:env.properties")
public class ApiScheduler {

	@Scheduled(cron = "0 0 0/24 * * *")
	public void test() {
		log.debug("schdule test");
	}

	@Autowired
	private FestivalInformationService festivalInformationService;
	@Autowired
	private ApiCall apiFestivalInfo;
	@Value("${datago.url}")
	private String dataUrl;

	@Scheduled(cron = "0 0 0 * * *")
	public void dailyFestivalInformation() {
		String searchUrl = "/searchFestival?serviceKey=ZZ4Do%2FeK7YDGJOvm0LEWn7KE7eXGMmLnrCZgmAM0pQjheTpS7FtRtdMWkCm82KDNXkAKnXNXsZ6Idisedsidzg%3D%3D&numOfRows=1000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&eventStartDate=";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = Date.from(Instant.now().plus(Duration.ofDays(30)));
		searchUrl += sdf.format(date);
		int result = festivalInformationService.dailyUpdateFestivalInformation(
				apiFestivalInfo.getDataToAPI(dataUrl + searchUrl, FestivalResultVO.class));
		log.debug("result=>{}", result);
	}
}
