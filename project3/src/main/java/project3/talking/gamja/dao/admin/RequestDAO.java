package project3.talking.gamja.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.admin.ApplyDTO;
import project3.talking.gamja.dto.admin.RequestDTO;

@Mapper
public interface RequestDAO {
	
	List<RequestDTO> selectre(RequestDTO reDTO);
	int totalre(RequestDTO reDTO);
	
	int reqUpdate(RequestDTO reqDTO);
	
	int reqOrder(RequestDTO reqDTO);
	
	List<ApplyDTO> selectApply(ApplyDTO reDTO);
	int totalApply(ApplyDTO reDTO);

	int applyDelete(ApplyDTO applyDTO);
	int applyReq(ApplyDTO applyDTO);
	int applyUpdate(ApplyDTO applyDTO);
}
