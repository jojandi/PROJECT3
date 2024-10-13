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
}
		
