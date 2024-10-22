package project3.talking.gamja.service.mes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.StockDAO;
import project3.talking.gamja.dto.mes.MesStockDTO;

@Service
public class StockService {

	@Autowired
	StockDAO stockDAO;
	
	public Map selectStock1(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesStockDTO dto = new MesStockDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesStockDTO> list = stockDAO.selectStock1(dto);
		
//		System.out.println(list.get(0));
		int totalCount = stockDAO.totalSt1(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	public Map selectStock2(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesStockDTO dto = new MesStockDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesStockDTO> list = stockDAO.selectStock2(dto);
		
//		System.out.println(list.get(0));
		int totalCount = stockDAO.totalSt2(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	public Map selectStock3(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesStockDTO dto = new MesStockDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesStockDTO> list = stockDAO.selectStock3(dto);
		
//		System.out.println(list.get(0));
		int totalCount = stockDAO.totalSt3(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	public List<MesStockDTO> getMesPubId(){
		
		List<MesStockDTO> list = stockDAO.getMesPubId();
		
		return list;
	}
	public List<MesStockDTO> getMesBookCodes(){
		
		List<MesStockDTO> list = stockDAO.getMesBookCodes();
		
		return list;
	}
	
	
	
	public MesStockDTO selectOrder(int OrderId){
		MesStockDTO dto = stockDAO.selectOrder(OrderId);
		return dto;
	}
	
	public int deleteOrder(MesStockDTO dto){
		int result = stockDAO.deleteOrder(dto);
		return result;
	}
	public int updateOrder(MesStockDTO dto){
		int result = stockDAO.updateOrder(dto);
		return result;
	}
	public int insertOrder(MesStockDTO dto){
		int result = stockDAO.insertOrder(dto);
		return result;
	}
	
}
