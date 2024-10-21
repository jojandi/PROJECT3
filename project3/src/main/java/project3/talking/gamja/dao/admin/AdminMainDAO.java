package project3.talking.gamja.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.admin.InvenDTO;
import project3.talking.gamja.dto.admin.NotiDTO;

@Mapper
public interface AdminMainDAO {

	List<NotiDTO> selectNoti();
	List<InvenDTO> selectLoanSeq();
	
}


