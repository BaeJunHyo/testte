package cd.com.a.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cd.com.a.model.BbsAnswerVo;
import cd.com.a.service.BbsAnswerService;

@RestController
public class BbsAnswerController {

	@Autowired
	BbsAnswerService answerService;
	
	@ResponseBody
	@RequestMapping(value = "/bbsAnswerInsert.do",method=RequestMethod.POST )
	public Map<String, Object> bbsAnswerInsert(@ModelAttribute BbsAnswerVo vo ) throws Exception{
		Map<String, Object> result = new HashMap<>();
		try {
			answerService.answerInsert(vo);
			answerService.answerUpdateCount(vo.getBbs_seq());
			result.put("status", "OK");
		}catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
		
		//answerService.create(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/bbsAnswerUpdate.do",method=RequestMethod.POST )
	public void bbsAnswerUpdate(@ModelAttribute BbsAnswerVo vo ) throws Exception{
		System.out.println("vo="+vo.toString());
		answerService.answerUpdate(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/bbsAnswerDelete.do",method=RequestMethod.POST )
	public void bbsAnswerDelete(@ModelAttribute BbsAnswerVo vo ) throws Exception{
		answerService.answerDelete(vo.getAnswer_seq());
		answerService.answerUpdateCount(vo.getBbs_seq());
	}
	
	@RequestMapping("/bbsAnswerList.do")
	public List<BbsAnswerVo> bbsAnswerList(@RequestParam("bbs_seq")int bbs_seq,Model model) throws Exception{
		List<BbsAnswerVo> list = answerService.list(bbs_seq);
		model.addAttribute("list",list);
		return list;
	}
	
	
}
