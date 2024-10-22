package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.mes.MesWorkorderDTO;

@Mapper
public interface WorkorderDAO {
	
	// workorder select
	List<MesWorkorderDTO> selectwo(MesWorkorderDTO woDTO);
	int totalwo(MesWorkorderDTO woDTO);
	
	// log update
	int logUpdate(MesWorkorderDTO woDTO);
	
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
	
	// 포장공정에서 제조공정으로 바꾸는 update문
	int updatewopro(MesWorkorderDTO woDTO);
	
	// 완료버튼시 주문현황 update
	int updatepf(MesWorkorderDTO woDTO);
	
	// 완료버튼시 출고현황 insert
	int insertpf(MesWorkorderDTO woDTO);
	
	// 작업지시서 완료시 도서발주 페이지 update
	int requestpf(MesWorkorderDTO woDTO);
	
	// 작업지시서 완료시 작업지시서 완료로 update
	int updateworead(MesWorkorderDTO woDTO);
	
	// ----------------BOM 페이지입니다----------------------
	List<MesWorkorderDTO> getList2(MesWorkorderDTO dto);
	
	int totalBom(MesWorkorderDTO dto);
	
	MesWorkorderDTO mesBomRead(MesWorkorderDTO dto);
	
	List<MesWorkorderDTO> bomSelect();
	
	int updatebom(MesWorkorderDTO DTO);
	
	int insertBom(MesWorkorderDTO dto);
	
	List<MesWorkorderDTO> getList3();
	
	int deleteBom(MesWorkorderDTO DTO);
	

	
}
