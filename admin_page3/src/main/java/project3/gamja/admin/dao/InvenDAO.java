package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.InvenDTO;

@Mapper
public interface InvenDAO {

	List<InvenDTO> selectInven(InvenDTO invenDTO);
	int totalInven();
	
}
