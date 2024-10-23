package project3.talking.gamja.service.mes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.NoticeDAO;
import project3.talking.gamja.dto.mes.MesNoticeDTO;


@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	
	public Map selectNotice1(int count, int pageNo) {
		// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
		int start = ((pageNo - 1) * count) + 1;
		// 마지막 번호
		int end = start + count - 1;
		
		MesNoticeDTO dto = new MesNoticeDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		List<MesNoticeDTO> list = noticeDAO.selectNotice1(dto);
		
//		System.out.println(list.get(0));
		int totalCount = noticeDAO.totalNt1(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount); // 전체 목록 개수
		
		return map;
	}
	
	public int insertNotice(MesNoticeDTO dto){
		int result = noticeDAO.insertNotice(dto);
		return result;
	}
	
	public MesNoticeDTO selectOne(MesNoticeDTO dto) {
		MesNoticeDTO list = noticeDAO.selectOne(dto);
		
		return list;
	}
	public int updateNotice(MesNoticeDTO dto){
		int result = noticeDAO.updateNotice(dto);
		return result;
	}
	public int deleteNotice(MesNoticeDTO dto){
		int result = noticeDAO.deleteNotice(dto);
		return result;
	}
	public int deleteNotiCm(MesNoticeDTO dto){
		int result = noticeDAO.deleteNotiCm(dto);
		return result;
	}
	
	// 댓글기능
	

    public int addComment(MesNoticeDTO dto) {
        return noticeDAO.addComment(dto);  // DAO 호출
    }
    public List<MesNoticeDTO> listNoti(MesNoticeDTO dto) {
    	List<MesNoticeDTO> list = noticeDAO.listNoti(dto);
    	
    	return list;
    }
	
}
