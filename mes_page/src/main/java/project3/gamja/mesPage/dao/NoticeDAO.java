package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesNoticeDTO;

@Mapper
public interface NoticeDAO {
	
	List<MesNoticeDTO> selectNotice1();
}
