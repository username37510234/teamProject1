package today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class LinkedValueVO {
	private String type;
	private String value;
}
