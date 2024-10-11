package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.BookflixDAO;
import project3.gamja.mesPage.dao.MainDAO;
import project3.gamja.mesPage.dto.MesBuserDTO;
import project3.gamja.mesPage.dto.MesMainDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.dto.MesReviewDTO;


@Service
public class BookfilxService {

    @Autowired
    private BookflixDAO bookflixDAO;

    // user_id2가 있으면 selectBuser 호출, 없으면 selectAllBusers 호출
    public List<MesBuserDTO> selectBuser(String user_id2) {
        if (user_id2 != null && !user_id2.isEmpty()) {
            return bookflixDAO.selectBuser(user_id2);
        } else {
            return bookflixDAO.selectAllBusers();
        }
    }

	 // 리뷰 리스트를 가져오는 메서드 추가
	 public List<MesReviewDTO> getReview() {
     return bookflixDAO.getReviews();
	 }
	 
	 public int deleteReview(MesReviewDTO dto){
			int result = bookflixDAO.deleteReview(dto);
			return result;
		}
	 
   
}