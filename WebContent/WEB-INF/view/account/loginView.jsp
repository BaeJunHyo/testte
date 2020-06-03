<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../../include/header.jsp"%>
	
<div id="sub_contents">
	<div class="sub_cont">
		<div class=left_frm_regi style="float:left; width:500px">
			사이드 영역
		</div>
		
		<div class=login_content align="center" style="float: left;">
			<p style="color:blue">로그인</p>
			<div style="width:700px;margin-top: 10px; margin-left:5px">
			
			<form action="#" method="post" id="login_frm">
			  <h2>MEMBER 로그인</h2>
					<!-- <form action="#" method="post" > -->
				<table class="main_logintb">
					<colgroup>
						<col width="70px">
						<col width="150px">
						</colgroup> 
						<tbody> 
						<tr>
							<th align="left" style="width:60px; height:30px">아이디 :</th>
							<td><input type="text" id="login_id" name="mem_usrid" value="" placeholder="" style="text-align:center; width:150px; height:30px;"><td>
							<td rowspan="2"><input type="button" id="login_btn" value="로그인" style="width:50px; height:50px; margin-left:7px;"></td>
						</tr>
						<tr>
							<th align="left" style="width:60px; height:30px">패스워드 :</th>
							<td><input type="password" id="login_pw" name="mem_pw" value="" placeholder="" style="text-align:center; width:150px; height:30px;"><td>
						</tr>
					</tbody>
				</table>
				</form>
				<span>
					<a href="<%=request.getContextPath() %>/newRegi.do" style="margin-left: 25px; margin-right: 5px;">회원가입</a>
					<a href="<%=request.getContextPath() %>/#none" style="margin-left: 35px;">아이디/비밀번호 찾기</a>
				</span>
			</div>
		</div><!-- //regi_content -->
		
	</div><!-- //sub_cont -->
</div><!-- //sub_contents -->


<%@ include file="../../../include/footer.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('kakao_postcode').value = data.zonecode;
                document.getElementById("kakao_roadAddress").value = roadAddr;
                document.getElementById("kakao_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("kakao_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("kakao_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script type="text/javascript">
$("#login_btn").click(function(){
	const mem_usrid = $("#login_id").val();
	const mem_pw = $("#login_pw").val();

	if(mem_usrid != "" && mem_pw != ""){
		//$("form").attr("action","login.do").submit();
		$.ajax({
			url : "<%=request.getContextPath() %>/login.do",
			type : "post",
			dataType:"text",
			data : {"mem_usrid":mem_usrid,"mem_pw":mem_pw},
			success:function(data){
				if(data == "true"){
		      		location.href="main.do";
				}else{
					Swal.fire({
				      	  icon: 'error',
				      	  title: '로그인에 실패 하였습니다.',
				      	  confirmButtonText: "확인",
				      	  showConfirmButton: true
				      	}).then(function(){
				      		return;
				      	});
				}			
			},
			error:function(request,status,error){
				alert("error");
			}
		});



		
	}else if(mem_usrid == "" || mem_usrid == null){
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '아이디를 입력해주세요',
	      	  confirmButtonText: "확인",
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('#login_id').focus();
	    		return;
	      	});
	}else if( mem_pw =="" || mem_pw == null){
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
