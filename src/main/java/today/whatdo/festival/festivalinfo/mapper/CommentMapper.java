package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentMapper {
	
	//댓글 리스트
	List<CommentVO> selectCommentInfoList(CommentVO vo);
	//댓글 등록
	int insertCommentInfo(CommentVO vo); 
	//댓글 수정
	int updateCommentInfo(int ciNum);
	//댓글 삭제
	int deleteCommentInfo(int ciNum);
	
	
}
