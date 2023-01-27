package today.whatdo.festival.festivalinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@RestController
@RequestMapping("/Comment")
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	@PostMapping("/InsertComment")
	public String InsertComment(@RequestBody CommentVO vo,HttpSession session) {
		System.out.println("댓글 등록 통신 성공");
		if(session.getAttribute("login") == null) {
			return "fail";
		} else {
			System.out.println("로긘함. 스크랩 진행");
			
			service.CommentRegist(vo);
			System.out.println("댓글 등록 서비스 성공");
			return "InsertSuccess";
		}
	}

	@GetMapping("/CommentList/{fiNum}")
	public Map<String, Object> getList(@PathVariable int fiNum, Model model) {
		System.out.println("댓글 목록 컨트롤러 동작");
		List<CommentVO> list = service.getList(fiNum);
		int total = service.getTotal(fiNum);
		
		ModelAndView view = new ModelAndView();
		System.out.println("댓글 갯수 " + service.getTotal(fiNum));
		view.setViewName("/board/JBoardList");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;
	}
}
