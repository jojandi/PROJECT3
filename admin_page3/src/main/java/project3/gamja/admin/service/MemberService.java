package project3.gamja.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.admin.dao.MemberDAO;
import project3.gamja.admin.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
    MemberDAO memberDAO; // 객체명은 소문자로 시작

    public List<MemberDTO> selectMember() {
        List<MemberDTO> list = memberDAO.selectMember();
        return list;
    }
    
    public MemberDTO selectOne(MemberDTO dto) {
    	MemberDTO list = memberDAO.selectOne(dto);
		
		return list;
	}
}
