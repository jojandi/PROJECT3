package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.ApplyDTO;
import project3.gamja.admin.dto.RequestDTO;

@Mapper
public interface RequestDAO {
	
	List<RequestDTO> selectre(RequestDTO reDTO);
	int totalre(RequestDTO reDTO);
	
	List<ApplyDTO> selectApply(ApplyDTO reDTO);
	int totalApply(ApplyDTO reDTO);

	int applyDelete(ApplyDTO applyDTO);
	int applyReq(ApplyDTO applyDTO);
	int applyUpdate(ApplyDTO applyDTO);
}
