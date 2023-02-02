package today.whatdo.festival.festivalinfo.mapper;

import org.apache.ibatis.annotations.Mapper;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@Mapper
public interface CommentMapper {
	int enrollReply(CommentVO vo); //댓글 등록
	
	
}
