package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.NoticeDAO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.dto.MesPfworkDTO;
import project3.gamja.mesPage.dto.MesStockDTO;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	
	public List<MesNoticeDTO> selectNotice1(){
		
		List<MesNoticeDTO> list = noticeDAO.selectNotice1();
				
		return list;
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
}
