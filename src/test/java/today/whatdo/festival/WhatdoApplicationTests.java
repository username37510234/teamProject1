package today.whatdo.festival;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.api.ApiCall;
import today.whatdo.festival.service.FestivalInformationService;
import today.whatdo.festival.vo.festivalInfo.FestivalResultVO;

@SpringBootTest
@PropertySource("classpath:env.properties")
@Slf4j
class WhatdoApplicationTests {
	@Autowired
	private FestivalInformationService festivalInformationService;
	@Autowired
	private ApiCall apiCall;
	@Value("${datago.url}")
	private String dataUrl;

	@Test
	void contextLoads() {
		String searchUrl = "/searchFestival?serviceKey=ZZ4Do%2FeK7YDGJOvm0LEWn7KE7eXGMmLnrCZgmAM0pQjheTpS7FtRtdMWkCm82KDNXkAKnXNXsZ6Idisedsidzg%3D%3D&numOfRows=1000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&eventStartDate=";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = Date.from(Instant.now().plus(Duration.ofDays(10)));
		searchUrl += sdf.format(date);
		
		int result = festivalInformationService.dailyUpdateFestivalInformation(
				apiCall.getDataToAPI(dataUrl + searchUrl, FestivalResultVO.class));
		log.debug("result=>{}",result);
	}

}
