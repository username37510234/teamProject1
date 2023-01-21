package today.whatdo.festival.festivalinfo.vo.dibInfo;

import java.util.List;

import lombok.Data;

@Data
public class DibInfoVO {
	
	private int diNum;
	private String diActive;
	private String diDate;
	private int uiNum;
	private int fiNum;
	private List<Integer> diNums;
}
