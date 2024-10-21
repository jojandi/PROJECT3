package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.mes.MesPfworkDTO;

@Mapper
public interface PfworkDAO {
	
	// 주문현황 select
	List<MesPfworkDTO> selectpf(MesPfworkDTO pfDTO);
	int totalpf(MesPfworkDTO pfDTO);
	
	// 출고현황 select
	List<MesPfworkDTO> selectde(MesPfworkDTO pfDTO);
	int totalde(MesPfworkDTO pfDTO);
	
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
	
	// 주문현황 -> 작업지시서 insert
	int pfinsertwo(MesPfworkDTO pfDTO);
	
	// 작업지시서 생성버튼시 update
	int pfupdatepf(MesPfworkDTO pfDTO);
	
	

}
