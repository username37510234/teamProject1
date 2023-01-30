package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;

import today.whatdo.festival.festivalinfo.service.FestivalInformationService;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalResponseVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.SearchParameterVO;

@RestController
public class FestivalInformationController {
	@Autowired
	private FestivalInformationService festivalInformationService;

	@GetMapping("/festival-infos")
	public PageInfo<FestivalInformationVO> getFestivalInformations(SearchParameterVO searchParameter){
		return festivalInformationService.getFestivalInformationListAll(searchParameter);
	}
	
	@GetMapping("/festival-info/{fiNum}")
	public FestivalResponseVO getFestivalInformation(@PathVariable("fiNum") int fiNum) {
		return festivalInformationService.getFestivalInformation(fiNum);
	}
	
	//마이리스트 축제 정보 불러오기
	@GetMapping("/festival-infos/{fiNum}")
	public FestivalInformationVO getFestivalInformationToMyList(@PathVariable("fiNum") int fiNum) {
		return festivalInformationService.selectFestivalInformationByNum(fiNum);
	}
	
	//메인 페이지 조회수 높은 축제 정보 10개 불러오기
	@GetMapping("/festival-infos/readcount")
	public List<FestivalInformationVO> getFestivalInformationToIndex(FestivalInformationVO festivalInfo) {
		return festivalInformationService.selectFestivalInformationByReadcount(festivalInfo);
	}
	
	//과거 축제 정보 리스트
	@GetMapping("/festival-infos-last")
	public PageInfo<FestivalInformationVO> getFinsihedInformations(SearchParameterVO searchParameter){
		return festivalInformationService.getFinishedInformationList(searchParameter);
	}
}
