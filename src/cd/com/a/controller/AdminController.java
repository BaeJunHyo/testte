package cd.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.MemberVo;
import cd.com.a.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memService;

	
	@RequestMapping(value = "/admin.do",method= RequestMethod.GET)
	public String admin(HttpServletRequest req,Model model) {
		MemberVo user = (MemberVo)req.getSession().getAttribute("userSession");
		if(user == null) {
			return "alertPage";
		}else {
			if(user.getMem_auth()==3 ) {
				List<MemberVo> list = memService.getNewRegiList();
				if(list.size()>0 && list != null) {
					model.addAttribute("regiList",list);
				}
				return "/admin/adminMain";
				
			}else {
				model.addAttribute("type","auth");
				model.addAttribute("msg","접근 권한이 없습니다");
				return  "alertPage";
			}
		}
	}
}
