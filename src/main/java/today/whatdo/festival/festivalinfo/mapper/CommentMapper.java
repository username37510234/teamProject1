package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentMapper {
	void CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(int com_bno); //목록 요청
	int getTotal(int com_bno); //댓글 개수
	int commentDelete(CommentVO vo); //댓글 삭제
	
}
