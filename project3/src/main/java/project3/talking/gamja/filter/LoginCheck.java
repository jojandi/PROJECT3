package project3.talking.gamja.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/user/*")
public class LoginCheck implements Filter {


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 서블릿 실행 전 처리
		System.out.println("doFilter 실행 전");
		
		// 한글 관련
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		// Filter의 doFilter에서의 전달인자는 우리가 사용했던 
	    // HttpServlet의 부모형태로 캐스팅한 변수를 사용하고 있어서
	    // 필요한 메소드 사용을 위해 다시 자식 형태로 변환
	    HttpServletRequest req = (HttpServletRequest)request;
	    HttpServletResponse resp = (HttpServletResponse)response;
	    
	    System.out.println( "getServletPath : " + req.getServletPath() );
	    
	    if(isExclude(req.getServletPath())) {
	    	System.out.println("세션 없이 진행");
	    	
	    	// 주소에 /assets가 포함되지 않았을 경우 HTML 한글 깨짐 방지
	    	if(req.getServletPath().indexOf("/assets/") == -1) {	    		
	    		response.setContentType("text/html; charset=utf-8;");
	    	}
	    	chain.doFilter(request, response);
	    } else {
	    	// 세션을 점검
	    	HttpSession session = req.getSession();
			Boolean isLogon = (Boolean)session.getAttribute("isLogin");
			
			// 서블릿 실행 ( ex. doGet )
//		  	chain.doFilter(request, response);
		  	
	    	// 로그인 되어있는 경우에만 통과
			if(isLogon != null && isLogon == true) {
				System.out.println("로그인 되어있음!");
		    	chain.doFilter(request, response);
	    	} else {
	    		System.out.println("로그인 안 되어있음...");
				resp.sendRedirect(req.getContextPath() + "/user/login");
			}
	    }
	    
	    
	  	
	  	// 서블릿 실행 후 처리
	 	System.out.println("doFilter 실행 후");
	}
	
	private boolean isExclude(String servletPath) {
		// 로그인 없어도 되는 페이지
		if("/user/main".equals(servletPath) 
			|| "/user/best".equals(servletPath) 
			|| "/user/bestInven".equals(servletPath) 
			|| "/user/bookadd".equals(servletPath) 
			|| "/user/notice".equals(servletPath)
			|| "/user/notice2".equals(servletPath)
			|| "/user/notice3".equals(servletPath)
			|| "/user/download".equals(servletPath)
			|| "/user/login".equals(servletPath)
			|| "/user/logingo".equals(servletPath)
			|| "/user/join".equals(servletPath)
			|| "/user/check_username".equals(servletPath)
			|| "/user/search".equals(servletPath)
			|| "/user/searchInven".equals(servletPath)
			|| "/user/user_libraryInfo".equals(servletPath)
			|| "/user/bookflix_info".equals(servletPath)
			|| "/user/join_insert".equals(servletPath)) {
			return true;
		} else { // 로그인 있어야하는 페이지
			return false;
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("로그인 체크");
	}

}
