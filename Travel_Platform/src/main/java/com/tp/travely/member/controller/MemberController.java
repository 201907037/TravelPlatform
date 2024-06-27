package com.tp.travely.member.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.NoSuchElementException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tp.travely.member.model.service.MailSendService;
import com.tp.travely.member.model.service.MemberService;
import com.tp.travely.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j // Lombok 이 제공해주는 어노테이션
//해당 클래스의 전역변수로 Logger 객체를 자동으로 생성해주는 어노테이션
//(Logger 객체명이 log 로 잡힘)

//@Component // MemberController 클래스를 빈으로 등록하겠다.
@Controller // MemberController 클래스를 컨트롤러 역할을 하는 빈으로 등록하겠다.
//> 빈으로 잘 등록되었는지 확인하고 싶다면 Spring Explorer 확인해보기

public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	
	
	
	
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m,
									String saveId,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response) {
		
		log.debug("저장할 아이디 : " + saveId);
		
		// 아이디 저장 로직 추가
		if(saveId != null && saveId.equals("y")) {
			// 로그인 요청 시 아이디를 저장하겠다.
			
			// saveId 라는 키값으로 현재 아이디값을 쿠키로 저장
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			// 유효기간 1일
			cookie.setMaxAge(1 * 24 * 60 * 60); // 초단위로
			
			// 만들어진 Cookie 객체를 response 에 첨부
			response.addCookie(cookie);
			
		} else {
			// 아이디를 저장하지 않겠다.
			
			// 아이디를 저장한 쿠키를 삭제
			// > 삭제 구문이 따로 없으므로 동일한 키값으로 덮어씌우되,
			//   유효기간을 0 초로 지정하면됨
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		// 암호화 기능을 적용한 로그인 로직으로 변경
		
		// System.out.println(m); 
		// > 로그인 요청 시 사용자가 입력한 아이디, 비번
		// m 의 userId 필드 : 아이디 "평문" 형식
		// m 의 userPwd 필드 : 비밀번호 "평문" 형식
		
		Member loginUser = memberService.loginMember(m);
		// 기존 loginUser : 아이디와 비번이 모두 일치해야 단일행 조회
		// 변경된 loginUser : 오로지 아이디만을 가지고 일치해야 단일행 조회
		
		System.out.println(loginUser);
		// > 이 때, 아이디값이 일치하면 해당 회원의 정보가
		//   잘 조회된 것 확인
		//   비밀번호는 DB 에 실제 저장된 형태인 "암호문" 형식임
		//   (loginUser 의 userPwd 필드는 암호화된 비밀번호임)
		// > 반대로, 아이디값이 일치하지 않는다면 null 이 나옴
		
		// 로그인 : 아이디, 비번 모두가 일치해야 통과
		
		// 이 시점 기준으로 아이디까지만 일치 여부가 검사된것임!!
		
		// * 비밀번호 일치 여부 확인 방법
		// BCryptPasswordEncoder 객체의 matches 메소드
		// [ 표현법 ]
		// bcryptPasswordEncoder.matches(평문, 암호문);
		// > 내부적으로 두 구문이 일치하는지 비교 후
		//   일치한다면 true 리턴 / 일치하지않으면 false 리턴
		if(loginUser != null && 
		   bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			// 로그인 성공
			
			// 이 시점 기준으로 비밀번호도 검증 완료
			
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
			
			mv.setViewName("redirect:/");
			
		} else {
			// 로그인 실패
			
			session.setAttribute("alertMsg", "로그인에 실패했습니다.");
			
			mv.addObject("errorMsg", "로그인 실패");
			
			mv.setViewName("redirect:/");
		}
		
		return mv;
		
		// 암호화 작업 전에 구현한 것
		
	}
	
	@GetMapping("logout.me")
	public ModelAndView logoutMember(HttpSession session,
									 ModelAndView mv) {
		
		// System.out.println("잘 호출되나..?");
		
		// session 객체를 만료시키거나
		// session 으로 부터 loginUser 만 지우기
		
		// session.invalidate();
		// > session 에 다른 정보를 같이 담고 싶다면
		//   무효화 하는 방식은 사용 불가
		session.removeAttribute("loginUser");
		
		// 일회성 알람문구를 담아서 메인페이지로 url 재요청
		session.setAttribute("alertMsg", "성공적으로 로그아웃 되었습니다.");
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@GetMapping("loginPage.me")
	public String loginPage() {
		
		
		return "member/loginForm";
	}
	
	@GetMapping("searchId.me")
	public String searchId() {
		
		
		return "member/search_id";
	}
	
	@GetMapping("resetPassword.me")
	public String resetPassword() {
		
		
		return "member/reset_password";
	}
	
	@GetMapping("updatePassword.me")
	public String updatePassword() {
		
		
		return "member/update_password";
	}
	
	@GetMapping("enrollForm.me")
	public String enrollForm() {
		
		// 단순히 회원가입 페이지만 포워딩
		// /WEB-INF/views/member/memberEnrollForm.jsp
		return "member/memberEnrollForm";
	}
	
	@PostMapping("insert.me")
	public String insertMember(Member m,
				  			   Model model,
				  			   HttpSession session, String email1, String email2) {
		
		
		String encPwd 
			= bcryptPasswordEncoder.encode(m.getUserPwd());
		
		// System.out.println("암호문 : " + encPwd);
		
		// 커맨드 객체 방식으로 전달받은 m 의 userPwd 필드값을
		// encPwd 값으로 셋팅
		m.setUserPwd(encPwd);
		m.setEmail(email1.concat(email2));
		System.out.println(m);
		// > 비밀번호 필드만 암호문으로 대체된 것 확인
		
		m.setChangeName("resources/profileImages/to2.jpg");
		
		int result = memberService.insertMember(m);
		
		// 결과에 따른 응답페이지 지정
		if(result > 0) { // 성공
			
			// 일회성 알람문구를 담아 메인페이지로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			
			return "redirect:/";
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원가입 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
			return "common/errorPage";
		}
		
	} // insertMember 메소드 영역 끝
	
	@GetMapping("myPage1.me")
	public String myPage1() {
		
		// System.out.println("마이페이지 요청됨");
		log.debug("마이페이지 요청됨");
		
		// 마이페이지 화면 포워딩
		// /WEB-INF/views/member/myPage.jsp
		return "member/myPage1";
	}
	
	@GetMapping("myPageList.me")
	public String myPageList() {
		
		// System.out.println("마이페이지 요청됨");
		log.debug("마이페이지 요청됨");
		
		// 마이페이지 화면 포워딩
		// /WEB-INF/views/member/myPage.jsp
		return "member/myPageList";
	}
	
	@GetMapping("myPage.me")
	public String myPage() {
		
		// System.out.println("마이페이지 요청됨");
		log.debug("마이페이지 요청됨");
		
		// 마이페이지 화면 포워딩
		// /WEB-INF/views/member/myPage.jsp
		return "member/myPage";
	}
	
	@GetMapping("intro.me")
	public String intro() {
		
		// System.out.println("마이페이지 요청됨");
		
		
		// 마이페이지 화면 포워딩
		// /WEB-INF/views/member/myPage.jsp
		return "intro";
	}
	
	@GetMapping("main")
	public String main() {
		
		// System.out.println("마이페이지 요청됨");
		
		
		// 마이페이지 화면 포워딩
		// /WEB-INF/views/member/myPage.jsp
		return "main";
	}
	
	
	
	
	
	@PostMapping("update.me")
	public String updateMember(@ModelAttribute Member m,
	                           
	                           HttpSession session) {

	    

	    MultipartFile profileImage = m.getProfileImageFile();

	    // 기존 프로필 사진 경로 가져오기
	    Member existingMember = (Member) session.getAttribute("loginUser");
	    String currentProfileImagePath = existingMember.getChangeName();

	    // 프로필 이미지 업로드가 없을 경우 기존의 프로필 사진 유지
	    if (profileImage == null || profileImage.isEmpty()) {
	        m.setChangeName(currentProfileImagePath);
	    } else {
	        // 새로운 프로필 이미지가 있는 경우, 업로드된 파일을 저장하고 파일 경로를 설정
	        String fileName = "resources/profileImages/" + saveFile(profileImage, session);
	        m.setChangeName(fileName);

	        // 기존의 프로필 사진 파일 삭제 (선택적으로 처리 가능)
	        // deleteFile(currentProfileImagePath);
	    }

	    int result = memberService.updateMember(m);

	    if (result > 0) {
	        Member updateMem = memberService.loginMember(m);
	        session.setAttribute("loginUser", updateMem);
	        session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
	    } else {
	        session.setAttribute("alertMsg", "회원정보 변경에 실패했습니다.");
	    }

	    return "redirect:/";
	}

	






	private String saveFile(MultipartFile file, HttpSession session) {
	    String savePath = session.getServletContext().getRealPath("resources/profileImages");
	    String originalFileName = file.getOriginalFilename();
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	    String changeName = currentTime + ext;

	    try {
	        file.transferTo(new File(savePath + File.separator + changeName));
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return changeName;
	}






	@PostMapping("delete.me")
	public String deleteMember(Member m,
					 		   HttpSession session,
					 		   Model model) {
		
		// System.out.println(m);
		// > m 의 userPwd 필드 : 회원 탈퇴 요청 시
		//   				     사용자가 입력했던 비번 "평문"
		// > m 의 userId 필드 : 사용자가 입력했던 아이디
		
		// 비밀번호 먼저 대조
		// 암호화된 비밀번호 구하기 : session 의 loginUser 의
		//					   userPwd 필드에 있음
		String encPwd 
			= ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		// System.out.println(m.getUserPwd());
		// System.out.println(encPwd);
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {
			// 비밀번호가 맞을 경우
			// > 탈퇴 처리
			
			int result 
				= memberService.deleteMember(m.getUserId());
			
			if(result > 0) { // 탈퇴 처리 성공
				
				// 일회성 알람 문구 담고 로그아웃 처리
				// > 메인페이지로 url 재요청
				
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.");
				
				session.removeAttribute("loginUser");
				
				return "redirect:/";
				
			} else { // 탈퇴 처리 실패
				
				session.setAttribute("alertMsg", "탈퇴에 실패했습니다 비밀번호를 확인해주세요.");
				
				session.removeAttribute("loginUser");
				
				return "redirect:/";
			}
			
		} else {
			// 비밀번호가 틀릴 경우
			
			// 일회성 알람 문구로 비밀번호가 틀렸다고 알려주고
			// 마이페이지로 url 재요청
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력했습니다. 다시 확인해 주세요.");
			
			return "redirect:/";
		}
	}
	
	@ResponseBody // 리턴하는 문자열이 응답데이터임을 알려줌
	@GetMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		// System.out.println(checkId);
		// > 중복확인할 아이디값이 전달됨
		System.out.println(checkId);
		int count = memberService.idCheck(checkId);
		
		// count 가 1일 경우 : 이미 존재하는 아이디 (사용 불가)
		// count 가 0일 경우 : 존재하지 않는 아이디 (사용 가능)
		/*
		if(count > 0) { // 사용불가능 "NNNNN"
			
			return "NNNNN";
			
		} else { // 사용가능 "NNNNY"
			
			return "NNNNY";
		}
		*/
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody // 리턴하는 문자열이 응답데이터임을 알려줌
	@GetMapping(value="nickCheck.me", produces="text/html; charset=UTF-8")
	public String nickCheck(String checkNick) {
		
		// System.out.println(checkId);
		// > 중복확인할 아이디값이 전달됨
		
		int count = memberService.nickCheck(checkNick);
		
		// count 가 1일 경우 : 이미 존재하는 아이디 (사용 불가)
		// count 가 0일 경우 : 존재하지 않는 아이디 (사용 가능)
		/*
		if(count > 0) { // 사용불가능 "NNNNN"
			
			return "NNNNN";
			
		} else { // 사용가능 "NNNNY"
			
			return "NNNNY";
		}
		*/
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody // 리턴하는 문자열이 응답데이터임을 알려줌
	@GetMapping(value="emailCheck.me", produces="text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		
		// System.out.println(checkId);
		// > 중복확인할 아이디값이 전달됨
		
		int count = memberService.emailCheck(checkEmail);
		
		// count 가 1일 경우 : 이미 존재하는 아이디 (사용 불가)
		// count 가 0일 경우 : 존재하지 않는 아이디 (사용 가능)
		/*
		if(count > 0) { // 사용불가능 "NNNNN"
			
			return "NNNNN";
			
		} else { // 사용가능 "NNNNY"
			
			return "NNNNY";
		}
		*/
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	
	@Autowired
	private MailSendService mailService;
	
	//회원가입 페이지 이동
		@GetMapping("/userJoin")
		public void userJoin() {}
	
	//이메일 인증
		@GetMapping("/mailCheck.do")
		@ResponseBody
		public String mailCheck(String email, String randomNumber) {
			log.debug("이메일 인증 요청: " + email);
		    String authNumber = mailService.joinEmail(email, randomNumber);
		    log.debug("생성된 인증번호: " + authNumber);
		    return randomNumber;
		}
		
	
	 @PostMapping("findId.me")
	    public String findId(@RequestParam("email") String email, Model model, RedirectAttributes redirectAttributes) {
	        String userId = memberService.findUserIdByEmail(email);

	        if (userId == null) {
	            redirectAttributes.addFlashAttribute("message", "존재하지 않는 이메일입니다.");
	            return "redirect:/searchIdPage"; // 아이디 찾기 페이지로 리다이렉트
	        }

	        model.addAttribute("userId", userId);
	        return "member/showUserId"; // 아이디를 보여주는 페이지로 이동
	    }

    @GetMapping("/searchIdPage")
    public String searchIdPage() {
        return "member/search_id"; // search_id.jsp를 반환
    }


    @PostMapping("resetPassword.me")
    public String resetPassword(@RequestParam("email") String userEmail, RedirectAttributes redirectAttributes) {
        boolean emailExists = memberService.sendResetPasswordEmail(userEmail);

        if (!emailExists) {
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 이메일입니다.");
            return "redirect:/resetPasswordPage"; // 비밀번호 초기화 페이지로 리다이렉트
        }

        return "member/showUserPwd"; // 비밀번호를 보여주는 페이지로 이동
    }
	
	@GetMapping("/resetPasswordPage")
    public String resetPasswordPage() {
        return "member/reset_password"; // reset_password.jsp를 반환
    }
    
	@PostMapping("/updatePassword.me")
	public String updatePassword(
	        @RequestParam("userId") String userId,
	        @RequestParam("currentPassword") String currentPassword,
	        @RequestParam("newPassword") String newPassword,
	        HttpSession session,
	        RedirectAttributes redirectAttributes) {

	    boolean result = memberService.updatePassword(userId, currentPassword, newPassword);

	    if (result) {
	        session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
	        redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
	        return "redirect:/";
	    } else {
	    	
	    	redirectAttributes.addFlashAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
	        return "redirect:/updatePasswordPage";
	    }
	}
	
	 @GetMapping("/updatePasswordPage")
	    public String updatePasswordPage() {
	        return "member/update_password"; // search_id.jsp를 반환
	    }
	
	

	// 다른 컨트롤러 메서드들...



class UpdatePasswordRequest {
	private String userId;
	private String currentPassword;
	private String newPassword;
	
	// getters, setters, toString 메서드 생략
}
    
 
	
		
		
	
	
	

}
