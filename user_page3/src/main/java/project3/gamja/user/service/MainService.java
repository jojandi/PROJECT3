package project3.gamja.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.MainDAO;
import project3.gamja.user.dto.NotiDTO;


@Service
public class MainService {

	@Autowired
	MainDAO mainDAO;
	
	public List<NotiDTO> selectNoti(){
		List<NotiDTO> list = mainDAO.selectNoti();
		
		return list;
	}
	
}
