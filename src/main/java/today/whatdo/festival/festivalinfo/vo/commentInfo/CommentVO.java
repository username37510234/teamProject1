package today.whatdo.festival.festivalinfo.vo.commentInfo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	private int ciNum;
	private String ciWriter;
	private String ciContent;
	private Timestamp ciRegdate;
	private int fiNum;
}

