package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	//댓글 등록
	@PostMapping("/regist")
	public void commentRegistPOST(CommentVO vo) {
		commentService.CommentRegist(vo);
	}
	
	//댓글 수정
	@PostMapping("/update")
	public void commentUpdatePOST(CommentVO vo) {
		commentService.CommentUpdate(vo);
	}
	
	//댓글 삭제
	@PostMapping("/delete")
	public void commentDeletePOST(CommentVO vo) {
		commentService.CommentDelete(vo);
	}
}
