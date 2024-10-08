package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesPfworkDTO;

@Mapper
public interface PfworkDAO {
	
	// 주문현황, 출고현황 select
	List<MesPfworkDTO> selectpf(MesPfworkDTO pfDTO);
	int totalpf(MesPfworkDTO pfDTO);
	
	// 주문현황 Read
	MesPfworkDTO selectOne(MesPfworkDTO pfDTO);
	
	// 주문현황 id값 보내서 select 옵션 주기
	List<MesPfworkDTO> selectEmployee();
	List<MesPfworkDTO> selectBom();
	List<MesPfworkDTO> selectBookflix();
	
	// 주문현황 insert
	int insertpf(MesPfworkDTO pfDTO);
	
	// 주문현황 update
	int updatepf(MesPfworkDTO pfDTO);
	
	// 주문현황 delete
	int deletepf(MesPfworkDTO pfDTO);

}