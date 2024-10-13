package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.NotiDTO;

@Mapper
public interface NotiDAO {

	List<NotiDTO> selectNoti();
	int insertNoti(NotiDTO dto);
	
//	NotiDTO selectOne(NotiDTO dto);
//	int updateNoti(NotiDTO dto);
//	int deleteNoti(NotiDTO dto);
	
}
