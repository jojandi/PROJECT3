package project3.talking.gamja.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.MyDAO;
import project3.talking.gamja.dto.user.ApplyDTO;


@Service
public class MyApplyService {

	@Autowired
	MyDAO myDAO;
	
	// 예약내역
	public Map selectUseRes(String seq, int count, int pageNo){
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		ApplyDTO dto = new ApplyDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setUser_seq(seq);
		
		List<ApplyDTO> list = myDAO.selectBookApply(dto);
		
		int totalCount = myDAO.totalApply(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
}
