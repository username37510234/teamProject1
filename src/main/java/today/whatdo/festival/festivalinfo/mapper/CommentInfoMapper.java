package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;

@Mapper
public interface CommentInfoMapper {

	List<CommentInfoVO> selectCommentInfoList(CommentInfoVO commentInfo);
	CommentInfoVO selectCommentInfo(int ciNum);
	int insertComment(CommentInfoVO vo);
	int updateCommentInfoActive(int ciNum);
	int updateCommentInfo(CommentInfoVO commentInfo);
	int deleteComment(int ciNum);
}
