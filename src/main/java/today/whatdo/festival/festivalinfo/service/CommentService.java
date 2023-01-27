package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.commentServiceImpl.CommentServiceImpl;
import today.whatdo.festival.festivalinfo.mapper.CommentMapper;
import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

@Service
public class CommentService implements CommentServiceImpl {

	@Autowired
	private CommentMapper mapper;
	
	@Override
	public void CommentRegist(CommentVO vo) {
		mapper.CommentRegist(vo);

	}

	@Override
	public List<CommentVO> getList(int ciNum) {
		return mapper.getList(ciNum);
	}

	@Override
	public int getTotal(int ciNum) {
		return mapper.getTotal(ciNum);
	}

	@Override
	public int commentDelete(int ciNum) {
		return mapper.commentDelete(ciNum);

	}


}
