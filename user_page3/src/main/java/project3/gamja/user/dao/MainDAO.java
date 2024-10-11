package project3.gamja.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.user.dto.NotiDTO;

@Mapper
public interface MainDAO {

	List<NotiDTO> selectNoti();
	
}


