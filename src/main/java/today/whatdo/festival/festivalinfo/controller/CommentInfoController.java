package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import today.whatdo.festival.festivalinfo.service.CommentInfoService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentInfoVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Controller
public class CommentInfoController {
	
	@Autowired
	private CommentInfoService commentInfoService;
	
	@GetMapping("/comment-infos")
	@ResponseBody
	public List<CommentInfoVO> getCommentInfos(@ModelAttribute CommentInfoVO commentInfo){
		return commentInfoService.getCommentInfos(commentInfo);
	}
	
	@GetMapping("/comment-infos/{ciNum}")
	@ResponseBody
	public CommentInfoVO getCommentInfos(@PathVariable int ciNum) {
		return commentInfoService.getCommentInfo(ciNum);
	}
	
	@PostMapping("/comment-infos")
	@ResponseBody
	public int insertCommentInfo(@RequestBody CommentInfoVO commentInfo, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
//		commentInfo.setFiNum(userInfo.getFiNum());  
		return commentInfoService.insertCommentInfo(commentInfo);
	}
	
	@PatchMapping("/comment-infos/{ciNum}")
	@ResponseBody
	public int updateCommentInfo(@RequestBody CommentInfoVO commentInfo, @PathVariable int ciNum) {
		commentInfo.setCiNum(ciNum);
		return commentInfoService.updateCommentInfo(commentInfo);
	}
	
	@DeleteMapping("/comment-infos/{ciNum}")
	@ResponseBody
	public int deleteCommentInfo(@PathVariable int ciNum) {
		return commentInfoService.updateCommentInfoActive(ciNum);
	}
	
	
}