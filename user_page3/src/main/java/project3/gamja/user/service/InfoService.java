package project3.gamja.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.InfoDAO;
import project3.gamja.user.dto.NotiDTO;
import project3.gamja.user.dto.RequestDTO;


//공지사항
@Service
public class InfoService {

	@Autowired
	InfoDAO InfoDAO;		

	public List<NotiDTO> listnoti() {

		List<NotiDTO> list = InfoDAO.selectAnnouncement();

		return list;
	}
	
	public NotiDTO selectSeq(int seq) {
		// 공지사항 조회와 함께 조회 수 증가 
		
		NotiDTO result = InfoDAO.selectSeq(seq);
		InfoDAO.updateViewCount(seq); // 조회수 증가 호줄 
		return result;
	}
	
	public int insertAnnouncements(NotiDTO notiDTO) {
	   int result = InfoDAO.insertAnnouncements(notiDTO);  
	    return result;
	}
	
	//페이징
	public Map<String, Object> selectAnnouncement(int count, int pageNo) {
	    // 페이지 번호나 보여줄 개수가 유효한지 체크
	    if (count <= 0) {
	        count = 10; // 기본값 설정 (필요에 따라 다르게 설정 가능)
	    }
	    if (pageNo <= 0) {
	        pageNo = 1; // 기본값 설정
	    }

	    // 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
	    int start = ((pageNo - 1) * count) + 1;
	    // 마지막 번호
	    int end = start + count - 1;

	    // DTO에 start와 end 설정
	    NotiDTO dto = new NotiDTO();
	    dto.setStart(start);
	    dto.setEnd(end);

	    // DAO를 통해 공지사항 목록 조회
	    List<NotiDTO> list = InfoDAO.selectAnnouncement(dto);

	    // 전체 공지사항 개수 조회
	    int totalCount = InfoDAO.totalnoti();

	    // 결과를 담을 Map 생성 (Generics 사용)
	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("list", list);
	    resultMap.put("totalCount", totalCount); // 전체 목록 개수

	    return resultMap;
	}
		
//	도서신청
	public List<RequestDTO> listreq() {

		List<RequestDTO> list = InfoDAO.selectapplication();

		return list;

	}
	// 인설트
	public int insertApplication(RequestDTO requestDTO) {
		int result = InfoDAO.insertapplication(requestDTO);
		
		return result;
	}
	
	//업데이트 
	public int editApplication(RequestDTO requestDTO) {
		int result = InfoDAO.updateapplication(requestDTO);
		
		return result;
	}


	

}
