package project3.talking.gamja.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.admin.NotiDAO;
import project3.talking.gamja.dto.admin.NotiDTO;

@Service
public class NotiService {

    @Autowired
    NotiDAO notiDAO;

    // 공지사항 목록 조회 
    public List<NotiDTO> selectAnnouncement() {
        return notiDAO.selectAnnouncement();
    }

    public NotiDTO selectSeq(int annSeq) {
        return notiDAO.selectSeq(annSeq);
    }

    public List<NotiDTO> selectAnnClass() {
        return notiDAO.selectAnnClass();
    }

    public int updateNotice(NotiDTO dto) {
        return notiDAO.updateNotice(dto);
    }
    
    // 공지사항  추가 인서트 
    public int insertNotice(NotiDTO dto) {
    	return notiDAO.insertAnnouncement(dto);
    }

    //  공지사항 삭제 딜리트 
	public int deleteNotice(NotiDTO notiDTO) {
		return notiDAO.deleteNotice(notiDTO);
	}
   


}

		
