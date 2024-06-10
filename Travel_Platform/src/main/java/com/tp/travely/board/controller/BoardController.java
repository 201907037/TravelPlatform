package com.tp.travely.board.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tp.travely.board.model.service.BoardService;
import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	
	// 게시글 목록
	@GetMapping("selectList.bo")
	public String boardListView(Model model) {
		
		// 목록불러오는 기능 추가 예정
		ArrayList<Board> list1 = boardService.selectListBoard();
		ArrayList<BoardImg> list2 = boardService.selectListBoardImg();
		
		// 회원 목록조회 메소드도 사용해야함
		
		System.out.println(list1);
		System.out.println(list2);
		
		
		model.addAttribute("bList", list1);
		model.addAttribute("biList", list2);
		
		
		
		return "board/boardListView";
	}
	
	
	@GetMapping("enrollForm.bo")
	public String boardEnrollform() {
		
		return "board/boardInsert";
	}
	
	
	@PostMapping("insert.bo")
	public ModelAndView insertBoard(Board b, BoardImg bi, String userNo,
							  ArrayList<MultipartFile> upfiles,
							  HttpSession session,
							  ModelAndView mv) {
		
		int result = boardService.insertBoard(b);
		int results = 0;
		System.out.println(result);
		for(int i=0; i<upfiles.size(); i++) {
			if(!upfiles.get(i).getOriginalFilename().equals("")) {
				// 요청 시 넘어온 첨부파일이 있을 경우
				String changeName = savePath(upfiles.get(i), session);
				
				
				//  원본파일명, 서버에 업로드된 경로를 포함한 수정파일명
				//    Board b 에 이어서 담기
				bi.setChangeName("resources/boardUpfiles/"+changeName);
				// > savePath메소드 안에 있는 changeName 변수를 사용하려면 메소드 호출시 리턴받아야함
				if(i == 0) {
					bi.setFileLevel("1");
				} else {
					bi.setFileLevel("2");
				}
				// 첨부파일이 있다면 자동으로 b객체 originName, changeName 필드값이 추가됨
				results = boardService.insertBoard(bi);
				System.out.println(results);
			} 
			
			
		
		}
		
		if(result > 0 && results > 0) {
			mv.setViewName("redirect:/selectList.bo");
		} else {
			
		}
		
		return mv;
		
	}
	//--------------------------- 일반메소드 영역 -------------------------------
	
		// 현재 넘어온 첨부파일 그 자체를 서버의 폴더로 저장시키는 메소드
		// > 일반 메소드로 BoardController 에 만들고 있음
		// > Controller 클래스에 url 을 요청하는 메소드만 있다라는 법은 없음!
		//   즉, 일반메소드도 내가 필요하다면 막 만들어서 호출해도됨!!
		public String savePath(MultipartFile upfile,
				 			 HttpSession session) {
			
			// 파일명 수정 작업 후 서버에 업로드 시키기
			// (기존에는 cos.jar 에서 제공하는 fileRenamePolicy 이용
			//  스프링에서는 기본적으로 제공되는게 없기 때문에 내가 직접 짜야함)
			// 예) "bono.jpg" -- > "20240521161412345.jpg" 년월일시분초+5자리랜덤값 
			// 1. 원본 파일명 뽑아오기
			String originName = upfile.getOriginalFilename();
			
			// 2. 시간 형식으로 문자열로 뽑아내기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 90000)
			
			int ranNum = (int)(Math.random()*90000 + 10000);
											// 12345
			
			// 4. 원본파일명으로부터 확장자명 뽑기
			String ext = originName.substring(originName.lastIndexOf("."));
			// > 마지막점부터 끝까지 확장자명 가져오기  
			// ".jpg"
			
			// 5. 2 ~ 4 까지 모두 이어 붙이기
			String changeName = currentTime + ranNum + ext;
			
			//System.out.println(changeName);
			
			// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
			// > application 객체로부터
			// (webapp/resources/uploadFiles/~~)
			String savePath
					= session.getServletContext().getRealPath("/resources/boardUpfiles/");
			
			// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
			// > MultipartFile 객체가 제공하는
			//   transferTo 메소드 이용함
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
			}
			
			// 수정파일명만 리턴
			return changeName;
		}
}
