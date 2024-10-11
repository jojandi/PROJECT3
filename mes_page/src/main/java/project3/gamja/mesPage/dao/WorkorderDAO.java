package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesWorkorderDTO;

@Mapper
public interface WorkorderDAO {
	
	// workorder select
	List<MesWorkorderDTO> selectwo(MesWorkorderDTO woDTO);
	int totalwo(MesWorkorderDTO woDTO);
	
	// workorder Read
	MesWorkorderDTO selectOne(MesWorkorderDTO woDTO);
	
	// workworder delete
	int deletewo(MesWorkorderDTO woDTO);
	
	// workworder update
	int updatewo(MesWorkorderDTO woDTO);
	
	// workworder insert
	int insertwo(MesWorkorderDTO woDTO);
	
	// workorder bom_code select
	List<MesWorkorderDTO> selectBom();
	
	// ----------------BOM 페이지입니다----------------------
	List<MesWorkorderDTO> getList2();
	
	MesWorkorderDTO mesBomRead(MesWorkorderDTO dto);
	
	List<MesWorkorderDTO> bomSelect();
	
	int updatebom(MesWorkorderDTO DTO);
}
