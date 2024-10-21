package project3.talking.gamja.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.admin.RequestDAO;
import project3.talking.gamja.dto.admin.ApplyDTO;
import project3.talking.gamja.dto.admin.RequestDTO;


@Service
public class RequestService {
	
	@Autowired
	RequestDAO reDAO;
	
	// 발주현황
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
	
	public int reqUpdate(RequestDTO reqDTO) {
		int result = 0;
		
		int[] lr_seqs = reqDTO.getLr_seqs();
		int[] lr_counts = reqDTO.getLr_counts();
		
		for(int i = 0; i < lr_seqs.length; i++) {
			reqDTO.setLr_seq(lr_seqs[i]);
			reqDTO.setLr_count(lr_counts[i]);
			
			result = reDAO.reqUpdate(reqDTO);
		}
		
		return result;
	}
	
	public int reqOrder(RequestDTO reqDTO) {
		int result = 0;
		
		int[] lr_seqs = reqDTO.getLr_seqs();
		int[] lib_id = reqDTO.getLib_ids();
		
		for(int i = 0; i < lr_seqs.length; i++) {
			reqDTO.setLr_seq(lr_seqs[i]);
			reqDTO.setLib_id(lib_id[i]);
			
			result = reDAO.reqOrder(reqDTO);
		}
		
		return result;
	}
	
	// 도서 신청 현황
	public Map selectApply(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		ApplyDTO applyDTO = new ApplyDTO();
		applyDTO.setStart(start);
		applyDTO.setEnd(end);
		
		List<ApplyDTO> list = reDAO.selectApply(applyDTO);
		
		int totalCount = reDAO.totalApply(applyDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public int applyDelete(ApplyDTO applyDTO) {
		
		int result = reDAO.applyDelete(applyDTO);
		
		return result;
	}
	
	public int applyReq(ApplyDTO applyDTO) {
		int result = 0;
		
		int[] checks = applyDTO.getChecks();
		int[] lib_ids = applyDTO.getLib_ids();
		
		for(int i = 0; i < checks.length; i++) {
			applyDTO.setApp_seq(checks[i]);
			applyDTO.setLib_id(lib_ids[i]);
			
			result = reDAO.applyReq(applyDTO);
		}
		
		return result;
	}
	
	public int applyUpdate(ApplyDTO applyDTO) {
		int result = reDAO.applyUpdate(applyDTO);
		
		return result;
	}

}
