package project3.talking.gamja.controller.mes;

import java.util.List;

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

    @RequestMapping("/mes_bookflix1")
    public String listEmp(Model model, @RequestParam(value = "user_id2", required = false) String user_id2) {
        List<MesBuserDTO> userList = bookflixService.selectBuser(user_id2);
        model.addAttribute("userList", userList);
        return "mes_bookflix1";  // JSP 파일 이름
    }
  

    // 리뷰 목록 가져오기
    @RequestMapping("/mes_bookflix2")
    public String getReviews(Model model) {
        System.out.println("review doGet 실행");

        List<MesReviewDTO> reviewList = bookflixService.getReview();
        model.addAttribute("reviewList", reviewList);

        return "mes_bookflix2";
    }
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
