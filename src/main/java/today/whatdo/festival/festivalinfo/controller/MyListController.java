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

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.festivalinfo.service.MyListService;
import today.whatdo.festival.festivalinfo.vo.mylist.MyListVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Controller
@Slf4j
public class MyListController {
	
	@Autowired
	private MyListService myListService;
	
	//로그인이 돼있어야 마이리스트 전부 불러오기 가능
	@GetMapping("/my-lists")
	@ResponseBody
	public List<MyListVO> getMyLists(@ModelAttribute MyListVO myList, Model model, HttpSession session){
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		myList.setUiNum(userInfo.getUiNum());
		model.addAttribute("myList", myList);
		return myListService.getMyLists(myList);
	}
	
	//로그인 돼있어야 마이리스트 추가 가능
	@PostMapping("/my-lists")
	@ResponseBody
	public int insertMyList(@RequestBody MyListVO myList, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		myList.setUiNum(userInfo.getUiNum());
		return myListService.insertMyList(myList);
	}
	
	//로그인 돼있어야 마이리스트 삭제 가능
	@DeleteMapping("/my-lists/{fiNum}")
	@ResponseBody
	public int deleteMyList(@PathVariable("fiNum") int fiNum, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		MyListVO myList = new MyListVO();
		myList.setUiNum(userInfo.getUiNum());
		return myListService.deleteMyList(fiNum);
	}
	
	//로그인 돼있어야 마이리스트 선택 삭제 가능
	@DeleteMapping("/my-lists")
	@ResponseBody
	public int deleteMyLists(@RequestBody MyListVO myList, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		myList.setUiNum(userInfo.getUiNum());
		log.info("myList=>{}", myList);
		return myListService.deleteMyLists(myList.getMlNums());
	}
	
}
