package project3.talking.gamja.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.user.BookflixDAO;
import project3.talking.gamja.dto.user.BookflixDTO;
import project3.talking.gamja.dto.user.ReviewDTO;

@Service
public class BookflixService {

	  @Autowired
	    private BookflixDAO bookflixDAO;

	  public List<BookflixDTO> getUserBookflix(int seq) {
	        List<BookflixDTO> list = bookflixDAO.bookflix_user(seq);
	        if (list == null || list.isEmpty()) {
	            // 리스트가 비었을 때의 처리
	            System.out.println("리스트가 비어 있습니다.");
	        }
	        return list;
	    }

	    public int review(int userSeq, int buserSeq, int star, String text) {
	        return bookflixDAO.bookflix_review(userSeq, buserSeq, star, text);
	    }
	    
	    // 북플릭스 가입 처리
	    public int sub(int userSeq) {
	        return bookflixDAO.bookflix_sub(userSeq);
	    }

	    // 북플릭스 유저 인서트
	    public int subInsert(int userSeq) {
	        return bookflixDAO.bookflix_subInsert(userSeq);
	    }

	    // 북플릭스 유저 삭제 (탈퇴)
	    public int bookflixDel(int buserSeq) {
	        return bookflixDAO.bookflix_del(buserSeq);
	    }

	    // 북플릭스 탈퇴 처리
	    public int out(int userSeq) {
	        return bookflixDAO.bookflix_out(userSeq);
	    }
	    // 리뷰 5개 가져오기 (별점 순으로)
	    public List<ReviewDTO> getTopFiveReviews() {
	        return bookflixDAO.selectReviewsByStar();
	    }
	   
}
