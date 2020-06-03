<%@page import="java.util.List"%>
<%@page import="cd.com.a.model.BbsVo2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BbsVo2 bbsDetail = (BbsVo2)request.getAttribute("bbsDetail");
%>
<%@ include file="../../../include/header.jsp"%>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>
<script>

</script>
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
					<input type="text" id = "mem_name" name = "mem_name"  size = "150" value="${bbsDetail.mem_name }" readonly="readonly">
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">제목</label>
					<input type="text" id ="bbs_title" name = "bbs_title" size = "150" value="${bbsDetail.bbs_title }" readonly="readonly">
				</div>
				<div class ="notice_admin"  style = "margin-top : 10px;">
					<!-- <label style = "width:100px;">내용</label> -->
					<textarea rows="10" style="width:96%;" id="bbs_content" name="bbs_content" readonly="readonly" ></textarea>
 					
					<script type="text/javascript">
						CKEDITOR.replace('bbs_content');
					</script>
					<script type="text/javascript">
					var data = '<%=bbsDetail.getBbs_content().replaceAll("\r\n", "")%>';
					CKEDITOR.instances['bbs_content'].setData(data);</script>
					<%-- CKEDITOR.instances['bbs_content'].setData('<p><%=bbsDetail.getBbs_content().replace(" ", "")%></p>'); --%>
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#1</label>
					<input type="text" id = "bbs_link1" name = "bbs_link1"  size = "150" value="${bbsDetail.bbs_link1 }" readonly="readonly">
				</div>
					<div class ="notice_admin"  style = "margin-top : 10px;">
					<label style = "width:100px;">링크#2</label>
					<input type="text" id = "bbs_link2" name = "bbs_link2"  size = "150" value="${bbsDetail.bbs_link1 }" readonly="readonly">
				</div>
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">파일첨부</label>
					
					<c:if test="${bbsDetail.file_name1 eq null }">
					<p style = "font-size:8pt; color:blue;">
						첨부파일 없음
					</p>
					</c:if>
					<p style = "font-size:8pt; color:blue;">
						<a name="file1" href="<%=request.getContextPath() %>/upload/bbs/${bbsDetail.file_name1}">
						${bbsDetail.file_origin1 }
						</a>
					</p>
				</div>
				<div class ="notice_admin" style = "margin-top : 10px;">
					<label style = "width:100px;">파일첨부</label>
					<c:if test="${bbsDetail.file_name2 eq null }">
					<p style = "font-size:8pt; color:blue;">
						첨부파일 없음
					</p>
					</c:if>
					<p style = "font-size:8pt; color:blue;">
						<a name="file2" href="<%=request.getContextPath() %>/upload/bbs/${bbsDetail.file_name2}">
						${bbsDetail.file_origin2 }
						</a>
					</p>
				</div>
				<!-- <div class ="notice_admin" style = "margin-top : 10px;">
					<textarea id="content" ></textarea>
					<script>CKEDITOR.replace('content',{filebrowserUploadUrl:'imageUpload.do'});</script>
					<input type="hidden" id ="shop_content" name ="shop_content" >
				</div> -->
				<input type="hidden" name = "mem_seq" value ="${userSession.mem_seq }">
				<input type="hidden" id="bbs_seq" name = "bbs_seq" value ="${bbsDetail.bbs_seq }">
				<div style ="margin-top:10px;" align ="center">
				<c:set var="bbs_seq" value="${bbsDetail.mem_seq }"/>
				<c:set var="mem_seq" value="${userSession.mem_seq }"/>
				<c:if test="${bbs_seq eq mem_seq }">
					<input class = "btn_line_m" type ="button" id = "bbsUpdate" value = "수정">		
					<input class ="btn_line_m" type ="button" id = "bbsDelete" value = "삭제">			
				</c:if>
					<input class ="btn_line_m" type ="button" id = "bbsList" value = "목록">
				</div>
				</form>
				<%@include file="bbsAnswerList.jsp" %>
			</div><!-- //table_frm -->
		</div><!-- //frm_content -->
		
	</div> <!-- //sub_contents -->
</div>	<!-- //sub_cont -->
		
<%@ include file="../../../include/footer.jsp"%>

<script>


$("#bbsUpdate").click(function(){
	var seq = $("#bbs_seq").val();
	location.href="bbsUpdateMove.do?bbs_seq="+seq;
})
$("#bbsDelete").click(function(){
	Swal.fire({
		  title: '작성글을 삭제하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
			if(result.value){
				$.ajax({
			         url:"bbsDelete.do",
			         type:"post",
			         dataType: "text",
			         data: {"bbs_seq":$("#bbs_seq").val()},
			         success: function (data){
				        if(data == "true"){
				            location.href="notice_admin.do";
					    }else{
					    	 Swal.fire({
				            	  icon: 'warning',
				            	  title: '삭제 실패 하였습니다.',
				            	  confirmButtonText:"확인",
				            	  showConfirmButton: true
				            }).then(function(){
				            return;
				          	 });
						}
			         },
			         error: function (e){
			       	  Swal.fire({
			            	  icon: 'warning',
			            	  title: '삭제 실패 하였습니다.',
			            	  confirmButtonText:"확인",
			            	  showConfirmButton: true
			            }).then(function(){
			            return;
			          	 });
			    	}
				});
			}else{
				return;
			}
		});
});

$("#bbsList").click(function(){
	var page = ${page};
	var searchType= ${searchType};
	var keyword = '${keyword}';
	location.href="notice_admin.do?page="+page+"&searchType="+searchType+"&keyword="+keyword;
})


</script>