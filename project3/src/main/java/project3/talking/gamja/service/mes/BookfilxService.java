package project3.talking.gamja.service.mes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.MesBookflixDAO;
import project3.talking.gamja.dto.mes.MesBuserDTO;
import project3.talking.gamja.dto.mes.MesReviewDTO;


@Service("mesBookfilxService")
public class BookfilxService {

    @Autowired
    private MesBookflixDAO bookflixDAO;

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