package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.mesPage.dto.MesHumanDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;

@Mapper
public interface HumanDAO {
	
	List<MesHumanDTO> selectHuman();
	
	
	int insertHuman(MesHumanDTO dto);
	MesHumanDTO selectOne(MesHumanDTO dto);
	int updateHuman(MesHumanDTO dto);
	int deleteHuman(MesHumanDTO dto);
}
