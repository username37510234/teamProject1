package today.whatdo.festival.vo.boxoffice;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class BoxOfficeResultVO {
	private String boxofficeType;
	private String showRange;
	private List<DailyBoxOfficeListVO> dailyBoxOfficeList;
}
