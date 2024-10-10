package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.NoticeDAO;
import project3.gamja.mesPage.dto.MesNoticeDTO;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	
	public List<MesNoticeDTO> selectNotice1(){
		
		List<MesNoticeDTO> list = noticeDAO.selectNotice1();
				
		return list;
}
	
}
