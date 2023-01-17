package today.whatdo.festival.festivalinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import today.whatdo.festival.festivalinfo.mapper.DibInformationMapper;
import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;

@Service
public class DibInformationService {
	
	@Autowired
	private DibInformationMapper dibInformationMapper;
	
	public List<DibInfoVO> getDibInformationList(){
		return dibInformationMapper.selectDibInformationList();
	}
	
	public DibInfoVO getDibInformation() {
		return dibInformationMapper.selectDibInformation();
	}
	
	public int insertDibInformation(DibInfoVO dibInfo) {
		return dibInformationMapper.insertDibInformation(dibInfo);
	}
}
