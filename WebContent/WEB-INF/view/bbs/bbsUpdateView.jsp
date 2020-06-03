<%@page import="java.util.List"%>
<%@page import="cd.com.a.model.BbsVo2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	BbsVo2 bbsDetail = (BbsVo2)request.getAttribute("bbsVo");
%>
<%@ include file="../../../include/header.jsp"%>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>
<div id="sub_contents">
	<div class="sub_cont">
		<div class=left_frm_regi style="float:left; width:300px;height:500px;margin-top:200px; background-color: #ccddff;">
			사이드 영역
		</div>
		
		<div class=frm_content align="center" style="float: left;">
			<p style="color:blue">::공지사항::</p>
			
			<div class="table_area" style="margin-top: 200px;" >
				<h1>::상세내용::</h1>
				<form name ="bbsForm" id ="bbsForm" method ="post" enctype="multipart/form-data">
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">이름</label>
					<input type="text" id = "mem_name" name = "mem_name"  size = "150" value="${bbsVo.mem_name }" readonly="readonly">
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">제목</label>
					<input type="text" id ="bbs_title" name = "bbs_title" size = "150" value="${bbsVo.bbs_title }" >
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<!-- <label style = "width:100px;">내용</label> -->
					<textarea rows="10" style="width:96%;" id="bbs_content" name="bbs_content"  ></textarea>
 					
					<script type="text/javascript">
						CKEDITOR.replace('bbs_content');
					</script>
					<script type="text/javascript">
					var data = '<%=bbsDetail.getBbs_content().replaceAll("\r\n", "")%>';
					CKEDITOR.instances['bbs_content'].setData(data);</script>
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#1</label>
					<c:if test="${bbsVo.bbs_link1 ne null }">
					<input type="text" id = "bbs_link1" name = "bbs_link1"  size = "150" value="${bbsVo.bbs_link1 }" >
					</c:if>
					<c:if test="${bbsVo.bbs_link1 eq null }">
					<input type="text" id = "bbs_link1" name = "bbs_link1"  size = "150" value="" >
					</c:if>
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#2</label>
					<c:if test="${bbsVo.bbs_link2 ne null }">
					<input type="text" id = "bbs_link1" name = "bbs_link2"  size = "150" value="${bbsVo.bbs_link2 }" >
					</c:if>
					<c:if test="${bbsVo.bbs_link2 eq null }">
					<input type="text" id = "bbs_link1" name = "bbs_link2"  size = "150" value="" >
					</c:if>
				</div>
				<div class ="file_input_div" >
					<c:if test="${bbsVo.file_name1 eq null }">
					<span style = "font-size:10pt;">첨부파일 없음 </span>
					<input type="file" name ="fileload1">
					</c:if>
					<c:if test="${bbsVo.file_name1 ne null }">
					<span style = "font-size:10pt; color:blue;">
						<a href="<%=request.getContextPath() %>/upload/bbs/${bbsVo.file_name1}">
						${bbsVo.file_origin1 }
						</a>
					</span>
					<input type="file" name = "fileload1"  >
					</c:if>
				</div>
				<div class ="file_input_div">
					<c:if test="${bbsVo.file_name2 eq null }">
					<span style = "font-size:10pt;">첨부파일 없음 </span>
					<input type="file" name = "fileload2">
					</c:if>
					<c:if test="${bbsVo.file_name2 ne null }">
					<span style = "font-size:10pt; color:blue;">
						<a href="<%=request.getContextPath() %>/upload/bbs/${bbsVo.file_name2}">
						${bbsVo.file_origin2 }
						</a>
					</span>
					<input type="file" name = "fileload2"  >
					</c:if>
				</div>
				<!-- <div class ="notice_admin" style = "margin-top : 10px;">
					<textarea id="content" ></textarea>
					<script>CKEDITOR.replace('content',{filebrowserUploadUrl:'imageUpload.do'});</script>
					<input type="hidden" id ="shop_content" name ="shop_content" >
				</div> -->
				<input type="hidden" name = "mem_seq" value ="${userSession.mem_seq }">
				<input type="hidden" id="bbs_seq" name = "bbs_seq" value ="${bbsVo.bbs_seq }">
				<div style ="margin-top:10px;" align ="center">
					<input class = "btn_line_m" type ="button" id = "bbsUpdate" value = "적용">		
					<input class ="btn_line_m" type ="button" id = "bbsList" value = "목록">
				</div>
				</form>
			</div><!-- //table_frm -->
		</div><!-- //frm_content -->
		
	</div> <!-- //sub_contents -->
</div>	<!-- //sub_cont -->

<script>

$("#bbsUpdate").click(function(){
	var bbs_content = CKEDITOR.instances.bbs_content.getData().trim();
	
	if($("#bbs_title").val()!="" && $("#bbs_content").val(bbs_content)!="" ){
		if(bbs)
		$("#bbs_content").val(bbs_content);
		var form = $('#bbsForm')[0];
		var formData = new FormData(form);
		
	      $.ajax({
	          url:"./bbsUpdate.do",
	          type:'post',
	          data: formData,
	          enctype:'multipart/form-data',
	          processData: false,
	          contentType: false,
	          cache: false,
	          timeout: 600000,
	          success: function (data){
	             location.href="bbsDetail.do?bbs_seq="+${bbsVo.bbs_seq};
	          },
	          error: function (e){
	        	  Swal.fire({
	             	  icon: 'warning',
	             	  title: '수정에 실패 하였습니다.',
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
       	  title: '제목을 확인 하세요',
       	  confirmButtonText:"확인",
       	  showConfirmButton: true
          }).then(function(){
            $("#bbs_title").focus();
          	return;
     	  });
	}else if($("#bbs_content").val(bbs_content)==""){
		Swal.fire({
       	  icon: 'warning',
       	  title: '내용을 확인하세요',
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