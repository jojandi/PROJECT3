package project3.gamja.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project3.gamja.user.dto.NotiDTO;
import project3.gamja.user.dto.RequestDTO;
import project3.gamja.user.service.InfoService;


@Controller
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
		return "request";
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
	
}
