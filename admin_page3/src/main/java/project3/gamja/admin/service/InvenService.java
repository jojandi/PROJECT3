package project3.gamja.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.InvenDAO;
import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.dto.LoanResDTO;

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
	
	// 예약현황 select
	public Map selectRes(LoanResDTO loanResDTO, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		loanResDTO.setStart(start);
		loanResDTO.setEnd(end);
		
		List<InvenDTO> list = invenDAO.selectRes(loanResDTO);
		
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
	
	public int invenRes(LoanResDTO loanResDTO) {
		int result = invenDAO.invenRes(loanResDTO);
		
		return result;
	}
	
}
