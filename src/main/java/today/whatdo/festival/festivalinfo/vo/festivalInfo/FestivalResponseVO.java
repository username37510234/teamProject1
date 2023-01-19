package today.whatdo.festival.festivalinfo.vo.festivalInfo;

import java.util.List;

import lombok.Data;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.LinkedData.LinkedBindingsVO;

@Data
public class FestivalResponseVO {
	private FestivalInformationVO festivalInfo;
	private List<FestivalInformationVO> locationInfo;
	private List<LinkedBindingsVO> linkedInfo;
}
