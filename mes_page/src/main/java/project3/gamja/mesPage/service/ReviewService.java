package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.BuserDAO;
import project3.gamja.mesPage.dto.MesReviewDTO;

	@Service
	public class ReviewService {
		 @Autowired
		    private BuserDAO buserDAO;

		 // 리뷰 리스트를 가져오는 메서드 추가
	    public List<MesReviewDTO> getReview() {
	        return buserDAO.getReviews();
	    }
	    
}
