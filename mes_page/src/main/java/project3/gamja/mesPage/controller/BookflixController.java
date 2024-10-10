package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesBuserDTO;
import project3.gamja.mesPage.dto.MesReviewDTO;
import project3.gamja.mesPage.service.BookfilxService;






@Controller
public class BookflixController {

    @Autowired
    private BookfilxService bookflixService;

    @RequestMapping("/mes_buser")
    public String listEmp(Model model, @RequestParam(value = "user_id2", required = false) String user_id2) {
        List<MesBuserDTO> userList = bookflixService.selectBuser(user_id2);
        model.addAttribute("userList", userList);
        return "mes_buser";  // JSP 파일 이름
    }
  

    // 리뷰 목록 가져오기
    @RequestMapping("/mes_review")
    public String getReviews(Model model) {
        System.out.println("review doGet 실행");

        List<MesReviewDTO> reviewList = bookflixService.getReview();
        model.addAttribute("reviewList", reviewList);

        return "mes_review";
    }

}
