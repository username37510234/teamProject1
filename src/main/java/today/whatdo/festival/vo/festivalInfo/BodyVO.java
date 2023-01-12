package today.whatdo.festival.vo.festivalInfo;

import lombok.Data;

@Data
public class BodyVO {
	private ItemsVO items;
	private int numOfRows;
	private int PageNo;
	private int totalCount;
}
