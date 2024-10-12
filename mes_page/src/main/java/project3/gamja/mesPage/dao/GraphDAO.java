package project3.gamja.mesPage.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.gamja.mesPage.dto.MesGraphDTO;

@Mapper
public interface GraphDAO {


    List<MesGraphDTO> selectAll();

    // 도서출고통계 그래프
    List<MesGraphDTO> getStatisticsByGenre(@Param("year") int year, @Param("month") int month);
}
