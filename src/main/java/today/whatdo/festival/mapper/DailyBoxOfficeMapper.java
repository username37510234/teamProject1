package today.whatdo.festival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import today.whatdo.festival.vo.boxoffice.DailyBoxOfficeListVO;

@Mapper
public interface DailyBoxOfficeMapper {
	int insertDailyBoxOffices(@Param("boxOfficeList") List<DailyBoxOfficeListVO> boxOfficeParameter);
	int insertBoxOffice(DailyBoxOfficeListVO boxOfficeParameter);
	List<DailyBoxOfficeListVO> selectBoxOfficeList(DailyBoxOfficeListVO boxOfficeParameter);
}
