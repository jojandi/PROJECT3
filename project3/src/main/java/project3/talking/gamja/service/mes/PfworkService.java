package project3.talking.gamja.service.mes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.PfworkDAO;
import project3.talking.gamja.dto.mes.MesPfworkDTO;

@Service
public class PfworkService {
	
	@Autowired
	PfworkDAO pfDAO;
	
	// 주문현황 select
	public Map selectpf(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesPfworkDTO dto = new MesPfworkDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesPfworkDTO> list = pfDAO.selectpf(dto);
		
//		System.out.println(list.get(0));
		int totalCount = pfDAO.totalpf(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	// 출고현황 select
	public Map selectde(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesPfworkDTO dto = new MesPfworkDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesPfworkDTO> list = pfDAO.selectde(dto);
		
//		System.out.println(list.get(0));
		int totalCount = pfDAO.totalde(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	// 주문현황 selectOne
	public MesPfworkDTO selectOne(MesPfworkDTO pfDTO) {
		MesPfworkDTO list = pfDAO.selectOne(pfDTO);
		
		return list;
	}
	
	// emp_id 가져오는 메소드
	public List<MesPfworkDTO> selectEmployee(){
		List<MesPfworkDTO> list = pfDAO.selectEmployee();
		
		return list;
	}
	
	// bom_code 가져오는 메소드
	public List<MesPfworkDTO> selectBom(){
		List<MesPfworkDTO> list = pfDAO.selectBom();
		
		return list;
	}
	
	// bookflix_id 가져오는 메소드
	public List<MesPfworkDTO> selectBookflix(){
		List<MesPfworkDTO> list = pfDAO.selectBookflix();
		
		return list;
	}
	
	// 주문현황 insert
	public int insertpf(MesPfworkDTO pfDTO) {
		int result = pfDAO.insertpf(pfDTO);
		
		return result;
	}
	
	// 주문현황 update
	public int updatepf(MesPfworkDTO pfDTO) {
		int result = pfDAO.updatepf(pfDTO);
		
		return result;
	}
	
	// 주문현황 delete
	public int deletepf(MesPfworkDTO pfDTO) {
		int result = pfDAO.deletepf(pfDTO);
		
		return result;
	}
	
	// 주문현황에서 작업지시서 생성하는 메소드
	public int pfinsertwo(MesPfworkDTO pfDTO) {
		int result = pfDAO.pfinsertwo(pfDTO);
		
		return result;
	}
	
	// 작업지시서 생성시 주문현황 상태 바꾸는 메소드
	public int pfupdatepf(MesPfworkDTO pfDTO) {
		int result = pfDAO.pfupdatepf(pfDTO);
		int log = pfDAO.logInsert(pfDTO);
		System.out.println("로그!!!!!!!!! : " + log);
		
		return result;
	}
	
	
	
}
