package project3.gamja.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project3.gamja.admin.dto.NotiDTO;
import project3.gamja.admin.service.NotiService;

@Controller
public class NotiController {

	@Autowired
	NotiService notiService;

	// 인설트 폼으로 들어감
	@RequestMapping("/notice")
	public String notice(Model model, String cmd) {

		model.addAttribute("cmd", cmd);
		return "notice";
	}

	// 공지사항2 셀렉트
	@RequestMapping("/notice2")
	public String notice2(Model model) {
		List<NotiDTO> list = notiService.selectAnnouncement();
		System.out.println("list: " + list);
		model.addAttribute("noticeList", list);
		return "notice2";
	}
	// // 공지사항 인서트
	@RequestMapping(value = "/insertNoti2", method = RequestMethod.POST)
	public String insertNotice(NotiDTO dto) {
		System.out.println("dto " + dto);
		notiService.insertNotice(dto);
		return "redirect:/notice2";
	}

	// 공지사항 세부 조회 (ann_seq로 조회)
	// http://localhost:8080/admin/notice3/4
	@RequestMapping("/notice3_{ann_seq}")
	public String noticeDetail(@PathVariable("ann_seq") int annSeq,
			Model model) {
		NotiDTO notice = notiService.selectSeq(annSeq);

		model.addAttribute("notice", notice);
		return "notice3";
	}

	// 공지사항 세부 조회 (업데이트 시 조회)
	@RequestMapping("/notice_{ann_seq}")
	public String noticeUpdateForm(@PathVariable("ann_seq") int annSeq,
			Model model, String cmd) {
		NotiDTO notice = notiService.selectSeq(annSeq);

		model.addAttribute("cmd", cmd);
		model.addAttribute("notice", notice);
		return "notice";
	}

	// 공지사항 인서트
	// 공지사항 인서트 및 파일 업로드 처리
	@RequestMapping(value = "/insertNoti", method = RequestMethod.POST)
	public String insertNotice(MultipartHttpServletRequest req) {
		// 공지사항 정보 출력
		NotiDTO dto = new NotiDTO();
		// MultipartHttpServletRequest로부터 'title' 및 'content' 파라미터 가져오기
		String class_id = req.getParameter("class_id");
		String lib_id = req.getParameter("lib_id");
		String ann_detail = req.getParameter("ann_detail");
		String ann_title = req.getParameter("ann_title");
		String ann_regi = req.getParameter("ann_regi");
		System.out.println("class_id: " + class_id);
		System.out.println("lib_id: " + lib_id);
		System.out.println("ann_title: " + ann_title);
		System.out.println("ann_regi: " + ann_regi);

		dto.setAnn_detail(ann_detail); // 내용
		dto.setClass_id(class_id); // 분류 ID
		dto.setLib_id(lib_id); // 도서관 ID
		dto.setAnn_title(ann_title); // 제목
		dto.setAnn_regi(ann_regi); // 등록일

		// 공지사항의 파일 처리 (단일 파일 처리)
		MultipartFile mf = req.getFile("ann_attach"); // 'ann_attach'는 HTML 폼의
														// 파일 필드 이름

		// 파일 저장 경로 설정
		String path = "C:\\temp\\upload"; // 서버 환경에 맞게 변경 필요

		if (mf != null && !mf.isEmpty()) {
			long fileSize = mf.getSize();
			String fileName = mf.getOriginalFilename();
			System.out.println("fileSize: " + fileSize);
			System.out.println("fileName: " + fileName);

			try {
				// 안전한 파일 이름 생성 (현재 시간 기반)
				String name = System.currentTimeMillis() + "_" + fileName;
				String safeFileName = path + "\\" + name;
				System.out.println("safeFileName: " + safeFileName);

				// 파일 저장 경로에 파일 객체 생성
				File file = new File(safeFileName);

				// 파일을 해당 경로에 전송 (저장)
				mf.transferTo(file);

				// 저장된 파일명 또는 경로를 DTO에 설정
				dto.setAnn_attach(name); // 파일

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 공지사항 서비스에 공지사항 정보 저장 로직 호출
		notiService.insertNotice(dto);

		// 공지사항 목록 페이지로 리다이렉트
		return "redirect:/notice2";

	}

	// // 공지사항 업데이트 (noticeDTO의 데이터를 받아서 업데이트)
	// @RequestMapping(value = "/notice2", method = RequestMethod.POST)
	// public String updateNotice(NotiDTO dto) {
	// notiService.updateNotice(dto);
	// return "redirect:/notice2";
	// }

	// @RequestMapping 경로설정
	@RequestMapping(value = "/notice2", method = RequestMethod.DELETE)
	@ResponseBody
	public int delEmp(@RequestBody NotiDTO notiDTO) {
		System.out.println("삭제확인");
		int delete = notiService.deleteNotice(notiDTO);
		System.out.println("삭제 : " + delete);

		return delete;
	}

	// 공지사항 수정 요청을 처리하는 메소드 (PUT 메서드)
	@RequestMapping(value = "/notice2", method = RequestMethod.PUT)
	@ResponseBody
	public int updateNotice(@RequestBody NotiDTO notiDTO) {
		int result = -1;

		try {
			// 공지사항 수정 로직 호출
			result = notiService.updateNotice(notiDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("수정 결과 : " + result);

		return result;
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
