package project3.gamja.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.NotiDAO;
import project3.gamja.admin.dto.NotiDTO;

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
    
    // 공지사항 삭제 
    public int deleteNotice(int noticeId) {
        return notiDAO.deleteNotice(noticeId);
    }
    
    // 공지사항  추가 인서트 
    public int insertNotice(NotiDTO dto) {
    	return notiDAO.insertAnnouncement(dto);
    }
}

		
