package today.whatdo.festival.festivalinfo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;

public interface DibInformationMapper {
	
	List<DibInfoVO> selectDibInformationList(DibInfoVO dibInfo);
	int insertDibInformation(DibInfoVO dibInfo);
	int deleteDibInformation(int diNum);
	int deleteDibInformations(@Param("diNums") List<Integer> diNums);
}
