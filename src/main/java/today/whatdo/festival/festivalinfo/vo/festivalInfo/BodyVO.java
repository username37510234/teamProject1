package today.whatdo.festival.festivalinfo.vo.festivalInfo;

import lombok.Data;

@Data
public class BodyVO {
	private ItemsVO items;
	private int numOfRows;
	private int PageNo;
	private int totalCount;
}
