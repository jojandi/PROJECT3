package project3.gamja.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.user.dto.BookflixDTO;
import project3.gamja.user.dto.ReviewDTO;
import project3.gamja.user.service.BookflixService;



@Controller
public class BookflixController {

	@RequestMapping(value = "/bookflix_info", method=RequestMethod.GET)
	public String getBookflixInfoWithReviews(Model model) {
	    // Bookflix 설명 부분 로그
	    System.out.println("사용자용 북플릭스 설명 doGet 실행!");

	    // 리뷰 조회
	    List<ReviewDTO> topReviews = bookflixService.getTopFiveReviews();
	    if (topReviews == null || topReviews.isEmpty()) {
	        model.addAttribute("message", "조회된 리뷰가 없습니다.");
	    } else {
	        model.addAttribute("topReviews", topReviews);
	    }

	    // bookflix_info 페이지로 이동
	    return "bookflix_info";
	}

    @Autowired
    private BookflixService bookflixService;


    @RequestMapping(value = "/bookflix_user", method=RequestMethod.GET)
    public String getUserBookflix(@RequestParam("seq") int seq, Model model) {
        List<BookflixDTO> list = bookflixService.getUserBookflix(seq);
        if (list == null || list.isEmpty()) {
            // 리스트가 비었을 때 JSP에서 처리할 수 있도록 메시지 추가
            model.addAttribute("message", "조회된 데이터가 없습니다.");
            
        }
        model.addAttribute("list", list);  // 리스트 데이터를 JSP로 전달
      
        return "bookflix_user";  
    }
    

    // POST 요청 처리 - 북플릭스 탈퇴 처리
    @RequestMapping(value = "/bookflix_user", method=RequestMethod.POST)
    public String deleteUserBookflix(@RequestParam("bseq") int bseq, @RequestParam("user") int user) {
        System.out.println("사용자용 북플릭스 탈퇴 POST 실행!");
        System.out.println("북플릭스 유저 seq : " + bseq);

        int result = bookflixService.bookflixDel(bseq);
        int resultOut = bookflixService.out(user);

        System.out.println("북플릭스 탈퇴 : " + result);
        System.out.println("북플릭스 진짜 탈퇴 : " + resultOut);

        return "redirect:main";  // 탈퇴 후 메인 페이지로 리다이렉트
    }
   
    @RequestMapping(value = "/bookflix_review", method=RequestMethod.POST)
    public String postReview(@RequestParam("user") int user,
                             @RequestParam("buser") int buser,
                             @RequestParam("review_text") String reviewText,
                             @RequestParam(value = "star", required = false) String[] stars,
                             Model model) {
        System.out.println("POST 요청이 컨트롤러에 도달했습니다.");

        // 별점 처리
        int star = 0;
        if (stars != null) {
            for (String s : stars) {
                star += Integer.parseInt(s);
            }
        }

        System.out.println("유저: " + user);
        System.out.println("북플릭스 유저: " + buser);
        System.out.println("리뷰: " + reviewText);
        System.out.println("별점: " + star);

        // 리뷰 저장
        int result = bookflixService.review(user, buser, star, reviewText);
        System.out.println("리뷰 작성 완료: " + result);

        return "redirect:/bookflix_user?seq=" + user;
    }
    @RequestMapping(value = "/bookflix_sub", method=RequestMethod.POST)
    public String postSubscription(@RequestParam("seq") int user) {
        System.out.println("사용자용 북플릭스 구독 POST 실행!");

        // 구독 처리
        int resultUser = bookflixService.sub(user);
        int resultBuser = bookflixService.subInsert(user);
        
        System.out.println("구독 완료! " + resultUser);
        System.out.println("구독 진짜 완료! " + resultBuser);

        // 리다이렉트
        return "redirect:/bookflix_user?seq=" + user;
    }
  
}

