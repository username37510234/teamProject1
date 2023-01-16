package today.whatdo.festival.vo.festivalInfo;

import java.util.List;

import lombok.Data;

@Data
public class FestivalResponseVO {
	FestivalInformationVO festivalInfo;
	List<FestivalInformationVO> locationInfo;
}
