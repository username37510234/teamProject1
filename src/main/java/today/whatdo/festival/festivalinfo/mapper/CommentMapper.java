package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentMapper {

	//댓글 조회
	List<CommentVO> commentList(int fiNum);
	//댓글 작성
	int commentWrite(CommentVO vo);
	//댓글 수정
	int commentModify(CommentVO vo);
	//댓글 삭제
	int commentDelete(CommentVO vo);
	
}
