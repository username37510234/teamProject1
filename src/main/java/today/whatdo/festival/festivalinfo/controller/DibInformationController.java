package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import today.whatdo.festival.festivalinfo.service.DibInformationService;
import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;


@Controller
public class DibInformationController {
	
	@Autowired
	private DibInformationService dibInformationService;
	
	@GetMapping("/dib-infos")
	@ResponseBody
	public List<DibInfoVO> getDibInformationList(@ModelAttribute DibInfoVO dibInformation, Model model){
		return dibInformationService.getDibInformationList();
	}
	
	@GetMapping("/dib-infos/{diNum}")
	@ResponseBody
	public DibInfoVO getDibInformation(@PathVariable int diNum){
		return dibInformationService.getDibInformation();
	}
	
	//로그인 돼있어야, 등록 가능
	@PostMapping("/dib-infos")
	@ResponseBody
	public int insertDibInformation(@RequestBody DibInfoVO dibInformation, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		dibInformation.setUiNum(userInfo.getUiNum());
		return dibInformationService.insertDibInformation(dibInformation);
	}
	
	@DeleteMapping("/dib-infos/{diNum}")
	@ResponseBody
	public int deleteBoardInfo(@PathVariable int diNum) {
		return dibInformationService.deleteDibInformation(diNum);
	}
	
}
