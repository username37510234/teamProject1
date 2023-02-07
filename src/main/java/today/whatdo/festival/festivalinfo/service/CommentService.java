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
	
	//댓글 등록
	public int commentRegist(CommentVO commentVO) {
		return commentMapper.commentRegist(commentVO);
	}
	
	//댓글 갯수
	public int getTotal(int fiNum) {
		return commentMapper.getTotal(fiNum);
	}
	
	//목록 요청
	public List<CommentVO> getList(int fiNum) {
		return commentMapper.getList(fiNum);
	}
	
	//댓글 삭제
	public void commentDelete(CommentVO commentVO) {
		commentMapper.commentDelete(commentVO);
		
	}
	
	
	
}
