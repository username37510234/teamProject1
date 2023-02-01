package today.whatdo.festival.festivalinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.CommentMapper;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@Service
public class CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	//댓글 등록
	public int CommentRegist(CommentVO vo) {
		return commentMapper.CommentRegist(vo);
	}
		
	//댓글 수정
	public int CommentUpdate(CommentVO vo) {
		return commentMapper.CommentUpdate(vo);
	}
	
	//댓글 삭제
//	public int CommentDelete(int ciNum) {
//		return commentMapper.CommentDelete(int ciNum);
//	}
}
