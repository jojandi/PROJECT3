package project3.talking.gamja.service.mes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.MesBookflixDAO;
import project3.talking.gamja.dto.mes.MesBuserDTO;
import project3.talking.gamja.dto.mes.MesReviewDTO;
import project3.talking.gamja.dto.mes.MesStockDTO;
import project3.talking.gamja.dto.mes.MesWorkorderDTO;


@Service("mesBookfilxService")
public class BookfilxService {

    @Autowired
    private MesBookflixDAO bookflixDAO;

    // user_id2가 있으면 selectBuser 호출, 없으면 selectAllBusers 호출
    public Map<String, Object> selectBuser(int count, int pageNo, String user_id2) {
        // 페이징 처리 로직 (start, end 값 계산)
        int start = ((pageNo - 1) * count) + 1;
        int end = start + count - 1;

        MesBuserDTO dto = new MesBuserDTO();
        dto.setStart(start);
        dto.setEnd(end);

        List<MesBuserDTO> list;

        // user_id2가 있을 경우 특정 사용자 조회, 없을 경우 전체 조회
        if (user_id2 != null && !user_id2.isEmpty()) {
            dto.setUser_id2(user_id2);  // DTO에 사용자 ID 설정
            list = bookflixDAO.selectBuser(dto);
        } else {
            list = bookflixDAO.selectAllBusers(dto);
        }

        int totalCount = bookflixDAO.totalBuserCount(dto);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("totalCount", totalCount);

        return map;
    }
   

	 // 리뷰 리스트를 가져오는 메서드 추가
	
	 
	 public Map getReview(int count, int pageNo) {
			// 시작 번호 : 이전 페이지까지 보여준 것 바로 다음 것
			int start = ((pageNo - 1) * count) + 1;
			// 마지막 번호
			int end = start + count - 1;
			
			MesReviewDTO dto = new MesReviewDTO();
			dto.setStart(start);
			dto.setEnd(end);
			
			List<MesReviewDTO> list = bookflixDAO.getReviews(dto);
			
//			System.out.println(list.get(0));
			int totalCount = bookflixDAO.totalReview(dto);
			
			Map map = new HashMap();
			map.put("list", list);
			map.put("totalCount", totalCount); // 전체 목록 개수
			
			return map;
		}
	 
	 public int deleteReview(MesReviewDTO dto){
			int result = bookflixDAO.deleteReview(dto);
			return result;
		}
	 
   
}