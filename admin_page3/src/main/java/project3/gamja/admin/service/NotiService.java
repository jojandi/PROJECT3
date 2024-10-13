package project3.gamja.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.NotiDAO;
import project3.gamja.admin.dto.NotiDTO;

@Service
public class NotiService {

    @Autowired
    NotiDAO notiDAO; // 객체명은 소문자로 시작

    public List<NotiDTO> selectNoti() {
        List<NotiDTO> list = notiDAO.selectNoti();
        return list;
    }
	public int insertNoti(NotiDTO dto){
		int result = notiDAO.insertNoti(dto);
		System.out.println("인설트 확인");
		return result;
	}
	

	public NotiDTO selectOne(NotiDTO dto) {
		NotiDTO list = notiDAO.selectOne(dto);
		
		return list;
	}
	public int updateNotice(NotiDTO dto){
		int result = notiDAO.updateNoti(dto);
		return result;
	}
	public int deleteNotice(NotiDTO dto){
		int result = notiDAO.deleteNoti(dto);
		return result;
	}
    
    
    
}
		
