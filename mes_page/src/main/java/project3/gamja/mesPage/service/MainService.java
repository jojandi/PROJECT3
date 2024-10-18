package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.MainDAO;
import project3.gamja.mesPage.dao.NoticeDAO;
import project3.gamja.mesPage.dto.MesMainDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;


@Service
public class MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	public List<MesMainDTO> selectAll(){
		
		List<MesMainDTO> list = mainDAO.selectAll(); 
				
		return list;
	}
	
	 public List<MesMainDTO> getStatisticsByGenre(int year, int month) {
	        return mainDAO.getStatisticsByGenre(year, month);
	    }
	   

	    public List<MesMainDTO> getNoticesByEmpId(int emp_id) {
	        return mainDAO.findNoticesByEmpId(emp_id);
	    }
}
