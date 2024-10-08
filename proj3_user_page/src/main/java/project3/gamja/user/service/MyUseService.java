package project3.gamja.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.MyDAO;
import project3.gamja.user.dto.LoanDTO;


@Service
public class MyUseService {

	@Autowired
	MyDAO myDAO;
	
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
		
		List<LoanDTO> list = myDAO.selectUseRes(dto);
		
		int totalCount = myDAO.totalRes(dto);
		
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
		
		List<LoanDTO> list = myDAO.selectUseLoan(dto);
		
		int totalCount = myDAO.totalLoan(dto);
		
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
		
		List<LoanDTO> list = myDAO.selectUseOver(dto);
		
		int totalCount = myDAO.totalOver(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		
		return map;
	}
	
}
