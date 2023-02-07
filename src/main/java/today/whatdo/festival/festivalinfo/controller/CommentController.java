package today.whatdo.festival.festivalinfo.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@RestController
@Slf4j
@RequestMapping("/Comment")
public class CommentController {
	
	
	@Autowired
	private CommentService commentService;

	@PostMapping("/InsertComment")
	public String insertComment(@RequestBody CommentVO vo, HttpSession session) {
		log.info("댓글 등록 통신 성공");
		if(session.getAttribute("login")==null) {
			return "fail";
		}else {
			log.info("로그인함. 스크랩 진행");
			commentService.commentRegist(vo);
			return "InsertSuccess";
		}
	}

	@GetMapping("/CommentList/{fiNum}")
	public Map<String, Object> getList(@PathVariable int fiNum) {
		log.info("댓글 목록 컨트롤러 동작");
		List<CommentVO> list = commentService.getList(fiNum);
		int total = commentService.getTotal(fiNum);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}
	
}
