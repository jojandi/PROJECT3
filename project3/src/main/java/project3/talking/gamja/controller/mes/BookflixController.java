package project3.talking.gamja.controller.mes;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.talking.gamja.dto.mes.MesBuserDTO;
import project3.talking.gamja.dto.mes.MesReviewDTO;
import project3.talking.gamja.service.mes.BookfilxService;

@Controller("mesBookflixController")
@RequestMapping("/mes")
public class BookflixController {

    @Autowired
    @Qualifier("mesBookfilxService")
    private BookfilxService bookflixService;
    
    
    @RequestMapping(value="/mes_bookflix1", method=RequestMethod.GET)
    public String getBusers(Model model, Integer count, Integer pageNo, String user_id2) {
        // 페이징 기본값 설정
        if (count == null) count = 9;
        if (pageNo == null) pageNo = 1;

        // user_id2를 포함하여 서비스로 전달
        Map<String, Object> map = bookflixService.selectBuser(count, pageNo, user_id2);

        // JSP로 전달할 데이터 설정
        model.addAttribute("map", map);  // 전체 데이터 맵
        model.addAttribute("countPerPage", count);
        model.addAttribute("page", pageNo);
        model.addAttribute("user_id2", user_id2);  // user_id2도 전달하여 검색 값 유지

        return "mes_bookflix1";
    }
    
   
  

  //BOM 페이지
  	@RequestMapping(value="/mes_bookflix2", method=RequestMethod.GET)
  	public String getReviews(Model model, Integer seq, Integer count, Integer pageNo) {
  		// 페이징 기본값 설정
  		if(count == null) count = 9;
  		if(pageNo == null) pageNo = 1;
  		
  		Map map = bookflixService.getReview(count, pageNo);
  		
  		model.addAttribute("map", map);
  		model.addAttribute("countPerPage", count);
  		model.addAttribute("page", pageNo);
  		System.out.println(map);
  		return "mes_bookflix2";
  	}
  /*  // 리뷰 목록 가져오기
    @RequestMapping("/mes_bookflix2")
    public String getReviews(Model model) {
        System.out.println("review doGet 실행");

        List<MesReviewDTO> reviewList = bookflixService.getReview();
        model.addAttribute("reviewList", reviewList);

        return "mes_bookflix2";
    }*/
    @RequestMapping(value="deleteReview", method=RequestMethod.DELETE)
	@ResponseBody
	public int deleteReview(@RequestBody MesReviewDTO reviewDTO) {
		int result = -1;
		
		try {
			result = bookflixService.deleteReview(reviewDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("delete : " + result);
		
		return result;
	}

}
