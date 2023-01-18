package today.whatdo.festival.userinfo.controller;

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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.userinfo.service.UserInfoService;
import today.whatdo.festival.userinfo.vo.KakaoLoginVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Controller
@Slf4j
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;

	@GetMapping("/user-infos")
	public String getUserInfos(Model model, UserInfoVO userInfo) {
		log.info("userInfo=>{}", userInfo);
		model.addAttribute("userList", userInfoService.getUserInfos(userInfo));
		return "views/user-info/list";
	}

	@GetMapping("/user-infos/check/{uiId}")
	@ResponseBody
	public boolean existUserId(@PathVariable("uiId") String uiId) {
		return userInfoService.existsUserId(uiId);
	}

	@PostMapping("/user-infos")
	public @ResponseBody int addUserInfo(@RequestBody UserInfoVO userInfo) {
		return userInfoService.insertUserInfo(userInfo);
	}

	@PostMapping("/user-infos/{uiNum}")
	public @ResponseBody boolean checkPassword(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum) {
		return userInfoService.checkPassword(userInfo, uiNum);
	}

	@PatchMapping("/user-infos/{uiNum}")
	public @ResponseBody boolean modifyUserInfo(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum,
			HttpSession session) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("userInfo");
		if (sessionUserInfo == null || sessionUserInfo.getUiNum() != uiNum) {
			throw new RuntimeException("잘못된 정보 수정 입니다.");
		}
		userInfo.setUiNum(uiNum);
		return userInfoService.updateUserInfo(userInfo, session);
	}

	@DeleteMapping("/user-infos/{uiNum}")
	public @ResponseBody boolean removeUserInfo(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum) {
		return userInfoService.removeUserInfo(userInfo, uiNum);
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
	
	@PostMapping("/logout")
	public @ResponseBody UserInfoVO logout(@RequestBody UserInfoVO userInfo, HttpSession session) {
		UserInfoVO loginUserInfo = userInfoService.login(userInfo);
		if(loginUserInfo != null) {
			session.invalidate();
			
		}
		return null;
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
