package today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData;

import java.util.List;

import lombok.Data;

@Data
public class LinkedBindingsVO {
	private LinkedValueVO resource;
	private LinkedValueVO label;
	private LinkedValueVO address;
	private LinkedValueVO category;
	private LinkedValueVO startDate;
	private LinkedValueVO endDate;
	private LinkedValueVO location;
	private LinkedValueVO postalCode;
	private LinkedValueVO showTime;
	private LinkedValueVO name;
	private LinkedValueVO description;
	private LinkedValueVO depiction;
}
