package project3.talking.gamja.service.mes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.HumanDAO;
import project3.talking.gamja.dto.mes.MesHumanDTO;

@Service
public class HumanService {
	
	@Autowired
	HumanDAO HumanDAO;
	
	
	public List<MesHumanDTO> selectHuman(){
		List<MesHumanDTO> list = HumanDAO.selectHuman();
				
		return list;
	}
	
	public MesHumanDTO selectOne(MesHumanDTO dto) {
		System.out.println("read 실행확인_서비스");
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

	
    public int insertHuman(MesHumanDTO dto){
        int result = HumanDAO.insertHuman(dto);
        return result;
    }
    
    
	}

	

