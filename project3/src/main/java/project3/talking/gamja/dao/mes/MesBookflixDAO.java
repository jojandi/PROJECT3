package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.talking.gamja.dto.mes.MesBuserDTO;
import project3.talking.gamja.dto.mes.MesReviewDTO;
import project3.talking.gamja.dto.mes.MesWorkorderDTO;


@Mapper
public interface MesBookflixDAO {
    
	 // 특정 user_id2로 사용자 조회 (페이징 처리 추가)
    List<MesBuserDTO> selectBuser(MesBuserDTO dto);
    
    // 모든 사용자 조회 (페이징 처리 추가)
    List<MesBuserDTO> selectAllBusers(MesBuserDTO dto);

    // 전체 사용자 수 조회
    int totalBuserCount(MesBuserDTO dto);

    // 리뷰 조회 (페이징 처리)
    List<MesReviewDTO> getReviews(MesReviewDTO dto);
    
    // 리뷰 전체 개수
    int totalReview(MesReviewDTO dto);
    
    // 리뷰 삭제
    int deleteReview(MesReviewDTO dto);
}