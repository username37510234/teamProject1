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

import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	//댓글 리스트
	@GetMapping("/comment-list")
	@ResponseBody
	public List<CommentVO> getCommentInfos(@ModelAttribute CommentVO vo) {
		return commentService.getCommentInfos(vo);
	}
	
	//댓글 등록
	@PostMapping("/comment-lists")
	@ResponseBody
	public int insertCommentInfo(@RequestBody CommentVO vo, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		vo.setUiId(userInfo.getUiId());
		return commentService.insertCommentInfo(vo);
	}
	
	//댓글 수정
	@PatchMapping("/comment-lists/{ciNum}")
	@ResponseBody
	public int updateCommentInfo(@RequestBody CommentVO vo, @PathVariable int ciNum) {
		vo.setCiNum(ciNum);
		return commentService.updateCommentInfo(ciNum);
	}
	
	//댓글 삭제
	@DeleteMapping("/comment-lists/{ciNum}")
	@ResponseBody
	public int deleteBoardInfo(@PathVariable int ciNum) {
		return commentService.deleteCommentInfo(ciNum);
	}
}
