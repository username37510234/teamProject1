package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.CommentInfoMapper;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;

@Service
public class CommentInfoService {

	@Autowired
	private CommentInfoMapper commentInfoMapper;
	
	public List<CommentInfoVO> getCommentInfos(CommentInfoVO commentInfo){
		return commentInfoMapper.selectCommentInfoList(commentInfo);
	}
	
	public int insertCommentInfo(CommentInfoVO commentInfo) {
		return commentInfoMapper.insertCommentInfo(commentInfo);
	}
	
	public CommentInfoVO getCommentInfo(int ciNum) {
		return commentInfoMapper.selectCommentInfo(ciNum);
	}

	public int updateCommentInfoActive(int ciNum) {
		return commentInfoMapper.updateCommentInfoActive(ciNum);
	}
	public int updateCommentInfo(CommentInfoVO commentInfo) {
		return commentInfoMapper.updateCommentInfo(commentInfo);
	}
	public int deleteCommentInfo(int ciNum) {
		return commentInfoMapper.deleteCommentInfo(ciNum);
	}
}
