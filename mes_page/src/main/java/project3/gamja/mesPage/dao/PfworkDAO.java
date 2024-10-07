package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesPfworkDTO;

@Mapper
public interface PfworkDAO {
	
	List<MesPfworkDTO> selectpf(MesPfworkDTO pfDTO);
	int totalpf(MesPfworkDTO pfDTO);

}
