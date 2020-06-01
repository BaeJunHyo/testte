package cd.com.a.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.BbsVo;
import cd.com.a.service.BbsService;
import cd.com.a.util.CaptChaUtil;

@Controller
public class MainController {
	
	@Autowired
	BbsService service;
	
	//메인페이지이동
	@RequestMapping(value="main.do", method= RequestMethod.GET)
	public String main(Model model)throws Exception {
		List<BbsVo> list = service.getMainBbsList();
		model.addAttribute("notice_list",list);
		return "main";
	}
	//회원가입시 자동가입 방지 captchaImg 생성
	@RequestMapping(value="captchaImg.do")
	public void captchaImg(HttpServletRequest req, HttpServletResponse resp) {
		new CaptChaUtil().capthcaImg(req, resp);
	}
	//협회장 인사말
	@RequestMapping(value="info1.do")
	public String info1() {
		return "/intro/ownerIntro";
	}
	//협회훈
	@RequestMapping(value="info2.do")
	public String info2() {
		return "/intro/info2";
	}
	//설립목적
	@RequestMapping(value="info3.do")
	public String info3() {
		return "/intro/info3";
	}

}
