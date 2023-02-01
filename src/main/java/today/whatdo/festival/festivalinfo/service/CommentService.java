package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentService {

	//댓글 등록
	public int CommentRegist(CommentVO vo);
	
	//댓글 수정
	public int CommentUpdate(CommentVO vo);
	
	//댓글 삭제
	public int CommentDelete(CommentVO vo);
}
