package project3.talking.gamja.service.mes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.WorkorderDAO;
import project3.talking.gamja.dto.mes.MesWorkorderDTO;

@Service
public class WorkorderService {
	
	@Autowired
	WorkorderDAO woDAO;
	
	public Map selectwo(int count, int pageNo) {
		
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesWorkorderDTO dto = new MesWorkorderDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List <MesWorkorderDTO> list = woDAO.selectwo(dto);
		
		int totalCount = woDAO.totalwo(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);	// 전체 목록 개수
		
		return map;
	}
	
	public int logUpdate(MesWorkorderDTO woDTO) {
		return woDAO.logUpdate(woDTO);
	}
	
	public MesWorkorderDTO selectOne(MesWorkorderDTO woDTO) {
		MesWorkorderDTO list = woDAO.selectOne(woDTO);
		
		return list;
	}
	
	public int deletewo(MesWorkorderDTO woDTO) {
		int result = woDAO.deletewo(woDTO);
		
		return result;
	}
	
	public int updatewo(MesWorkorderDTO woDTO) {
		int result = woDAO.updatewo(woDTO);
		
		return result;
	}
	
	public int insertwo(MesWorkorderDTO woDTO) {
		int result = woDAO.insertwo(woDTO);
		
		return result;
	}
	
	public List<MesWorkorderDTO> selectBom() {
		List<MesWorkorderDTO> list = woDAO.selectBom();
		
		return list;
	}
	
	public int updatewopro(MesWorkorderDTO woDTO) {
		int result = woDAO.updatewopro(woDTO);
		
		return result;
	}
	
	public int updatepf(MesWorkorderDTO woDTO) {
		int result = woDAO.updatepf(woDTO);
		
		return result;
	}
	
	public int insertpf(MesWorkorderDTO woDTO) {
		int result = woDAO.insertpf(woDTO);
		
		return result;
	}
	
	public int requestpf(MesWorkorderDTO woDTO) {
		int result = woDAO.requestpf(woDTO);
		
		return result;
	}
	
//-----------------------BOM 페이지입니다------------------------
	public Map getList2(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesWorkorderDTO dto = new MesWorkorderDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesWorkorderDTO> list = woDAO.getList2(dto);
		
//		System.out.println(list.get(0));
		int totalCount = woDAO.totalBom(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	    public MesWorkorderDTO MesBomRead(MesWorkorderDTO DTO) {
			MesWorkorderDTO list = woDAO.mesBomRead(DTO);
			
			return list;
		}
	    public List<MesWorkorderDTO> bomSelect() {
	        return woDAO.bomSelect();
	    }

	    public int updateBom(MesWorkorderDTO DTO) {
	        int result = woDAO.updatebom(DTO);
	    	return result;
	    }
	    public int insertBom(MesWorkorderDTO DTO) {
			int result = woDAO.insertBom(DTO);
			
			return result;
		}
	    
	    public List<MesWorkorderDTO> getList3() {
	        return woDAO.getList3();
	    }
	    
	    public int deleteBom(MesWorkorderDTO DTO) {
			int result = woDAO.deleteBom(DTO);
			
			return result;
		}

		public int logInsert(MesWorkorderDTO DTO) {
			int result = woDAO.logInsert(DTO);
			
			return result;
		}
	    
	 

}
