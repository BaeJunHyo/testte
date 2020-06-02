<%@page import="cd.com.a.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
 MemberVo userSession = (MemberVo)request.getSession().getAttribute("userSession");
if(userSession != null){
	System.out.println("LoginSessionChecking="+userSession.toString());
}
 
%>	
<html>
<head>
<title>:: 한국전기안전협회 ::</title>
<meta charset="utf-8">
<!-- <link href="css/setting.css" rel="stylesheet"> -->
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/jquery.bxslider.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
</head>

<body>

<div id="wrap">
	 <!-- div class="banner-top">
		<div class="inner">
			<button></button>
		</div>
	</div>//banner-top  -->
	<div id="header" class="sub">		
		<div class="header_top">
			<div class="inner">
					<% if(userSession == null){%>
					<!--로그인세션이 없을때 -->
					<span><a href="<%=request.getContextPath() %>/loginViewMove.do">로그인</a></span>
					<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
					<span><a href="<%=request.getContextPath() %>/newRegi.do">회원가입</a></span>
					<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
					<!-- <ul class="top_menu clearfix">
						<li><a href="main.do">Home</a></li>
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">사이트맵</a></li>
						</ul>			 -->
					<%}else{%>
						<%if(userSession.getMem_auth() == 3){ %>
						<span><a href="<%=request.getContextPath() %>/admin.do">관리자페이지</a></span>
						<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
						<span><a href="#" onclick="logout()">로그아웃</a></span>
						<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
						<%}else{ %>
						<span><a href="<%=request.getContextPath() %>/#none">마이페이지</a></span>
						<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
						<span><a href="#" onclick="logout()">로그아웃</a></span>
						<span><img src="<%=request.getContextPath() %>/images/main/header_dot.jpg" alt="·"></span>
						<%} %>
					<%
					}
					%>
					<span><a href="<%=request.getContextPath() %>/#none.do">사이트맵</a></span>
			
				<h1 class="logo"><a href="<%=request.getContextPath() %>/main.do">
					<img src="<%=request.getContextPath() %>/image/logo.jpg" alt="협회 로고" />
				</a></h1>
					
			</div><!-- //inner -->
		</div><!-- //header_top -->
		
		<div class="header-btm">
			<div class="inner">
				<%@include file ="./gnb.jsp" %>
				<%-- <div class="searchWrap">
					<form name="serach" method="get" action="<%=request.getContextPath() %>/mainSearch">
						<input type="text" maxlength="20" name="mainSearchWord" placeholder="검색어를 입력해주세요">
						<button type="submit"></button>
					</form>
				</div> --%>
			</div><!-- //inner -->
		</div><!-- //header-btm -->
	</div><!-- //header -->
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$(".banner-top button").click(function(){
			$(".banner-top").slideUp();
		});
		
		$(".header-btm").each(function(){
			var header = $(this);
			var headerOffset = header.offset().top;
		 
			$(window).scroll(function(){
				var wScroll = $(window).scrollTop();
				if( wScroll > headerOffset){
				  header.addClass("fixed");
				} else {
				  header.removeClass("fixed");
				}
			});
		});
		
		$('.navi_btn').click(function(e){
			if($(this).hasClass('on')){	
				$(this).removeClass('on')		
				$('.navi_btn img').attr("src","<%=request.getContextPath() %>/images/main/navi_btn.jpg");
			}else{	
				$(this).addClass('on')		
				$('.navi_btn img').attr("src","<%=request.getContextPath() %>/images/main/navi_btn_close.jpg");
			}
		});				
	});
	</script>	

	

<script>
<!-- Session logout  -->
function logout(){
	Swal.fire({
		  title: '로그아웃하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
	  		//location.href="logout.do";
	  		$.ajax({
				url : "<%=request.getContextPath() %>/logout.do",
				type : "post",
				dataType:"text",
				data : "logout="+"logout",
				success:function(data){
		      		location.reload();
				},
				error:function(request,status,error){
					alert("error");
				}
			});
	  	  }
		});
}
</script>