package project3.talking.gamja.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project3.talking.gamja.dto.user.NotiDTO;
import project3.talking.gamja.dto.user.RequestDTO;
import project3.talking.gamja.service.user.InfoService;


@Controller
@RequestMapping("/user")
public class InfoController {
 
	@Autowired
	InfoService InfoService;


	  @RequestMapping("/notice") public String listnoti(Model model) {
	  
	  List<NotiDTO> list = InfoService.listnoti(); 
	  System.out.println(list);
	  
	  model.addAttribute("list", list);
	 
	 return "notice"; 
	 }
	  
	 

	@RequestMapping("/notice2")
	public String listnoti2(Model model) {

		List<NotiDTO> list = InfoService.listnoti();
		model.addAttribute("list", list);

		return "notice2";
	}

	@RequestMapping("/notice3")
	public String listnoti3(Model model, int ann_seq) {

		NotiDTO dto = InfoService.selectSeq(ann_seq);
		// 공지사항 조회 인서트 
		model.addAttribute("notice", dto);

		return "notice3";
	}
	
	//페이징 
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String slelctInven(Model model, NotiDTO invenDTO, String countPerPage, String page) {
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = InfoService.selectAnnouncement(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
//		System.out.println("totalCount : " + map.get("totalCount"));
		System.out.println("countPerPage : " + count);
		System.out.println("page : " + pageNo);
		
		return "notice";
	}	
	
	
	// 도서신청
	// 전체조회
	@RequestMapping("/request")
	public String listreq(Model model) {

		/*
		 * List<RequestDTO> list = InfoService.listreq();
		 * model.addAttribute("list", list);
		 */
		// 리턴값이 타일즈로 가는거임 
		return "user_request";
	}
	// insert
	@RequestMapping("/requestInsert")
	public String insreq(Model model, @ModelAttribute RequestDTO dto) {
		int result = InfoService.insertApplication(dto);
		System.out.println("dto = " + dto);
		System.out.println(result);
		return "redirect:/request";
	}
	
	
	
	// 업데이트
	@RequestMapping("/requestUpdate")
	public String updatereq(Model model, @ModelAttribute RequestDTO dto) {
		int result = InfoService.editApplication(dto);
		System.out.println("dto = " + dto);
		System.out.println(result);

		// 업데이트 결과에 따라 리다이렉트 처리
		if (result > 0) {
			return "redirect:request"; // 성공 시 요청 페이지로 리다이렉트
		} else {
			model.addAttribute("errorMessage",
					"Update failed. Please try again.");
			return "error"; // 실패 시 에러 페이지로 이동 (필요시 다른 페이지로 설정 가능)
		}
		}
		
	// 파일 업로드
	@RequestMapping(value = "/insertNoti", method = RequestMethod.POST)
	    public String insertNotice(MultipartHttpServletRequest req) {
	        // 공지사항 정보 출력
	        NotiDTO dto = new NotiDTO();    
	        
	        // MultipartHttpServletRequest로부터 'class_id', 'lib_id', 'title', 'detail' 등 파라미터 가져오기
	        String class_id = req.getParameter("class_id");
	        String lib_id = req.getParameter("lib_id");
	        String ann_detail = req.getParameter("ann_detail");
	        String ann_title = req.getParameter("ann_title");
	        String ann_regi = req.getParameter("ann_regi");
	        
	        // 입력된 값 확인용 출력
	        System.out.println("class_id: " + class_id);
	        System.out.println("lib_id: " + lib_id);
	        System.out.println("ann_title: " + ann_title);
	        System.out.println("ann_regi: " + ann_regi);
	       
	        // DTO에 공지사항 정보 설정
	        dto.setClass_name(class_id);          // 분류 ID
	        dto.setLib_name(lib_id);   // 도서관 ID
	        dto.setAnn_Detail(ann_detail);     // 공지사항 내용
	        dto.setAnn_Title(ann_title);       // 공지사항 제목
	        dto.setAnn_Regi(ann_regi);         // 등록일
	        
	        // 공지사항의 파일 처리 (단일 파일 처리)
	        MultipartFile mf = req.getFile("ann_attach"); // 'ann_attach'는 HTML 폼의 파일 필드 이름

	        // 파일 저장 경로 설정 (서버 환경에 맞게 수정 필요)
	        String path = "C:\\temp\\upload";

	        if (mf != null && !mf.isEmpty()) {
	            long fileSize = mf.getSize();
	            String fileName = mf.getOriginalFilename();
	            System.out.println("fileSize: " + fileSize);
	            System.out.println("fileName: " + fileName);

	            try {
	                // 파일명을 안전하게 생성 (현재 시간 기반)
	                String safeFileName = path + "\\" + System.currentTimeMillis() + "_" + fileName;
	                System.out.println("safeFileName: " + safeFileName);

	                // 파일 저장 경로에 파일 객체 생성
	                File file = new File(safeFileName);

	                // 파일을 해당 경로에 전송 (저장)
	                mf.transferTo(file);

	                // 저장된 파일명 또는 경로를 DTO에 설정
	                dto.setAnn_attach(safeFileName); // 파일 경로를 DTO에 저장

	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        
	        // DTO를 서비스로 전달하여 공지사항 등록 처리
	        int result = InfoService.insertNoti(dto);  // 공지사항 등록 메서드 호출 (서비스에 메서드 구현 필요)
	        
	        if (result > 0) {
	            System.out.println("공지사항 등록 성공");
	            return "redirect:/notice";  // 성공 시 공지사항 목록 페이지로 리다이렉트
	        } else {
	            System.out.println("공지사항 등록 실패");
	            return "error";  // 실패 시 에러 페이지로 이동
	        }
	    }
	
	 // 검색 기능 처리
    @RequestMapping(value = "/searchNoti", method = RequestMethod.GET)
    public String searchNoti(@RequestParam("keyword") String keyword, Model model,String countPerPage, String page) {
    	
    	// 페이징 기본값 설정
    			if(countPerPage == null) countPerPage = "10";
    			if(page == null) page = "1";
    			
    			int count = Integer.parseInt(countPerPage);
    			int pageNo = Integer.parseInt(page);
    			
    			Map map = InfoService.searchAnnouncement(count, pageNo,keyword);
    			
    			model.addAttribute("map", map);
    			model.addAttribute("countPerPage", count);
    			model.addAttribute("page", pageNo);
//    			System.out.println("totalCount : " + map.get("totalCount"));
    			System.out.println("countPerPage : " + count);
    			System.out.println("page : " + pageNo);
    	
    	
    	
//        List<NotiDTO> searchResults = InfoService.searchAnnouncement(count, pageNo,keyword);
//        model.addAttribute("list", searchResults);
        return "notice";  // 검색 결과를 공지사항 페이지로 전달
    }
    
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    @ResponseBody
    public void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String fileName = request.getParameter("fileName");
       File downFile = new File("C:\\temp\\upload\\" + fileName);

       // 브라우저 캐시를 사용하지 않도록 설정
       response.setHeader("Cache-Control", "no-cache");
       // 지금 응답이 첨부파일이라는걸 알려 줌
       response.addHeader("Content-disposition",
             "attachment; fileName=" + fileName);

       // pc에 있는 파일을 읽는 흐름을 열기
       FileInputStream fis = new FileInputStream(downFile);
       // 흐름에서 java 메모리로 퍼 올릴 바가지 크기 설정
       byte[] buf = new byte[1024 * 1]; // 보통은 8kB

       // 브라우저로 내보낼 수 있는 흐름을 열어서 준비
       OutputStream os = response.getOutputStream();

       while (true) {

          // 파일에서 바가지 크기 만큼 읽어서 바가지에 담아두기
          // 읽은 만큼 돌려 줌
          int count = fis.read(buf);

          // 읽을게 없을때 -1
          // 반복문 종료
          if (count == -1) {
             break;
          }

          // 내보내는 흐름에 바가지의 내용을 보낸다
          // 0 : 바가지 처음부터
          // count : 읽은 만큼
          os.write(buf, 0, count);
       }

       os.close();
       fis.close();

    }
	
}
