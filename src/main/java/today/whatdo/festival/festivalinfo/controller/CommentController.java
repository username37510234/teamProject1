package today.whatdo.festival.festivalinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import today.whatdo.festival.festivalinfo.service.CommentService;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postwrite(CommentVO vo) throws Exception {
		commentService.commentWrite(vo);
		
		return "redirect:/views/festivalInfo/viewItem?fiNum=" + vo.getFiNum();
	}
	

}
