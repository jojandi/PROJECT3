package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.gamja.mesPage.dto.MesMainDTO;

@Mapper
public interface MainDAO {
	
	List<MesMainDTO> selectAll();
	 List<MesMainDTO> getStatisticsByGenre(int year, int month);

}
