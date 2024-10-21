package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.mes.MesHumanDTO;

@Mapper
public interface HumanDAO {
	
	List<MesHumanDTO> selectHuman();
	int insertHuman(MesHumanDTO dto);
	MesHumanDTO selectOne(MesHumanDTO dto);
	int updateHuman(MesHumanDTO dto);
	int deleteHuman(MesHumanDTO dto);
}
