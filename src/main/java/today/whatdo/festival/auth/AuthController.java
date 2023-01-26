package today.whatdo.festival.auth;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import today.whatdo.festival.userinfo.service.UserInfoService;
import today.whatdo.festival.userinfo.vo.KakaoLoginVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private UserInfoService userInfoService;

	@GetMapping("/login")
	public String login(HttpSession session) {
		if (session != null) {
			return "redirect:/";
		}
		
		return "views/user-info/login";
	}
	
	@PostMapping("/login")
	public @ResponseBody UserInfoVO login(@RequestBody UserInfoVO userInfo, HttpSession session) {
		UserInfoVO loginUserInfo = userInfoService.login(userInfo);
		if (loginUserInfo != null) {
			session.setAttribute("userInfo", loginUserInfo);
			loginUserInfo.setUiPwd(null);
		}
		return loginUserInfo;
	}
	
	@GetMapping("/view")
	public String myInfo() {
		return "views/user-info/view";
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("session :: " + session);
		session.invalidate(); //세션무효화
		
		return "redirect:/";
	}
	
	

	@GetMapping("/oauth")
	public String oauth(@RequestParam("code") String code, Model model, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		String uri = "https://kauth.kakao.com/oauth/token";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("grant_type", "authorization_code");
		map.add("client_id", "bd9229e30ac2706e3c2f266a26c27c7d");
		map.add("redirect_uri", "http://localhost/oauth");
		map.add("code", code);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		ResponseEntity<KakaoLoginVO> res = restTemplate.postForEntity(uri, request, KakaoLoginVO.class);

		KakaoLoginVO kakaoLogin = res.getBody();
		uri = "https://kapi.kakao.com/v2/user/me";
		headers.set("Authorization", "Bearer " + kakaoLogin.getAccess_token());

		res = restTemplate.postForEntity(uri, request, KakaoLoginVO.class);
		kakaoLogin = res.getBody();

		UserInfoVO loginUserInfo = userInfoService.selectUserInfoByUiKakaoID(kakaoLogin.getId());
		if (loginUserInfo == null) {
			model.addAttribute("uiKakaoId", kakaoLogin.getId());
			return "views/user-info/join";
		}
		session.setAttribute("userInfo", loginUserInfo);
		return "/";
	}
}