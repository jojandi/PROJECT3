package project3.talking.gamja.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.admin.AdminMainDAO;
import project3.talking.gamja.dto.admin.InvenDTO;
import project3.talking.gamja.dto.admin.NotiDTO;


@Service("adminMainService")
public class MainService {

	@Autowired
	@Qualifier("adminMainDAO")
	AdminMainDAO mainDAO;
	
	public List<NotiDTO> selectNoti(){
		List<NotiDTO> list = mainDAO.selectNoti();
		
		return list;
	}
	public List<InvenDTO> selectLoanSeq(){
		List<InvenDTO> list = mainDAO.selectLoanSeq();
		
		return list;
	}
	
}
