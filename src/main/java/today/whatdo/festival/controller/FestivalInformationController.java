package today.whatdo.festival.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import today.whatdo.festival.service.FestivalInformationService;
import today.whatdo.festival.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.vo.festivalInfo.FestivalResponseVO;
import today.whatdo.festival.vo.festivalInfo.SearchParameterVO;

@RestController
public class FestivalInformationController {
	@Autowired
	private FestivalInformationService festivalInformationService;

	@GetMapping("/festival-infos")
	public List<FestivalInformationVO> getFestivalInformations(SearchParameterVO searchParameter){
		return festivalInformationService.getFestivalInformationListAll(searchParameter);
	}
	
	@GetMapping("/festival-info/{fiNum}")
	public FestivalResponseVO getFestivalInformation(@PathVariable("fiNum") int fiNum) {
		return festivalInformationService.getFestivalInformation(fiNum);
	}
}
