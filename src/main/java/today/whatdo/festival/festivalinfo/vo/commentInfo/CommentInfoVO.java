package today.whatdo.festival.festivalinfo.vo.commentInfo;

import lombok.Data;

@Data
public class CommentInfoVO {

	private int ciNum;
	private String ciWriter;
	private String ciContent;
	private String ciRegdate;
	private String ciActive;
	
	private int fiNum;

}
