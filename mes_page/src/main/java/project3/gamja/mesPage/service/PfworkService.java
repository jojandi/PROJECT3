package project3.gamja.mesPage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.PfworkDAO;
import project3.gamja.mesPage.dto.MesPfworkDTO;

@Service
public class PfworkService {
	
	@Autowired
	PfworkDAO pfDAO;
	
	public Map selectpf(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesPfworkDTO dto = new MesPfworkDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesPfworkDTO> list = pfDAO.selectpf(dto);
		
		int totalCount = pfDAO.totalpf(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}

}
