package project3.gamja.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.admin.dto.NotiDTO;
@Mapper
public interface NotiDAO {

    // 공지사항 목록 조회
    List<NotiDTO> selectAnnouncement();

    // 공지사항 세부 조회 (ann_seq로 조회)
    NotiDTO selectSeq(int annSeq);

    // 공지사항 클래스 조회
    List<NotiDTO> selectAnnClass();

    // 공지사항 업데이트
    int updateNotice(NotiDTO dto);

    // 공지사항 삭제
    int deleteNotice(int noticeId);
    
    // 공지사항 추가 인서트 
    int insertAnnouncement(NotiDTO dto);
}
