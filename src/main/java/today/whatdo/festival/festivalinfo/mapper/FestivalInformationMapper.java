package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import today.whatdo.festival.festivalinfo.vo.festivalInfo.FestivalInformationVO;
import today.whatdo.festival.festivalinfo.vo.festivalInfo.SearchParameterVO;

@Mapper
public interface FestivalInformationMapper {
	int insertFestivalInformations(@Param("FestivalInfoList") List<FestivalInformationVO> FestivalInfoList);

	int insertFestivalInformation(FestivalInformationVO festivalInfo);
	
	FestivalInformationVO selectFestivalInformation(String contentId);
	
	FestivalInformationVO selectFestivalInformationByNum(int fiNum);
	
	int updateFestivalInformation(FestivalInformationVO festivalInfo);
	
	List<FestivalInformationVO> selectFestivalInformationLists(SearchParameterVO searchParameter);
}
