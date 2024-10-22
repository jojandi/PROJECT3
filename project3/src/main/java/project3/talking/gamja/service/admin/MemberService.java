package project3.talking.gamja.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.admin.MemberDAO;
import project3.talking.gamja.dto.admin.MemberDTO;

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
