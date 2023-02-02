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
	public int enrollReply(CommentVO vo) {
		return commentMapper.enrollReply(vo);
	}
}
