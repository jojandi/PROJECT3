package project3.talking.gamja.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.admin.MemberDTO;



@Mapper
public interface MemberDAO {
	
	List<MemberDTO> selectMember();
	
	MemberDTO selectOne(MemberDTO dto);
}
