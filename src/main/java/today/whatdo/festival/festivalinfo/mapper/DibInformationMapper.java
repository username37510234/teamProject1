package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;

public interface DibInformationMapper {
	
	List<DibInfoVO> selectDibInformationList();
	DibInfoVO selectDibInformation();
	int insertDibInformation(DibInfoVO dibInfo);
	
}
