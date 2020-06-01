<%@page import="java.util.List"%>
<%@page import="cd.com.a.model.BbsVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
p {margin:0;}
</style>

<%@ include file="../../../include/header.jsp"%>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>
<%
List<BbsVo> bbsList = (List<BbsVo>)request.getAttribute("bbsList");
%>
<div id="sub_contents">
	<div class="sub_cont">
		<div class=left_frm_regi style="float:left; width:300px;height:500px;margin-top:200px; background-color: #ccddff;">
			사이드 영역
		</div>
		
		<div class=frm_content align="center" style="float: left;">
			<p style="color:blue">::공지사항::</p>
			
			<div class="table_area" style="margin-top: 200px;" >
				<h1>::글쓰기::</h1>
				<form name ="bbsForm" id ="bbsForm" method ="post" enctype="multipart/form-data">
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">이름</label>
					<input type="text" id = "mem_name" name = "mem_name"  size = "150" value="${userSession.mem_name }" readonly="readonly">
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">제목</label>
					<input type="text" id ="bbs_title" name = "bbs_title" size = "150">
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<!-- <label style = "width:100px;">내용</label> -->
					<textarea rows="10" style="width:96%;" id="bbs_content" name="bbs_content" class="bbs_content"></textarea>
					<script>CKEDITOR.replace('bbs_content',
							{filebrowserUploadUrl:'imageUpload.do',
							enterMode: CKEDITOR.ENTER_BR,
							shiftEnterMode: CKEDITOR.ENTER_P,
							removePlugins: 'magicline',
							fillEmptyBlocks: 'false'});</script>
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#1</label>
					<input type="text" id = "bbs_link1" name = "bbs_link1"  size = "150">
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#2</label>
					<input type="text" id = "bbs_link2" name = "bbs_link2"  size = "150">
				</div>
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">파일첨부</label>
					<input type="file" name = "fileload1" >
				</div>
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">파일첨부</label>
					<input type="file" name = "fileload2" >
				</div>
				<!-- <div class ="notice_admin" style = "margin-top : 10px;">
					<textarea id="content" ></textarea>
					<script>CKEDITOR.replace('content',{filebrowserUploadUrl:'imageUpload.do'});</script>
					<input type="hidden" id ="shop_content" name ="shop_content" >
				</div> -->
				<input type="hidden" name = "mem_seq" value ="${userSession.mem_seq }">
				<div style ="margin-top:10px;" align ="center">
					<input class = "btn_line_m" type ="button" id = "bbsWrite" value = "등록">		
					<input class ="btn_line_m" type ="button" id = "bbsList" value = "목록">		
				</div>
			</div><!-- //table_frm -->
		</div><!-- //frm_content -->
		
	</div> <!-- //sub_contents -->
</div>	<!-- //sub_cont -->
		
<%@ include file="../../../include/footer.jsp"%>

<script>
$("#bbsWrite").click(function(){
		var bbs_content = CKEDITOR.instances.bbs_content.getData().trim(); 
	if($("#bbs_title").val().trim()!="" && $("#bbs_content").val(bbs_content)!=""){
		$("#bbs_content").val(bbs_content);
		var form = $('#bbsForm')[0];
		var formData = new FormData(form);
		
	      $.ajax({
	          url:"./bbsWriteAf.do",
	          type:'post',
	          data: formData,
	          enctype:'multipart/form-data',
	          processData: false,
	          contentType: false,
	          cache: false,
	          timeout: 600000,
	          success: function (data){
	             Swal.fire({
	             	  icon: 'success',
	             	  title: '정상적으로 글 등록 되었습니다.',
	             	  confirmButtonText:"확인",
	             	  showConfirmButton: true
	             }).then(function(){
	             location.href="notice_admin.do";
	           	 });
	          },
	          error: function (e){
	        	  Swal.fire({
	             	  icon: 'warning',
	             	  title: '글 등록에 실패 하였습니다.',
	             	  confirmButtonText:"확인",
	             	  showConfirmButton: true
	             }).then(function(){
	             return;
	           	 });
	     	}
		});
	}else if($("#bbs_title").val().trim()==""){
		Swal.fire({
       	  icon: 'warning',
       	  title: '제목 입력하세요',
       	  confirmButtonText:"확인",
       	  showConfirmButton: true
          }).then(function(){
            $("#bbs_title").focus();
          	return;
     	  });
	}else if($("#bbs_content").val(content)==""){
		Swal.fire({
       	  icon: 'warning',
       	  title: '내용을 입력하세요',
       	  confirmButtonText:"확인",
       	  showConfirmButton: true
          }).then(function(){
        	$("#bbs_content").focus();
       		return;
     	  });
	} 
})
$("#bbsList").click(function(){
	location.href="notice_admin.do";
})
</script>