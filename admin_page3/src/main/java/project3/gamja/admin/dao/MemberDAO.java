package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.MemberDTO;



@Mapper
public interface MemberDAO {
	
	List<MemberDTO> selectMember();
	
	MemberDTO selectOne(MemberDTO dto);
}
