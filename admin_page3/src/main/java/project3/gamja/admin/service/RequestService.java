package project3.gamja.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.RequestDAO;
import project3.gamja.admin.dto.RequestDTO;


@Service
public class RequestService {
	
	@Autowired
	RequestDAO reDAO;
	
	public Map selectre(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		RequestDTO dto = new RequestDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<RequestDTO> list = reDAO.selectre(dto);
		
		int totalCount = reDAO.totalre(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}
	
	public Map selectApply(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		RequestDTO dto = new RequestDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<RequestDTO> list = reDAO.selectApply(dto);
		
		int totalCount = reDAO.totalApply(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

}
