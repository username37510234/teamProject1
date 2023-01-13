package today.whatdo.festival.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import today.whatdo.festival.service.FestivalInformationService;
import today.whatdo.festival.vo.festivalInfo.FestivalInformationVO;

@RestController
public class FestivalInformationController {
	@Autowired
	private FestivalInformationService festivalInformationService;

	@GetMapping("/festival-infos")
	public List<FestivalInformationVO> getFestivalInformations(FestivalInformationVO festivalInfo){
		return festivalInformationService.getFestivalInformationListAll(festivalInfo);
	}
}
