package today.whatdo.festival.festivalinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@RestController
@RequestMapping("/reply")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	//댓글 등록
	@PostMapping("/enroll")
	public void enrollReplyPOST(CommentVO vo) {
		commentService.enrollReply(vo);
	}
}
