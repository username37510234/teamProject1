package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

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
	public int insertComment(@RequestBody CommentInfoVO commentInfo) {
		return commentInfoService.insertComment(commentInfo);
	}
	
	@DeleteMapping("/comment-infos/{ciNum}")
	@ResponseBody
	public int deleteBoardInfo(@PathVariable int ciNum) {
		return commentInfoService.deleteComment(ciNum);
	}
	
	@PatchMapping("/comment-infos/{ciNum}")
	@ResponseBody
	public int updateCommentInfo(@RequestBody CommentInfoVO commentInfo, @PathVariable int ciNum) {
		commentInfo.setCiNum(ciNum);
		return commentInfoService.updateCommentInfo(commentInfo);
	}
	
}