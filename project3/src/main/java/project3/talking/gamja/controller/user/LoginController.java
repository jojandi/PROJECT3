package project3.talking.gamja.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.talking.gamja.dto.user.UserDTO;
import project3.talking.gamja.service.user.LoginService;

@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    LoginService loginService;

    // 암호화
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    // 로그인 페이지 이동
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    // 로그인 처리
    @RequestMapping("/logingo")
    public String logingo(HttpServletRequest req, UserDTO userDTO) {
        // DTO에 로그인 시 입력한 아이디와 패스워드를 출력
        System.out.println("id : " + userDTO.getUser_id());
        System.out.println("pw : " + userDTO.getUser_pw());

        // 로그인 사용자 조회 (DB에서 가져옴)
        UserDTO user = loginService.selectLoginUser(userDTO); 
        UserDTO admin = loginService.selectLoginAdmin(userDTO);
        UserDTO mes = loginService.selectLoginMes(userDTO);

        // 일반 사용자 로그인 처리
        if (user != null) {
            boolean isPasswordMatch = passwordEncoder.matches(userDTO.getUser_pw(), user.getUser_pw());
            System.out.println("비밀번호 일치 여부: " + isPasswordMatch);
            System.out.println("사용자가 입력한 평문 비밀번호: " + userDTO.getUser_pw());
            System.out.println("DB에 저장된 암호화된 비밀번호: " + user.getUser_pw());

            if (isPasswordMatch) {
                // 일반 사용자 로그인 성공
                System.out.println(user.getUser_name());
                HttpSession session = req.getSession();
                session.setMaxInactiveInterval(60 * 60 * 60); // 세션 타임아웃 설정

                session.setAttribute("login", user);
                session.setAttribute("isLogin", true);

                // 홈으로 이동
                return "redirect:/user/main";
            } else {
                return "redirect:/login?code=LO01"; // 비밀번호가 일치하지 않는 경우
            }
        }

        // 관리자 로그인 처리
        if (admin != null) {
            boolean isPasswordMatch = passwordEncoder.matches(userDTO.getUser_pw(), admin.getUser_pw());
            if (isPasswordMatch) {
                // 관리자 로그인 성공
                HttpSession session = req.getSession();
                session.setMaxInactiveInterval(60 * 60 * 60);

                session.setAttribute("login", admin);
                session.setAttribute("isLogin", true);

                // 관리자 메인 페이지로 이동
                return "redirect:/admin/main";
            } else {
                return "redirect:/login?code=LO01"; // 비밀번호가 일치하지 않는 경우
            }
        }

        // MES 사용자 로그인 처리
        if (mes != null) {
            boolean isPasswordMatch = passwordEncoder.matches(userDTO.getUser_pw(), mes.getUser_pw());
            if (isPasswordMatch) {
                // MES 사용자 로그인 성공
                HttpSession session = req.getSession();
                session.setMaxInactiveInterval(60 * 60 * 60);

                session.setAttribute("login", mes);
                session.setAttribute("isLogin", true);

                // MES 메인 페이지로 이동
                return "redirect:/mes/main";
            } else {
                return "redirect:/login?code=LO01"; // 비밀번호가 일치하지 않는 경우
            }
        }

        // 로그인 실패 시 "LO01" 코드를 추가하여 로그인 페이지로 리다이렉트
        return "redirect:/login?code=LO01";
    }

    // 로그아웃 기능 추가
    @RequestMapping("/logout")
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession(false); // 기존 세션이 없으면 null 반환

        if (session != null) {
            // 세션 무효화하여 로그아웃 처리
            session.invalidate();
            System.out.println("로그아웃 됨.");
        }

        // 로그아웃 후 로그인 페이지로 리다이렉트
        return "redirect:/user/login";        
    }
}
