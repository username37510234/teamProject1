package today.whatdo.festival.mapper;

import java.util.List;

import today.whatdo.festival.vo.FileInfoVO;

public interface FileInfoMapper {

	List<FileInfoVO> selectFileInfos();
	int insertFileInfo(FileInfoVO fileInfo);
}
