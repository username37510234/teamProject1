package today.whatdo.festival.userinfo.vo;

import lombok.Data;

@Data
public class UserInfoVO {

	private int uiNum;
	//uiId는 카카오에서 받은 code 값
	private String uiId;
	private String uiName;
	private String uiNickname;
	private String uiPwd;
	private String uiActive;
	private String uiCredat;
	
}
