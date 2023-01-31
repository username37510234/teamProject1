package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentMapper {
	int CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(CommentVO vo); //댓글 리스트
	int CommentUpdate(CommentVO vo); //댓글 수정
	int CommentDelete(int ciNum); //댓글 삭제
	
}
