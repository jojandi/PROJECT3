package project3.gamja.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.InvenDAO;
import project3.gamja.admin.dto.InvenDTO;

@Service
public class InvenService {

	@Autowired
	InvenDAO invenDAO;
	
	public Map selectInven(int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		InvenDTO dto = new InvenDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<InvenDTO> list = invenDAO.selectInven(dto);
		
		int totalCount = invenDAO.totalInven();
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
}
