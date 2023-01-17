package today.whatdo.festival.festivalinfo.vo.festivalInfo;

import java.util.List;

import lombok.Data;

@Data
public class FestivalResponseVO {
	FestivalInformationVO festivalInfo;
	List<FestivalInformationVO> locationInfo;
}
