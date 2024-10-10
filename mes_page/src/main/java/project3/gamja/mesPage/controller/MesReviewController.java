package project3.gamja.mesPage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.mesPage.service.BuserService;
import project3.gamja.mesPage.service.ReviewService;
import project3.gamja.mesPage.dto.MesReviewDTO;

@Controller
public class MesReviewController {

    @Autowired
    private ReviewService reviewService;  

    // 리뷰 목록 가져오기
    @RequestMapping("/review")
    public String getReviews(Model model) {
        System.out.println("review doGet 실행");

        List<MesReviewDTO> reviewList = reviewService.getReview();
        model.addAttribute("reviewList", reviewList);

        return "review";
    }
}