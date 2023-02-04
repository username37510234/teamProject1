package today.whatdo.festival.festivalinfo.vo.commentInfo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private int ciNum;
	private String ciWriter;
	private String ciContent;
	private Date ciRegdate;
	private int fiNum;
}

