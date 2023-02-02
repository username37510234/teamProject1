package today.whatdo.festival.festivalinfo.vo.commentInfo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private int ciNum;
	private int fiNum;
	private String uiId;
	private Date ciRegdate;
	private String ciContent;
}

