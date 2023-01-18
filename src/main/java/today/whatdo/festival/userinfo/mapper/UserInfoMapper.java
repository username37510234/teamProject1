package today.whatdo.festival.userinfo.mapper;

import java.util.List;

import today.whatdo.festival.userinfo.vo.UserInfoVO;

public interface UserInfoMapper {

	List<UserInfoVO> selectUserInfoList(UserInfoVO userInfo);
	UserInfoVO selectUserInfoById(String uiId);
	UserInfoVO selectUserInfo(int uiNum);
	UserInfoVO selectUserInfoByIdAndPwd(UserInfoVO userInfo);
	UserInfoVO selectUserInfoByKakaoID(String uiKakaoId);
	int insertUserInfo(UserInfoVO userInfo);
	int updateUserInfo(UserInfoVO userInfo);
	int deleteUserInfo(int uiNum);
	
}

