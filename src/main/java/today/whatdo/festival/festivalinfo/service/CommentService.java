package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.CommentMapper;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@Service
public class CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	//댓글 작성
	public int commentWrite(CommentVO vo) {
		return commentMapper.commentWrite(vo);
	}
	
	//댓글 조회
	public List<CommentVO> commentList(int fiNum) {
		return commentMapper.commentList(fiNum);
	}
	
	//댓글 수정
	public int commentModify(CommentVO commentVO) {
		return commentMapper.commentModify(commentVO);
	}
	
	//댓글 삭제
	public void commentDelete(CommentVO commentVO) {
		commentMapper.commentDelete(commentVO);
		
	}
	
}
