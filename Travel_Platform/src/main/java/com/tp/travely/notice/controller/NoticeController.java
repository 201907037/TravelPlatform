package com.tp.travely.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.common.template.Pagination;
import com.tp.travely.notice.model.service.NoticeService;
import com.tp.travely.notice.model.vo.Notice;

// 공지사항 관련 Controller
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 리스트뷰 Controller
	@GetMapping(value="noticeList.ad")
	public String adminNoticeListView(Model model) {
//		System.out.println("adminNoticeListView");
		
		ArrayList<Notice> list = noticeService.adminNoticeListView();
		
//		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "notice/adminNoticeListView";
	}
	
	// 공지사항 작성 페이지 이동 메서드
	@GetMapping(value="enrollFormNotice.ad")
	public String enrollFormNotice() {

		return "notice/enrollFormNotice";
	}
	
	// 공지사항 insert Controller
	@PostMapping(value="insertNotice.ad")
	public ModelAndView insertNotice(Notice n, 
							MultipartFile upfile,
							HttpSession session,
							ModelAndView mv) {
		if(!upfile.getOriginalFilename().equals("")) {
			String afterName = savePath(upfile, session);
			n.setChangeName("resources/noticeUpfiles/"+afterName);
		}else {
			// 빈값일 경우 빈문자열
			n.setChangeName("");
		}

		int result = noticeService.insertNotice(n);
		
		if(result >0) {
			// 일회성 알람문구를 출력하고 list.bo 로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			mv.setViewName("redirect:/noticeList.ad");
		}else {
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 삭제 Controller
	@GetMapping(value="deleteNotice.ad")
	public ModelAndView deleteNotice(int num,
								HttpSession session,
								ModelAndView mv) {
//		System.out.println(num);
		
		int result = noticeService.deleteNotice(num);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			mv.setViewName("redirect:/noticeList.ad");
		}else {
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 상세보기 Controller
	@GetMapping(value="detailNotice.bo")
	public String detailNotice(int num,
							Model model) {
		
		Notice n = noticeService.detailNotice(num);
		// System.out.println(n);
		
		model.addAttribute("n", n);
		
		return "notice/detailNotice";
	}
	
	
	
	
	
	
//	// 공지사항 수정 페이지 이동 Controller
//	@ResponseBody
//	@GetMapping(value="updateFormNotice.ad")
//	public void updateFormNotice(int num,
//							Model model) {
//		System.out.println(num);
//		Notice n = noticeService.detailNotice(num);
////		System.out.println(n);
//		model.addAttribute("n", n);
//		
//	}
	
	
	
	
	
	
	
	// 공지사항 수정 메서드
	@PostMapping(value="updateNotice.ad")
	public ModelAndView updateNotice(Notice n,
							MultipartFile reUpfile,
							HttpSession session,
							ModelAndView mv) {
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			String afterName = savePath(reUpfile, session);
			n.setChangeName("resources/noticeUpfiles/"+afterName);
		}else {
			// 빈값일 경우 빈문자열
			n.setChangeName("");
		}
		
		int result = noticeService.updateNotice(n);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 추가되었습니다.");
			
			mv.setViewName("redirect:/noticeList.ad");
		}else {
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	// 공지사항 리스트뷰(일반 사용자) Controller
	@GetMapping(value="noticeList.bo")
	public String noticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								Model model) {
		
//		ArrayList<Notice> nList = noticeService.adminNoticeListView();
		
		int listCount = noticeService.noticeCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> nList = noticeService.noticetListView(pi);
		
		System.out.println(pi);
		System.out.println(nList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("nList", nList);
		
		return "notice/noticeList";
	}
	
	
	
	// 첨부파일 업로드 및 수정파일명 리턴 메서드
	public String savePath(MultipartFile upfile, HttpSession session) {

		// 예) "bono.jpg" --> "2024052116143012345.jpg"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename();
		// "bono.jpg"

		// 2. 시간 형식으로 문자열로 뽑아내기 (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// "20240521161430"

		// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
		int ranNum = (int) (Math.random() * 90000 + 10000);
		// 12345

		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		// ".jpg"

		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;

		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// > application 객체로부터
		// (webapp/resources/uploadFiles/~~)
		String savePath = session.getServletContext().getRealPath("/resources/noticeUpfiles/");

		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
		// > MultipartFile 객체가 제공하는
		//   transferTo 메소드를 이용함
//		System.out.println(savePath);
		try {

			upfile.transferTo(new File(savePath + changeName));

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		// 수정파일명 문자열을 리턴
		return changeName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
