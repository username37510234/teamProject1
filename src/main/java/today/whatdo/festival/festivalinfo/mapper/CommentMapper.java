package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentMapper {

	//댓글 등록
	int CommentRegist(CommentVO commentVO);
	//댓글 개수
	int getTotal(int fiNum);
	//목록 요청
	List<CommentVO> getList(int fiNum);
	//댓글 삭제
	void commentDelete(CommentVO vo);
}
