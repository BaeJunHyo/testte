<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="gnb clfix">
	<li class="navi_btn"><a href="#none">
		<div class="hamburger">
          <span class="line"></span>
          <span class="line"></span>
          <span class="line"></span>
        </div>
		전체메뉴
	</a></li>
	<li><a href="#">협회소개</a>
		<ul>
			<li><a href="info1.do">협회장 인사말</a></li>
			<li><a href="info2.do">협회훈</a></li>
			<li><a href="info3.do">설립목적</a></li>
			<li><a href="#">연혁</a></li>
			<li><a href="#">협회조직</a></li>
			<li><a href="#">협회정관</a></li>
			<li><a href="#">오시는길</a></li>
			<li><a href="#">시도별 홈페이지</a></li>
		</ul>
	</li>
	<li><a href="#">주요업무</a>
		<ul>
			<li><a href="#">주요업무</a></li>
		</ul>
	</li>
	<li><a href="#">참여마당</a>
		<ul>
			<li><a href="#">질문답변</a></li>
			<li><a href="#">회원게시판</a></li>
			<li><a href="#">시도회장게시판</a></li>
			<li><a href="#">회원쉼터</a></li>
		</ul>
	</li>
	<li><a href="#">알림마당</a>
		<ul>
			<li><a href="notice_admin.do">공지사항</a></li>
			<li><a href="#">입찰정보</a></li>
			<li><a href="#">회원경조사 알림</a></li>
			<li><a href="#">회원업체 자유홍보</a></li>
			<li><a href="#">포토게시판</a></li>
		</ul>	
	</li>
	<li><a href="#">정보마당</a>
		<ul>
			<li><a href="#">기술자료</a></li>
			<li><a href="#">법령자료</a></li>
		</ul>
	</li>	
	<li><a href="newRegi.do">신규가입</a></li>					
</ul>	

<div class="all_menu">
	<div class="inner">
		<ul>
			<li>
				<strong>협회소개</strong>
				<a href="info1.do">협회장 인사말</a>
				<a href="info2.do">협회훈</a>
				<a href="info3.do">설립목적</a>
				<a href="#">연혁</a>
				<a href="#">협회조직</a>
				<a href="#">협회정관</a>
				<a href="#">오시는길</a>
				<a href="#">시도별 홈페이지</a>
			</li>
			<li>
				<strong>주요업무</strong>
				<a href="#">주요업무</a>
			</li>
			<li>
				<strong>참여마당</strong>
				<a href="#">질문답변</a>
				<a href="#">회원게시판</a>
				<a href="#">시도회장게시판</a>
				<a href="#">회원쉼터</a>
			</li>
			<li>
				<strong>알림마당</strong>
				<a href="notice_admin.do">공지사항</a>
				<a href="#">입찰정보</a>
				<a href="#">회원경조사 알림</a>
				<a href="#">회원업체 자유홍보</a>
				<a href="#">포토게시판</a>
			</li>
			<li>
				<strong>정보마당</strong>
				<a href="#">기술자료</a>
				<a href="#">법령자료</a>
			</li>
			<li>
				<strong>신규가입</strong>
				<a href="#">신규가입</a>
			</li>
		</ul>
	</div>
</div>

<script>
$(document).ready(function(){
	  $(".navi_btn").click(function(){
	    $(this).find('.hamburger').toggleClass("active");
	    $('.all_menu').toggleClass("active");
	    $('html, body').toggleClass("active");n
	});
});
</script>