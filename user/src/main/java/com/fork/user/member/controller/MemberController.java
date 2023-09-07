package com.fork.user.member.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fork.user.common.Utils;
import com.fork.user.member.model.service.MemberService;
import com.fork.user.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;

	/**
	 * 로그인 기능
	 * @return
	 */
	@PostMapping("/member/login")
	public String login(
			Member m,
			HttpSession session, 
			Model model
			) {
		
		Member loginUser = mService.login(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			// return "redirect:main"; // 바꿀 예정
			System.out.println(loginUser);
			return "redirect:/index.jsp"; 
		} else {
			return "forward:index.jsp"; 
		}
		
	}
	
	/**
	 * 회원가입 동의서 페이지로 이동
	 * @return
	 */
	@GetMapping("/enrollForm1")
	public String enroll1() {
		return "member/enrollPage2";
	}
	
	/**
	 * 회원가입 입력 페이지로 이동
	 * @return
	 */
	@GetMapping("/enrollForm2")
	public String enroll2() {
		return "member/enrollPage1";
	}
	
	/**
	 * 회원가입
	 * @param m
	 * @param addressOne
	 * @param addressDetail
	 * @param file
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/enroll")
	public String enrollMember(
				Member m,
				@RequestParam("addressOne") String addressOne,
				@RequestParam("addressDetail") String addressDetail,
				@RequestParam("file") MultipartFile file,
				HttpSession session, 
				Model model
			) {
		
		String webPath = "/resources/files/";
		String severFolderPath = application.getRealPath(webPath);
		
		File dir = new File(severFolderPath);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}

		String changeName = Utils.saveFile(file, severFolderPath);
		m.setFileOriginName(file.getOriginalFilename());
		m.setFileChangeName(changeName);
		
		String address = addressOne + addressDetail;
		m.setAddress(address);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
		} else {
			session.setAttribute("alertMsg", "회원가입 실패");
		}
		
		return "forward:index.jsp";
		
	}
	
	/**
	 * 아이디 찾기 페이지로 이동 
	 * @return
	 */
	@GetMapping("/searchId")
	public String searchId() {
		return "member/searchId";
	}

	/**
	 * 비밀번호 찾기 페이지로 이동
	 * @return
	 */
	@GetMapping("/searchPwd")
	public String searchPwd() {
		return "member/searchPwd";
	}
	
	/**
	 * 아이디 찾기
	 * @param m
	 * @return
	 */
	@PostMapping("/searchId")
	@ResponseBody
	public ResponseEntity<Member> selectId(Member m) {
		Member member = mService.selectId(m);
		return ResponseEntity.ok(member);
	}
	
	/**
	 * 비밀번호 찾기
	 * @param m
	 * @param session
	 * @return
	 */
	@PostMapping("/selectPwd")
	public String selectPwd(
				Member m,
				HttpSession session
			) {
		
		Member member = mService.selectPwd(m);
		
		if(member != null) {
			sendEmail(member);
			session.setAttribute("m", m);
			return "member/checkNumber";
		} else {
			session.setAttribute("alertMsg", "아이디 또는 이메일을 잘못입력하셨습니다.");
			return "member/searchPwd";
		}
		
	}
	
	/**
	 * 이메일 전송
	 * @param m
	 */
	public void sendEmail(Member m) {
		mService.sendEmail(m);
	}
	
	/**
	 * 인증번호 인증
	 * @param m
	 * @param session
	 * @return
	 */
	@PostMapping("checkNumber")
	public String checkNumber(
				Member m,
				HttpSession session
			) {
		
		Member member = mService.checkNumber(m);
		
		if(member != null) {
			session.setAttribute("m", member);
			return "member/changePwd";
		} else {
			session.setAttribute("alertMsg", "인증번호를 잘못 입력하셨습니다.");
			return "member/checkNumber";
		}
		
	}
	
	/**
	 * 비밀번호 변경
	 * @param m
	 * @param session
	 * @return
	 */
	@PostMapping("changePwd")
	public String changePwd(
				Member m,
				HttpSession session
			) {
		
		log.info(m.getMemberId());
		log.info(m.getMemberPwd());
		
		int result = mService.changePwd(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
			return "forward:index.jsp";
		} else {
			session.setAttribute("alertMsg", "다시 입력해주세요.");
			return "member/changePwd";
		}
		
	}
	
	/**
	 * 아이디 중복 체크
	 * @param memberId
	 * @return
	 */
	@PostMapping("idcheck")
	@ResponseBody
	public String idCheck(String memberId) {
		int result = mService.idcheck(memberId);
		return result + "";
	}
	
}
