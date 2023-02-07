package today.whatdo.festival.auth;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import today.whatdo.festival.festivalinfo.vo.mylist.MyListVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Service
public class CheckSessionUserInfo {
	
	public void checkSession(@ModelAttribute MyListVO myList, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			//RuntimeExeption이 워낙 종류가 많기 때문에 원래는 상속받아서 사용해야 한다.
			//때문에 sonarLint에서 잡힌다.
			throw new NullPointerException("로그인이 필요합니다.");
		}
		myList.setUiNum(userInfo.getUiNum());
	}
}
