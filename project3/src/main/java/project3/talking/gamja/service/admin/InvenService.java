package project3.talking.gamja.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.admin.InvenDAO;
import project3.talking.gamja.dto.admin.InvenDTO;
import project3.talking.gamja.dto.admin.LoanResDTO;

@Service
public class InvenService {

	@Autowired
	InvenDAO invenDAO;
	
	// 재고현황 select
	public Map selectInven(InvenDTO invenDTO, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		invenDTO.setStart(start);
		invenDTO.setEnd(end);
		
		List<InvenDTO> list = invenDAO.selectInven(invenDTO);
		
		int totalCount = invenDAO.totalInven(invenDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	public InvenDTO readInven(InvenDTO invenDTO) {
		InvenDTO dto = invenDAO.readInven(invenDTO);
		
		return dto;
	}
	
	// 예약현황 select
	public Map selectRes(LoanResDTO loanResDTO, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		loanResDTO.setStart(start);
		loanResDTO.setEnd(end);
		
		List<LoanResDTO> list = invenDAO.selectRes(loanResDTO);
		
		int totalCount = invenDAO.totalRes(loanResDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	// 픽업 후 대출로 이동
	public int updateRes(LoanResDTO loanResDTO) {
		int result = invenDAO.updateRes(loanResDTO);
		
		return result;
	}
	
	public int inseResLoan(LoanResDTO loanResDTO) {
		int result = invenDAO.inseResLoan(loanResDTO);
		
		return result;
	}
	
	public int invenLoan(LoanResDTO loanResDTO) {
		int result = invenDAO.invenLoan(loanResDTO);
		
		return result;
	}
	
//	public int invenRes(LoanResDTO loanResDTO) {
//		int result = invenDAO.invenRes(loanResDTO);
//		
//		return result;
//	}
	
	// 대출현황 select
	public Map selectLoan(LoanResDTO loanResDTO, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		loanResDTO.setStart(start);
		loanResDTO.setEnd(end);
		
		List<LoanResDTO> list = invenDAO.selectLoan(loanResDTO);
		
		int totalCount = invenDAO.totalLoan(loanResDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	public int laonUpdate(LoanResDTO loanResDTO) {
		int result = invenDAO.laonUpdate(loanResDTO);
		
		return result;
	}
	
	public int invenUpdate(LoanResDTO loanResDTO) {
		int result = invenDAO.invenUpdate(loanResDTO);
		
		return result;
	}

	public int overUserUpdate(LoanResDTO loanResDTO) {
		int result = invenDAO.overUserUpdate(loanResDTO);
		
		return result;
	}
	
}
