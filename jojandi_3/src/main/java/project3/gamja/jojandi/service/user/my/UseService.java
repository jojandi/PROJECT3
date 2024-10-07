package project3.gamja.jojandi.service.user.my;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.jojandi.dao.user.my.UseDAO;
import project3.gamja.jojandi.dto.user.my.LoanDTO;

@Service
public class UseService {

	@Autowired
	UseDAO useDAO;
	
	// 예약내역
	public Map selectUseRes(int seq, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		LoanDTO dto = new LoanDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setUser_seq(seq);
		
		List<LoanDTO> list = useDAO.selectUseRes(dto);
		
		int totalCount = useDAO.totalRes(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		
		return map;
	}
	
	// 대출내역
	public Map selectUseLoan(int seq, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		LoanDTO dto = new LoanDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setUser_seq(seq);
		
		List<LoanDTO> list = useDAO.selectUseLoan(dto);
		
		int totalCount = useDAO.totalLoan(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		
		return map;
	}

	// 연체내역
	public Map selectUseOver(int seq, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		LoanDTO dto = new LoanDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setUser_seq(seq);
		
		List<LoanDTO> list = useDAO.selectUseOver(dto);
		
		int totalCount = useDAO.totalOver(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		
		return map;
	}
	
}
