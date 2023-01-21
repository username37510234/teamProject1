package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.CommentInfoMapper;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;

@Service
public class CommentInfoService {

	@Autowired
	private CommentInfoMapper mapper;
	
	public List<CommentInfoVO> getCommentInfos(CommentInfoVO commentInfo){
		return mapper.readComment(commentInfo);
	}
	
	public CommentInfoVO getCommentInfo(int ciNum) {
		return mapper.selectCommentInfo(ciNum);
	}
	
	public int insertCommentInfo(CommentInfoVO commentInfo) {
		return mapper.insertCommentInfo(commentInfo);
	}
	
	public int updateCommentInfoActive(int ciNum) {
		return mapper.updateCommentInfoActive(ciNum);
	}
	public int updateCommentInfo(CommentInfoVO commentInfo) {
		return mapper.updateCommentInfo(commentInfo);
	}
	
	public int deleteCommentInfo(int ciNum) {
		return mapper.deleteCommentInfoint(ciNum);
	}
}
