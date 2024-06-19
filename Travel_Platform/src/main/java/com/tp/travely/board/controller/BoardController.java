package com.tp.travely.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tp.travely.board.model.service.BoardService;
import com.tp.travely.board.model.vo.Board;
import com.tp.travely.board.model.vo.BoardImg;
import com.tp.travely.board.model.vo.BoardLike;
import com.tp.travely.board.model.vo.Reply;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.common.template.Pagination;
import com.tp.travely.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	
	// 게시글 목록
	@GetMapping("selectList.bo")
	public String boardListView(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								Model model) {
		
		
		
		int listCount = boardService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 16;
		
		// System.out.println(listCount);
		
		// PageInfo 객체 만들어내기
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		// 목록불러오는 기능 추가 예정
		ArrayList<Board> list1 = boardService.selectListBoard(pi);
		ArrayList<BoardImg> list2 = boardService.selectListBoardImg();
		
		ArrayList<Member> list3 = boardService.selectMember();
		// 회원 목록조회 메소드도 사용해야함
		
		// 각 게시글번호당 좋아요 수 가져오기
		ArrayList<Integer> list4 = new ArrayList<>();
		// > 10칸짜리 빈 ArrayList 객체 
		//   int 형으로 받아오기 때문에 Integer 타입으로 제네릭 설정
		
		for(int i=0; i<list1.size(); i++) {
			list4.add(boardService.likeListCount(list1.get(i).getBoardNo())); 
		}
		// > 이 시점부터 list4에 각 게시글 번호당 좋아요 총 갯수가 담겨있을 것임
		
		/*
		for(Integer i : list4) {
			System.out.println(i);
		}
		*/
		// System.out.println(list1);
		// System.out.println(list2);
		// System.out.println(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("bList", list1);
		model.addAttribute("biList", list2);
		model.addAttribute("mList", list3);
		model.addAttribute("likeCount", list4);
		
		
		return "board/boardListView";
	}
	
	// 게시글 작성페이지
	@GetMapping("enrollForm.bo")
	public String boardEnrollform() {
		
		return "board/boardInsert";
	}
	
	// 게시글 작성
	@PostMapping("insert.bo")
	public ModelAndView insertBoard(Board b, BoardImg bi, String userNo,
							  ArrayList<MultipartFile> upfiles,
							  HttpSession session,
							  ModelAndView mv) {
		
		int result = boardService.insertBoard(b);
		int results = 0;
		// System.out.println(result);
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
				// System.out.println(results);
			} else {
				continue;
			}
			
			
		
		}
		
		if(result > 0 && results > 0) {
			
			mv.addObject("alertMsg", "게시글 작성 성공");
			mv.setViewName("redirect:/selectList.bo");
		} else {
			
		}
		
		return mv;
	}
	
	// 게시글 수정페이지로 포워딩
	@PostMapping("updateForm.bo")
	public String updateFormBoard(String[] upfiles, int bno, Model model) {
		
		
		
		ArrayList<BoardImg> biList = boardService.selectBoardImg(bno);
		/*
		for(BoardImg bi: biList) {
			System.out.println(bi);
		}
		*/
		Board b = boardService.selectBoard(bno);
		
		model.addAttribute("b", b);
		model.addAttribute("biList", biList);
		
		return "board/boardUpdate";
	}
	
	// 게시글 수정
	@PostMapping("update.bo")
	public String updateBoard(Board b, String userNo,
							  ArrayList<MultipartFile> reupfiles,
							  HttpSession session,
							  Model model) {
		
		BoardImg bi = new BoardImg();
		
		ArrayList<BoardImg> biList = boardService.selectBoardImg(b.getBoardNo());
		// 4
		// System.out.println(reupfiles);
		/*
		for(BoardImg bis : biList) {
			System.out.println(bis);
		}
		*/
		int result1 = boardService.updateBoard(b);
		int result2 = boardService.updateBiStatus(b.getBoardNo());
		int result3 = 0;
		int result4 = 0;
		
		
		for(int i=0; i<biList.size(); i++) {
			if(!reupfiles.get(i).getOriginalFilename().equals("")) {
				// 넘어온 첨부파일이 있을 경우
				String changeName = savePath(reupfiles.get(i), session);
				bi.setChangeName("resources/boardUpfiles/"+changeName);
			} else if(reupfiles.get(i).getOriginalFilename().equals("")) {
				bi.setChangeName(biList.get(i).getChangeName());
			} else {
				continue;
			}
				bi.setBoardNo(String.valueOf(b.getBoardNo()));
			if(i == 0) {
				bi.setFileLevel("1");
			} else {
				bi.setFileLevel("2");
			}
				// System.out.println(bi);
			
				 result3 = boardService.updateBoardImg(bi);
		}
		
		for(int i=biList.size(); i<reupfiles.size(); i++) {
			if(!reupfiles.get(i).getOriginalFilename().equals("")) {
				// 넘어온 첨부파일이 있을 경우
				String changeName = savePath(reupfiles.get(i), session);
				bi.setChangeName("resources/boardUpfiles/"+changeName);
			} else {
				continue;
			}
				bi.setBoardNo(String.valueOf(b.getBoardNo()));
				// System.out.println(bi);

				result4 = boardService.updateBoardImg(bi);
		}
	
		
		// System.out.println(result1);
		// System.out.println(result2);
		// System.out.println(result3);
		// System.out.println(result4);
		
		
		return "redirect:/detail.bo?bno="+b.getBoardNo()+"";
	}
	
	// 게시글 버블링 이미지 수정
	@ResponseBody
	@PostMapping("ajaxUpdate.bo")
	public String ajaxUpdateBoardImg(int imgNo) {
	
		
		int result = boardService.ajaxUpdate(imgNo);
		
		System.out.println(imgNo);
		return "성공";
	}
	
	// 게시글 삭제
	@ResponseBody
	@PostMapping("delete.bo")
	public String deleteBoard(int bno, Model model) {
		
		int result = boardService.deleteBoard(bno);
		// System.out.println(bno);
		return "success";
	}
	
	
	
	// 게시글 상세조회
	@GetMapping("detail.bo")
	public String detailBoard(@RequestParam(value="bno") int bno,
							  Model model) {
		
		// System.out.println(bno);
		
		int result = boardService.increaseCount(bno);
		
		if(result > 0) { // 성공적으로 조회수가 증가되었다면
		
			
			Member m = boardService.selectDetailMember(bno);
			Board b = boardService.selectBoard(bno);
			
			ArrayList<BoardImg> biList = boardService.selectBoardImg(bno);
			model.addAttribute("m", m);
			model.addAttribute("b", b);
			model.addAttribute("biList", biList);
			
			
			return "board/boardDetailView";
		
		} else {
			
		
		
		return "board/boardDetailView";  
		}
	}
	
	
	// 좋아요 체크
	@ResponseBody
	@GetMapping(value="likeCheck.bo", produces="text/html; charset=UTF-8")
	public String ajaxLikeCheck(int bno,
								HttpSession session,
								Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		BoardLike bl = new BoardLike(userNo, bno);
		
		int checkResult = boardService.likeCheck(bl);
		
		// System.out.println(checkResult);
		
		return String.valueOf(checkResult);
		
	}
	
	// 좋아요 추가
	@ResponseBody
	@GetMapping(value="linsert.bo", produces="text/html; charset=UTF-8")
	public String ajaxLikeInsert(int bno,
								HttpSession session,
								Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		BoardLike bl = new BoardLike(userNo, bno);
		
		int result = boardService.insertLike(bl);
		
		return String.valueOf(result);
		
	}
	
	// 좋아요 삭제
	@ResponseBody
	@GetMapping(value="ldelete.bo", produces="text/html; charset=UTF-8")
	public String ajaxLikeDelete(int bno,
								HttpSession session,
								Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		BoardLike bl = new BoardLike(userNo, bno);
		
		int result = boardService.deleteLike(bl);
		
		return String.valueOf(result);
		
	}
	
	// 댓글 작성
	@ResponseBody
	@PostMapping(value="rinsert.bo",  produces = "text/html; charset=UTF-8")
	public String ajaxReplyInsert(Reply r,
								  HttpSession session,
								  Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		r.setUserNo(String.valueOf(userNo)); 
		
		int result = boardService.insertReply(r);
		
	
		Member m = boardService.selectDetailMember(Integer.parseInt(r.getBoardNo()));
		
		model.addAttribute("m", m);
	
		
		
		return (result > 0) ? "success" : "fail";
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		
		ArrayList<Reply> list1 = boardService.selectReplyList(bno);
		/*
		for(Reply r : list) {
			
			System.out.println(r);
		}
		*/
		
		ArrayList<Member> list2 = new ArrayList<> ();
		
		Reply r = new Reply();
		
		for(int i=0; i<list1.size(); i++) {
			
			r.setBoardNo(String.valueOf(bno));
			r.setReplyNo(list1.get(i).getReplyNo());
			list2.add(boardService.selectReplyMember(r));
		}
								// 제네릭 와일드카드 어느 제네릭이나 사용 가능
		HashMap<String, ArrayList<?>> Map = new HashMap<> ();
		
		Map.put("rList",list1);
		Map.put("mList",list2);
		
		return new Gson().toJson(Map);
	}
	
	// 댓글 수정
	@ResponseBody
	@PostMapping(value="rUpdate.bo", produces = "application/json; charset=UTF-8")
	public void ajaxUpdateReply(Reply r) {
		
		//System.out.println(r);
		
		int result = boardService.updateReply(r);
		
		
		
	}

	// 댓글 삭제
	@ResponseBody
	@PostMapping(value="rDelete.bo", produces = "application/json; charset=UTF-8")
	public void ajaxDeleteReply(Reply r) {
		
		//System.out.println(r);
		
		int result = boardService.deleteReply(r);
		
		
		
	}
	
		// 게시글 검색 목록
		@GetMapping("search.ad")
		public String boardSearchListView(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									String keyword, Model model) {
			
			
//			System.out.println(keyword);
			int listCount = boardService.searchBoardCount(keyword);
//			System.out.println(listCount);
			
			int pageLimit = 10;
			int boardLimit = 16;
			
			// System.out.println(listCount);
			
			// PageInfo 객체 만들어내기
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			
			// 목록불러오는 기능 추가 예정
			ArrayList<Board> list1 = boardService.searchListBoard(keyword, pi);
//			System.out.println(list1);
			ArrayList<BoardImg> list2 = boardService.searchListBoardImg(keyword);
//			System.out.println(list2);
			ArrayList<Member> list3 = boardService.searchMember(keyword);
			// 회원 목록조회 메소드도 사용해야함
			
			// 각 게시글번호당 좋아요 수 가져오기
			ArrayList<Integer> list4 = new ArrayList<>();
			// > 10칸짜리 빈 ArrayList 객체 
			//   int 형으로 받아오기 때문에 Integer 타입으로 제네릭 설정
			
			for(int i=0; i<list1.size(); i++) {
				list4.add(boardService.likeListCount(list1.get(i).getBoardNo())); 
			}
			
			
			model.addAttribute("pi", pi);
			model.addAttribute("bList", list1);
			model.addAttribute("biList", list2);
			model.addAttribute("mList", list3);
			model.addAttribute("likeCount", list4);
			
			
			return "board/boardListView";
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
