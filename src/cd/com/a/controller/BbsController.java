package cd.com.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cd.com.a.model.BbsAnswerVo;
import cd.com.a.model.BbsVo;
import cd.com.a.model.MemberVo;
import cd.com.a.model.PageMaker;
import cd.com.a.model.PagingCriteria;
import cd.com.a.service.BbsAnswerService;
import cd.com.a.service.BbsService;

@Controller
public class BbsController {
	
	@Autowired
	BbsService bbsService;
	@Autowired
	BbsAnswerService answerService;
	
//	/** EgovSampleService */
//	@Resource(name = "sampleService")
//	private EgovSampleService sampleService;
//
//	/** EgovPropertyService */
//	@Resource(name = "propertiesService")
//	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = "/notice_admin.do", method=RequestMethod.GET)
	public String notice_main(PagingCriteria cri ,Model model,HttpServletRequest req)throws Exception {
		MemberVo userSession = (MemberVo)req.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "alertPage";
		}else {
			System.out.println("cri : " +cri.toString());
			List<BbsVo> bbsList = bbsService.getBbsList(cri);
			PageMaker pageMaker = new PageMaker();
			int total = bbsService.totalCnt(cri); 
			System.out.println("total:"+total);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(total);
			// Model 정보 저장
			if(bbsList.size()!=0) {
				model.addAttribute("bbsList",bbsList);
				model.addAttribute("paging",pageMaker);
				model.addAttribute("page",cri.getPage());
				model.addAttribute("searchType",cri.getSearchType());
				model.addAttribute("keyword",cri.getKeyword());
			}
		return "/bbs/notice_admin";
		}
	}
	@RequestMapping(value = "/bbsWrite.do", method=RequestMethod.GET)
	public String bbsWrite()throws Exception {
		return "/bbs/bbsWrite";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "bbsWriteAf.do",method=RequestMethod.POST)
	   public String bbsWriteAf(@ModelAttribute BbsVo bbs, HttpServletRequest req,
	@RequestParam(value="fileload1")MultipartFile fileload1,
	@RequestParam(value="fileload2")MultipartFile fileload2)throws Exception{
		String str = "";
		String fileUpload = req.getServletContext().getRealPath("/upload/bbs"); 
		String saveFileName = "";
		String filepost = "";
			if(!fileload1.isEmpty()) {
				String fileName = fileload1.getOriginalFilename();
				if(fileName.indexOf('.') >= 0) { // 확장자명 존재시
					filepost = fileName.substring(fileName.indexOf('.'));
					saveFileName = new Date().getTime() + filepost;
					System.out.println("save:"+saveFileName);
					bbs.setFile_origin1(fileName);
					bbs.setFile_name1(saveFileName);
					bbs.setFile_path1(fileUpload);
				}
				//실제 파일 업로드 되는 부분
				File file = new File(fileUpload + "/" + saveFileName);
				try {
					FileUtils.writeByteArrayToFile(file, fileload1.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			if(!fileload2.isEmpty()) {
				String fileName = fileload2.getOriginalFilename();
				if(fileName.indexOf('.') >= 0) { // 확장자명 존재시
					filepost = fileName.substring(fileName.indexOf('.'));
					saveFileName = new Date().getTime() + filepost;
					System.out.println("save:"+saveFileName);
					bbs.setFile_origin2(fileName);
					bbs.setFile_name2(saveFileName);
					bbs.setFile_path2(fileUpload);
				}
				//실제 파일 업로드 되는 부분
				File file = new File(fileUpload + "/" + saveFileName);
				try {
					FileUtils.writeByteArrayToFile(file, fileload2.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			 
			//db 접근 
			System.out. println(bbs.toString());
			boolean	bbs_result=bbsService.bbsWrite(bbs);
			if(bbs_result) {
				str = "ok";
			} else {
				str = "no";
			}
		return str;
	}	
	
	@RequestMapping(value="/fileDownload.do")
	public void fileDownload(@RequestParam("bbs_seq")int bbs_seq,HttpServletResponse resp,HttpServletRequest req)throws Exception{
		System.out.println("ghk:"+bbs_seq);
		BbsVo bbs = bbsService.bbsDetail(bbs_seq);
		
		String fileName = bbs.getFile_name2();
		String oriName = bbs.getFile_origin2();
		String filePath = bbs.getFile_path2();
		System.out.println(URLEncoder.encode(oriName,"UTF-8"));
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath+"/"+fileName));
		
		resp.setContentType("application/octet-stream");
		resp.setContentLength(fileByte.length);
		resp.setHeader("Content-Dispostion", "attachment; fileName=\""+URLEncoder.encode(oriName,"UTF-8")+"\";");
		resp.setHeader("Content-Transfer-Encoding", "binary");
		resp.getOutputStream().write(fileByte);
		resp.getOutputStream().flush();
		resp.getOutputStream().close();
		
		
	}
	
	
	@RequestMapping(value = "/bbsDetail.do", method=RequestMethod.GET)
	public String bbsDetail(@RequestParam("bbs_seq")int bbs_seq, Model model,PagingCriteria cri,HttpServletRequest req)throws Exception {
		System.out.println("seq="+bbs_seq);
		
		MemberVo user = (MemberVo)req.getSession().getAttribute("userSession");
		if(user == null) {
			return "alertPage";
		}else {
			BbsVo bbsVo = bbsService.bbsDetail(bbs_seq);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			model.addAttribute("bbsDetail",bbsVo);
			model.addAttribute("answerVO",new BbsAnswerVo());
			model.addAttribute("page",cri.getPage());
			model.addAttribute("searchType",cri.getSearchType());
			model.addAttribute("keyword",cri.getKeyword());
			model.addAttribute("pageMaker",pageMaker);
			return "/bbs/bbsDetail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "bbsDelete.do",method=RequestMethod.POST)
	public String bbsDelete(@RequestParam("bbs_seq")int bbs_seq)throws Exception {
		boolean result = bbsService.bbsDelete(bbs_seq);
		if(result) {
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping(value = "/bbsUpdateMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String bbsUpdateMove(@RequestParam("bbs_seq")int bbs_seq,Model model)throws Exception {
		BbsVo bbsVo = bbsService.bbsDetail(bbs_seq);
		model.addAttribute("bbsVo",bbsVo);
		
		
		return "/bbs/bbsUpdateView";
	}
	
	@ResponseBody
	@RequestMapping(value = "bbsUpdate.do",method=RequestMethod.POST)
	   public String bbsUpdate(@ModelAttribute BbsVo bbs, HttpServletRequest req,
	@RequestParam(value="fileload1")MultipartFile fileload1,
	@RequestParam(value="fileload2")MultipartFile fileload2)throws Exception{
		
		System.out.println("확인:"+bbs.toString());
		String str = "";
		String fileUpload = req.getServletContext().getRealPath("/upload/bbs"); 
		String saveFileName = "";
		String filepost = "";
			if(!fileload1.isEmpty()) {
				String fileName = fileload1.getOriginalFilename();
				if(fileName.indexOf('.') >= 0) { // 확장자명 존재시
					filepost = fileName.substring(fileName.indexOf('.'));
					saveFileName = new Date().getTime() + filepost;
					System.out.println("save:"+saveFileName);
					bbs.setFile_origin1(fileName);
					bbs.setFile_name1(saveFileName);
					bbs.setFile_path1(fileUpload);
				}
				//실제 파일 업로드 되는 부분
				File file = new File(fileUpload + "/" + saveFileName);
				try {
					FileUtils.writeByteArrayToFile(file, fileload1.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			if(!fileload2.isEmpty()) {
				String fileName = fileload2.getOriginalFilename();
				if(fileName.indexOf('.') >= 0) { // 확장자명 존재시
					filepost = fileName.substring(fileName.indexOf('.'));
					saveFileName = new Date().getTime() + filepost;
					System.out.println("save:"+saveFileName);
					bbs.setFile_origin2(fileName);
					bbs.setFile_name2(saveFileName);
					bbs.setFile_path2(fileUpload);
				}
				//실제 파일 업로드 되는 부분
				File file = new File(fileUpload + "/" + saveFileName);
				try {
					FileUtils.writeByteArrayToFile(file, fileload2.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//db 접근 
			System.out. println(bbs.toString());
			
			boolean	bbs_result=bbsService.bbsUpdate(bbs);
			if(bbs_result) {
				str = "ok";
			} else {
				str = "no";
			}
		return str;
	}	
	
	
}
