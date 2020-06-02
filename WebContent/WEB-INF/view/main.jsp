<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/header.jsp"%>
	
<div id="sub_contents">
	<%-- <div class="inner"> 
		<img src="<%=request.getContextPath() %>/image/main.jpg">
	</div>/<!-- /inner --> --%>
	<img src="<%=request.getContextPath() %>/image/main.jpg">
		<%-- <%@include file ="./location.jsp" %>
		<div class="sub_tit">
			<%@include file ="./title01.jsp" %>
			<span></span>
		</div>
			<%@include file ="./depth02.jsp" %>
		<div class="sub_cont"> --%>
	<div class="sub_cont">
		<!-- main login section -->
		<div class="main_loginfrm">
			<form action="#" method="post" id="login_frm">
			  <h2>MEMBER 로그인</h2>
					<!-- <form action="#" method="post" > -->
					<table class="main_logintb">
						<colgroup>
							<col width="70px">
							<col width="150px">
							</colgroup> 
							<tbody>
							<c:if test="${userSession eq null}">
							<tr>
								<th align="left" style="width:60px; height:30px">아이디 :</th>
								<td><input type="text" id="login_id" name="mem_id" value="" placeholder="" style="text-align:center; width:150px; height:30px;"><td>
								<td rowspan="2"><input type="button" id="login_btn" value="로그인" style="width:50px; height:50px; margin-left:7px;"></td>
							</tr>
							<tr>
								<th align="left" style="width:60px; height:30px">패스워드 :</th>
								<td><input type="password" id="login_pw" name="mem_password" value="" placeholder="" style="text-align:center; width:150px; height:30px;"><td>
							</tr>
							</tbody>
							<span>
								<a href="<%=request.getContextPath() %>/newRegi.do" style="margin-left: 25px; margin-right: 5px;">회원가입</a>
								<a href="<%=request.getContextPath() %>/#none" style="margin-left: 35px;">아이디/비밀번호 찾기</a>
							</span>
							</c:if>
							
							<c:if test="${userSession ne null }">
							<tr>
								<th style="width:150px;">${userSession.mem_name } 님</th>
								<td rowspan="2"><input type="button" id="logout_btn" onclick="logout()" value="로그아웃" style="width:70px; height:50px; margin-left:7px;"></td>
							</tr>
							<tr>
								<c:if test="${userSession.mem_auth eq 1}">
								<th style="width:150px;">회원등급 : [일반회원]</th>
								</c:if>
								<c:if test="${userSession.mem_auth eq 2}">
								<th style="width:150px;">회원등급 : [협회회원]</th>
								</c:if>
								<c:if test="${userSession.mem_auth eq 3}">
								<th style="width:150px;">회원등급 : [관리자]</th>
								</c:if>
							</tr>
							</tbody>
							<span>
								<a href="<%=request.getContextPath() %>/#none" style="margin-left: 25px; margin-right: 5px;">회원탈퇴</a>
								<a href="<%=request.getContextPath() %>/#none" style="margin-left: 35px;">마이페이지</a>
							</span>
							</c:if>
					</table>
			</form>
				
		</div><!-- //main_loginfrm  -->
		
		<!-- notice section -->
		<div class="main_notice_section">
			<!-- 공지사항  -->
			<div class="section_top">
				<div>
					<div class="section_top_left">
						<p><a href="notice_admin.do"><strong>공지사항</strong></a></p>
						<table border="1px solid">
							<col width="500px">
							<c:if test="${notice_list eq null } }">
							<tr>
								<td>게시글이 존재하지 않습니다.</td>
							</tr>
							</c:if>
							<c:if test="${notice_list ne null }">
							<c:forEach items="${notice_list }" var="list">
							<tr>
								<td>
								<a href="bbsDetail.do?bbs_seq=${list.bbs_seq }">${list.bbs_title }
								<span ></span>
								</a>
								</td>
							</tr>				
							</c:forEach>
							</c:if>
						</table>
						
					</div>
					<div class="section_top_right">
						<p><a href="#none"><strong>입찰정보</strong></a></p>
					</div>
				</div>
				
			</div>
			
			<div class="section_bottom">
				<p><a href="#none"><strong>포토게시판</strong></a></p>
			</div>
		</div><!-- //main_notice -->
		
		
		<!-- main_map -->
		<div class="main_map">
			<!-- 공지사항  -->
				<p>map</p>
		</div><!-- //main_map -->
		
		
	</div><!--//sub_cont  -->
</div><!-- //sub_contents -->



<%@ include file="../../include/footer.jsp"%>

<script type="text/javascript">
$("#login_btn").click(function(){
	const mem_id = $("#login_id").val();
	const mem_password = $("#login_pw").val();

	if(mem_id != "" && mem_password != ""){
		//$("form").attr("action","login.do").submit();
		$.ajax({
			url : "<%=request.getContextPath() %>/login.do",
			type : "post",
			dataType:"text",
			data : {"mem_id":mem_id,"mem_password":mem_password},
			success:function(data){
				if(data == "true"){
				      		location.reload();

				}else{
					Swal.fire({
				      	  icon: 'error',
				      	  title: '아이디와 PW를 확인해주세요',
				      	  confirmButtonText: "확인",
				      	  showConfirmButton: true
				      	}).then(function(){
				      		location.reload();
				      	});
				}			
			},
			error:function(request,status,error){
				alert("error");
			}
		});
	}else if(mem_id == "" || mem_id == null){
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '아이디를 입력해주세요',
	      	  confirmButtonText: "확인",
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('#login_id').focus();
	    		return;
	      	});
	}else if( mem_password =="" || mem_password == null){
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '비밀번호를 입력해주세요',
	      	  confirmButtonText: "확인",
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('#login_pw').focus();
	    		return;
	      	});
	}
})

</script>