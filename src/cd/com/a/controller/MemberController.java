package cd.com.a.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.MemberVo;
import cd.com.a.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	protected MemberService service;
	/* 로그인 
		@param memberVo - 회원정보  VO
		@param httpServletRequest - 세션 적용 하기 위함
		@return - ajax true/false 반환하여 reload
		@exception Exception
	*/
	@ResponseBody
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public String login(MemberVo member, HttpServletRequest req)throws Exception {
		MemberVo userSession = service.login(member);
		if(userSession != null) {
			req.getSession().setAttribute("userSession", userSession);
			req.getSession().setMaxInactiveInterval(30*60);// 30min
			return "true";
		}else {
			return "false";
		}
	}
	/* 로그아웃
	@param httpServletRequest - 세션 해제 하기 위함
	@return - ajax true/false 반환하여 reload
	@exception Exception
	 */
	@ResponseBody
	@RequestMapping(value="/logout.do",method = RequestMethod.POST)
	public String logout(HttpServletRequest req)throws Exception {
		req.getSession().removeAttribute("userSession");
		return "true";
	}
	
	// 신규가입,회원가입 페이지 이동(약관)
	@RequestMapping(value="/newRegi.do", method= RequestMethod.GET)
	 public String newRegi() {
		return "account/moveRegiView";
	}
	// 신규가입,회원가입 페이지 이동(가입FORM)
	@RequestMapping(value="/moveRegiNew.do", method= RequestMethod.GET)
	 public String moveRegiNew() {
		return "account/moveRegiNew";
	}
	// 로그인 페이지 이동
	@RequestMapping(value="/loginViewMove.do", method= RequestMethod.GET)
	 public String loginViewMove() {
		return "account/loginView";
	}
	
	/* ID중복체크
	@param id -  DB 접근하여 해당 ID 존재 확인
	@return - ajax true/false 반환
	@exception Exception
	 */
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method= RequestMethod.POST)
	 public boolean idcheck(@RequestParam("idcheck")String id)throws Exception {
		boolean result = service.idCheck(id);
		return result;
	}
	/* 이메일중복체크
	@param mail -  DB 접근하여 해당 이메일 존재 확인
	@return - ajax true/false 반환
	@exception Exception
	 */
	@ResponseBody
	@RequestMapping(value="/mailCheck.do", method= RequestMethod.POST)
	 public boolean mailCheck(@RequestParam("mailCheck")String mail)throws Exception {
		boolean result = service.mailCheck(mail);
		return result;
	}
	
	/* 회원가입
	@param MemberVo - form태그 회원정보 담긴 VO
	@param Model - alert페이지 이동시 결과 값 담기
	@return - alert페이지로 결과값 반환, 
	@exception Exception
	 */
	@RequestMapping(value="/memberInsert.do", method= RequestMethod.POST)
	 public String memberInsert(MemberVo member,Model model)throws Exception {
		if(member != null) {
			boolean result = service.newRegi(member);
			if(result) {
				model.addAttribute("type","regi");
				model.addAttribute("result","true");
			}else {
				model.addAttribute("type","regi");
				model.addAttribute("result","false");
				model.addAttribute("msg","회원 가입 실패");
			}
		}
		return "alertPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/captchaCheck.do",method = RequestMethod.POST)
	public String captchaCheck(HttpServletRequest req,@RequestParam("captcha_check")String captchaStr)throws Exception {
		String originStr = (String)req.getSession().getAttribute("simpleCaptcha");
		System.out.println("origin:"+originStr+"==check:"+captchaStr);
		if(captchaStr.equals(originStr)) {
			return "true";
		}else {
			return "false";
		}
	}

	
	
	
	
	
	

}
