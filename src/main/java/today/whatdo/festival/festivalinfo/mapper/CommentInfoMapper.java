package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;

@Mapper
public interface CommentInfoMapper {

	List<CommentInfoVO> selectCommentInfoList(CommentInfoVO commentInfo);
	CommentInfoVO selectCommentInfo(int ciNum);
	int insertCommentInfo(CommentInfoVO commentInfo);
	int updateCommentInfoActive(int ciNum);
	int updateCommentInfo(CommentInfoVO commentInfo);
	int deleteCommentInfo(int ciNum);
}
