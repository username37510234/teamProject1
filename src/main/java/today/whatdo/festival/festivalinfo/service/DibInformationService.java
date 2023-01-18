package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.DibInformationMapper;
import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;

@Service
public class DibInformationService {
	
	@Autowired
	private DibInformationMapper dibInformationMapper;
	
	public List<DibInfoVO> getDibInformationList(DibInfoVO dibInfo){
		return dibInformationMapper.selectDibInformationList(dibInfo);
	}
	
	public int insertDibInformation(DibInfoVO dibInfo) {
		return dibInformationMapper.insertDibInformation(dibInfo);
	}
	
	public int deleteDibInformation(int diNum) {
		return dibInformationMapper.deleteDibInformation(diNum);
	}
}
