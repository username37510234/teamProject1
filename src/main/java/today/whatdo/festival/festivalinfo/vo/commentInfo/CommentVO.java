package today.whatdo.festival.festivalinfo.vo.commentInfo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	
	private int ciNum;
	private String ciWriter;
	private String ciContent;
	private Timestamp ciRegdate;
	private int fiNum;
}

