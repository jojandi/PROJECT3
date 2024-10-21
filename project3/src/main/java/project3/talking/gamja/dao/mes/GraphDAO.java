package project3.talking.gamja.dao.mes;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.talking.gamja.dto.mes.MesGraphDTO;

@Mapper
public interface GraphDAO {


    List<MesGraphDTO> selectAll();

    // 도서출고통계 그래프
    List<MesGraphDTO> getStatisticsByGenre(@Param("year") int year, @Param("month") int month);

    List<MesGraphDTO> selectAll_demand();
    // 도서수요통계 그래프
    List<MesGraphDTO> getStatisticsByGenreForDemand(@Param("year") int year, @Param("month") int month);
   
    List<MesGraphDTO> selectAll_total();
    // 도서수요예측통계 그래프
    List<MesGraphDTO> getForecastData(@Param("year") int year, @Param("month") int month);
}
