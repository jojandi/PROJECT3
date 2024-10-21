package project3.talking.gamja.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.user.NotiDTO;

@Mapper
public interface MainDAO {

	List<NotiDTO> selectNoti5();
	
}


