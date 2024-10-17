package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.dto.NotiDTO;

@Mapper
public interface MainDAO {

	List<NotiDTO> selectNoti();
	List<InvenDTO> selectLoanSeq();
	
}


