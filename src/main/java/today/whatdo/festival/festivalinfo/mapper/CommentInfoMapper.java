package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;

public interface CommentInfoMapper {

	public List<CommentInfoVO> selectCommentInfoList(CommentInfoVO commentInfo);
	CommentInfoVO selectCommentInfo(int ciNum);
	int insertComment(CommentInfoVO vo);
	int updateCommentInfoActive(int ciNum);
	int updateCommentInfo(CommentInfoVO commentInfo);
	int deleteComment(int ciNum);
}
