<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script> 
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>  

<!-- 게시판 접근 제어 (비회원 예외처리) -->
<c:if test="${userSession eq null }">
 <script>
 $(document).ready(function(){
	 Swal.fire({
		  icon: 'info',
		  title: '로그인후 이용 가능합니다.',
		  confirmButtonText:"확인",
		  showConfirmButton: true
		}).then(function(){
			window.location="main.do"
		});
 });
 </script>
</c:if>

<c:if test="${type eq 'regi'}">
<script>
$(document).ready(function(){
	if(${result}=="true"){
		location.href="main.do";
	}else{
		Swal.fire({
			  icon: 'error',
			  title: '${msg}',
			  confirmButtonText:"확인",
			  showConfirmButton: true
			}).then(function(){
				window.location="moveRegiNew.do"
			});
	}
})
</script>
</c:if>

<c:if test="${type eq 'auth'}">
<script>
$(document).ready(function(){
	Swal.fire({
		  icon: 'error',
		  title: '${msg}',
		  confirmButtonText:"확인",
		  showConfirmButton: true
		}).then(function(){
			window.location="main.do"
		});
})
</script>
</c:if>




