package project3.talking.gamja.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.MainDAO;
import project3.talking.gamja.dto.user.NotiDTO;


@Service
public class MainService {

	@Autowired
	MainDAO mainDAO;
	
	public List<NotiDTO> selectNoti(){
		List<NotiDTO> list = mainDAO.selectNoti5();
		
		return list;
	}
	
}
