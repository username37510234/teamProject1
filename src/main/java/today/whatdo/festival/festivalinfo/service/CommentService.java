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
	
	//댓글 리스트
	public List<CommentVO> getCommentInfos(CommentVO vo){
		return commentMapper.selectCommentInfoList(vo);
	}
	
	//댓글 등록
	public int insertCommentInfo(CommentVO vo) {
		return commentMapper.insertCommentInfo(vo);
	}
	
	//댓글 수정
	public int updateCommentInfo(int ciNum) {
		return commentMapper.updateCommentInfo(ciNum);
	}
	
	//댓글 삭제
	public int deleteCommentInfo(int ciNum) {
		return commentMapper.deleteCommentInfo(ciNum);
	}
}
