package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.HumanDAO;
import project3.gamja.mesPage.dto.MesHumanDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;

@Service
public class HumanService {
	
	@Autowired
	HumanDAO HumanDAO;
	
	
	public List<MesHumanDTO> selectHuman(){
		List<MesHumanDTO> list = HumanDAO.selectHuman();
				
		return list;
	}
	
	public MesHumanDTO selectOne(MesHumanDTO dto) {
		MesHumanDTO list = HumanDAO.selectOne(dto);
		
		return list;
	}
	
	public int updateHuman(MesHumanDTO dto){
		int result = HumanDAO.updateHuman(dto);
		return result;
	}

	public int deleteHuman(MesHumanDTO dto){
		int result = HumanDAO.deleteHuman(dto);
		return result;
	}
	

	
}
