package today.whatdo.festival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import today.whatdo.festival.vo.commentInfo.CommentInformationVO;

@Mapper
public interface CommentInformationMapper {

	int insertCommentInformations(@Param("CommentInfoList") List<CommentInformationVO> CommentInfoList );
	
	int insertCommentInformation(CommentInformationVO commentInfo);
	
	CommentInformationVO selectCommentInformation(int ciNum);
	
	int updateCommentInformation(CommentInformationVO commentInfo);
	
	int deleteCommentInformation(int ciNum);
}
