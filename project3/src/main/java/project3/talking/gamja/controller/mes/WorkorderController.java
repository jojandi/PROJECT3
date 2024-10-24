package project3.talking.gamja.controller.mes;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.talking.gamja.dto.mes.MesWorkorderDTO;
import project3.talking.gamja.service.mes.WorkorderService;

@Controller
@RequestMapping("/mes")
public class WorkorderController {

	@Autowired
	WorkorderService woService;

	// 작업지시서 select
	@RequestMapping(value = "mes_workorder1", method = RequestMethod.GET)
	public String workorder1(Model model, Integer os_id, Integer seq, Integer count, Integer pageNo) {

		// 페이징 기본값 설정
		if (count == null)
			count = 7;
		if (pageNo == null)
			pageNo = 1;

		Map map = woService.selectwo(count, pageNo);
		List<MesWorkorderDTO> bom_code = woService.selectBom();

		List<MesWorkorderDTO> list = (List<MesWorkorderDTO>) map.get("list");

		// 접속할 때 로그가 상태에 따라 업데이트
		for (int i = 0; i < list.size(); i++) {
			MesWorkorderDTO dto = list.get(i);
			int log = woService.logUpdate(dto);
			System.out.println("로그 업뎃 : " + log);
		}

		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		model.addAttribute("bom_code", bom_code);

		return "mes_workorder1";
	}

	// 작업지시서 selectOne
	@RequestMapping(value = "mes_workorder1_read", method = RequestMethod.GET)
	public String workorderRead(int wo_id, int os_id, Model model) {

		MesWorkorderDTO dto = new MesWorkorderDTO();

		dto.setWo_id(wo_id);
		dto.setOs_id(os_id);

		MesWorkorderDTO list = woService.selectOne(dto);

		model.addAttribute("list", list);

		return "mes_workorder1_read";
	}

	// 작업지시서 상태 update
	@RequestMapping(value = "/workorderUpdate", method = RequestMethod.POST)
	public String workorderUpdate(MesWorkorderDTO dto) {
		System.out.println("update 실행 ");
		System.out.println("////////////////////////////// od_is : " + dto.getOs_id());
		System.out.println("////////////////////////////// wo_id : " + dto.getWo_id());
		System.out.println("////////////////////////////// lr_seq : " + dto.getLr_seq());

		try {
			if ("완료".equals(dto.getWo_status())) {
				// 1. workorder 테이블에서 완료시 상태 update
				int result = woService.updateworead(dto);
				System.out.println("workorder 테이블에서 완료시 상태 update : " + result);

				// 2. pfwork 테이블에서 주문현황 상태 update
				int update = woService.updatepf(dto);
				System.out.println("pfwork 테이블에서 주문현황 상태 update : " + update);

				// 3. mes_book 테이블에서 book_count 업데이트 (수량 추가)
				int add =woService.updatewo(dto);
				System.out.println("3. mes_book 테이블에서 book_count 업데이트 (수량 추가) : " + add);

				// 4. pfwork 테이블에서 출고현황 insert
				int insert = woService.insertpf(dto);
				System.out.println("4. pfwork 테이블에서 출고현황 insert : " + insert);

				// 5. admin request 테이블에서 상태 update
				int req = woService.requestpf(dto);
				System.out.println("5. admin request 테이블에서 상태 update : " + req);
				
				// 6. admin application 테이블에서 상태 update
				int apply = woService.applypf(dto);
				System.out.println("6. admin application 테이블에서 상태 update : " + apply);
				
				// 7. 로그 insert
				int log = woService.logInsert(dto);
				System.out.println("7. 로그 insert : " + log);
			}
			if ("배송공정".equals(dto.getWo_process())) {
				woService.updatewopro(dto);
				woService.logInsert(dto);
			}

		} catch (Exception e) {
			// 예외 발생 시 에러 로그 출력
			e.printStackTrace(); // 콘솔에 전체 예외 정보를 출력
		}
		return "redirect:/mes/mes_workorder1";
	}

	// 작업지시서 insert
	/*
	 * @RequestMapping(value = "insertwo", method = RequestMethod.POST){
	 * 
	 * if("배송공정".equals(dto.getWo_process())) { // 4. pfwork 테이블에서 출고현황 insert
	 * woService.insertpf(dto);
	 * 
	 * // 5. admin request 테이블에서 상태 update woService.requestpf(dto);
	 * 
	 * // 6. 작업 로그 insert woService.logInsert(dto);
	 * 
	 * } if("배송공정".equals(dto.getWo_process())) { woService.updatewopro(dto);
	 * woService.logInsert(dto); }
	 * 
	 * } catch (Exception e) { // 예외 발생 시 에러 로그 출력 e.printStackTrace(); // 콘솔에 전체 예외
	 * 정보를 출력 } return "redirect:/mes/mes_workorder1"; }
	 */
	
	@RequestMapping(value="insertwo", method=RequestMethod.POST)
	public String insertwo(MesWorkorderDTO dto) {
		int result = -1;

		try {
			result = woService.insertwo(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("insert : " + result);

		return "redirect:/mes/mes_workorder1";
	}

	// BOM 페이지
	@RequestMapping(value = "/mes_workorder2", method = RequestMethod.GET)
	public String mesBom(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if (count == null)
			count = 9;
		if (pageNo == null)
			pageNo = 1;

		Map map = woService.getList2(count, pageNo);

		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);

		return "mes_workorder2";
	}

	@RequestMapping(value = "/mes_workorder2_read", method = RequestMethod.GET)
	public String MesBomRead(@RequestParam("bom_code") int bomCode, Model model) {
		// bom_code 값을 받아서 처리
		MesWorkorderDTO dto = new MesWorkorderDTO();
		dto.setBom_code(bomCode);

		// 서비스 호출해서 해당 bom_code에 대한 데이터를 가져옴
		MesWorkorderDTO list = woService.MesBomRead(dto);
		List list2 = woService.bomSelect();

		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		// bom_read.jsp 페이지로 이동
		return "mes_workorder2_read";
	}

	@RequestMapping(value = "/updateBom", method = RequestMethod.POST)
	public String updateBom(MesWorkorderDTO orderDTO) {

		System.out.println("updateBom 실행");

		int result = woService.updateBom(orderDTO);
		System.out.println("update 결과 : " + result);

		return "redirect:/mes/mes_bom";
	}

	@RequestMapping(value = "/insertBom", method = RequestMethod.POST)
	public String insertBom(MesWorkorderDTO dto) {
		int result = -1;

		try {
			result = woService.insertBom(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("insert : " + result);

		return "redirect:mes_bom";
	}

	// BOM create Read 페이지
	@RequestMapping(value = "/mes_workorder2_create", method = RequestMethod.GET)
	public String mesBomCreate(Model model) {
		System.out.println("Bomcreate 실행!");

		List<MesWorkorderDTO> list = woService.getList3();

		model.addAttribute("list", list);

		return "mes_workorder2_create";
	}

	@RequestMapping(value = "/mes_bomdelete", method = RequestMethod.POST)
	public String mesBomDelete(MesWorkorderDTO dto, @RequestParam Integer bom_code) {

		try {
			woService.deleteBom(dto);

		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:/mes/mes_workorder2";
	}
}
