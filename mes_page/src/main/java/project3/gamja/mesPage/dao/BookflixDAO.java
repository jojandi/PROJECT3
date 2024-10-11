package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import project3.gamja.mesPage.dto.MesBuserDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.dto.MesReviewDTO;


@Mapper
public interface BookflixDAO {
    
    // 특정 user_id2로 사용자 조회
    List<MesBuserDTO> selectBuser(@Param("user_id2") String user_id2);
    
    // 모든 사용자 조회
    List<MesBuserDTO> selectAllBusers();
   // 리뷰조회
    List<MesReviewDTO> getReviews();
    //리뷰삭제
    int deleteReview(MesReviewDTO dto);
}