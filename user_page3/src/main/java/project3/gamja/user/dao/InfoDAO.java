package project3.gamja.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.user.dto.NotiDTO;
import project3.gamja.user.dto.RequestDTO;


@Mapper
public interface InfoDAO {

	  // 공지사항 관련
    List<NotiDTO> selectAnnouncement();  // 모든 공지사항 조회
    
    int insertAnnouncements(NotiDTO notiDTO);  // 공지사항 추가
    
    NotiDTO selectSeq(int seq);  // 공지사항 번호로 조회 (조회수 증가 포함)
    
    int updateViewCount(int annSeq);  // 조회수 업데이트 메서드 추가
    
    List<NotiDTO> selectAnnouncement(NotiDTO invenDTO);  // 조건에 따른 공지사항 조회
    
    int totalnoti();  // 총 공지사항 개수
    

    
    
    
    
    
    
    // 도서 신청 관련
    List<RequestDTO> selectapplication();  // 도서 신청 조회
    
    int insertapplication(RequestDTO requestDTO);  // 도서 신청 추가
    
    int updateapplication(RequestDTO requestDTO);  // 도서 신청 업데이트
    
    
    
}
	
	


