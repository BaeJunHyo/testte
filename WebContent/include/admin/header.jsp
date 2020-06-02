<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script> 
<!-- SweetAlert  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- JSTL -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>


 
<header role="banner">
  <h1>관리자 페이지</h1>
  <ul class="utilities">
    <br>
    <li class="main"><a href="main.do">메인페이지</a></li>
    <li class="users"><a href="#">마이페이지</a></li>
    <li class="logout warn"><a href="#" onclick="logout()">로그아웃</a></li>
  </ul>
</header> 

<script>
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
	  		$.ajax({
				url : "<%=request.getContextPath() %>/logout.do",
				type : "post",
				dataType:"text",
				data : "logout="+"logout",
				success:function(data){
		      		location.href="main.do";
				},
				error:function(request,status,error){
					alert("error");
				}
			});
	  	  }
		});
}
</script>