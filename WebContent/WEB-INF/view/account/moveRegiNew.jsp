<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.kraddr{
	margin-top: 3px;
}
.basic_tableStyle td{
	text-align: left;
}
.select-hint{
	width: 200px;
}


.frm_adr_btn{
	background: #000;
    color: #fff;
    padding: 3px 8px;
    vertical-align: middle;
}
.sBtn{
	display: inline-block;
    height: 30px;
    padding: 0 17px;
    text-align: center;
    font-size: 15px;
    line-height: 30px;
    font-weight: normal;
    color: #fff;
    background: #000000;
    margin-top: 10px;
}
.refreshBtn{
	display: inline-block;
    height: 30px;
    padding: 0 17px;
    text-align: center;
    font-size: 15px;
    line-height: 30px;
    font-weight: normal;
    color: #fff;
    background: #000000;
    margin-top: 10px;
}

table th{
	text-align: left;
}


</style> 
 
<%@ include file="../../../include/header.jsp"%>
	
<div id="sub_contents">
	<div class="sub_cont">
		<div class=left_frm_regi style="float:left; width:500px">
			사이드 영역
		</div>
		
		<div class=regi_content align="center" style="float: left;">
			<p style="color:blue">회원가입</p>
			<div style="width:700px;margin-top: 10px; margin-left:5px">
			<p align="left" style="color: red">본 회원 가입 시 기본으로 일반회원 등급이 주어지며, 협회회원 등급은 심의를 거쳐 결정이 됩니다.</p>
			
			<form method="post" action="">
			<table class="basic_tableStyle td_p0 basic_tableStyle_vert">
		         <colgroup>
		            <col width="150px">
		            <col width="*">
		         </colgroup>
		         <tbody>
		             <tr class="cont idComentColor">
		               <th>아이디</th>
		               <td class="tl">
		                  <input type="text" class="ttext memberId" name="mem_usrid" id="id" value="" placeholder="6~20자 영소문자 또는 숫자">
		                  <button type="button" onclick="idCheck()" class="frm_adr_btn">중복체크</button>
		                  <!-- <a href="#n" class="btn_dark_s" style="height: 33px; line-height: 33px;">중복확인</a> -->
		                  <span class="idCheck"></span>
		               </td>
		            </tr>
		            <tr class="cont pwdComentColor">
		               <th>비밀번호</th>
		               <td class="tl">
		                  <ul class="dot_list c_gray pt10">
		                      <li>※ 숫자,영문,특수문자 포함하여 8자리 이상 입력해주세요 </li>
		                  </ul>
		                  <input class="memberPwd" type="password" maxlength="20" id="mem_pw" name="mem_pw" value="" placeholder="">
				          <span class="pwdCheck"></span>
		               </td>
		            </tr>
		            <tr class="cont pwdReCheckComentColor">
		               <th>비밀번호 확인 </th>
		               <td class="tl"><input class="memberPwdReCheck"  type="password" maxlength="20" name="mem_password" value="">
		               <span class="pwdEqualCheck"></span></td>
		            </tr>
		            
      		        <tr>
		            	<th>비밀번호 분실시 질문 </th>
		            	<td>
		            		<select class="select-hint" name="pw_quest" id="pass_question" >
				                  <option value="기억에 남는 추억의 장소는?" selected>기억에 남는 추억의 장소는?</option>
				                  <option value="나의 좌우명은?">나의 좌우명은?</option>
				                  <option value="나의 출신 초등학교는?">나의 출신 초등학교는?</option>
				                  <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
				                  <option value="아버지 성함은?">아버지 성함은?</option>
				                  <option value="어머니 성함은?">어머니 성함은?</option>
				                  <option value="가장 감명 깊게 본 영화는?">가장 감명 깊게 본 영화는?</option>
				                  <option value="자신의 보물 제 1호는?">자신의 보물 제 1호는?</option>
				                  <option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
				                  <option value="유년시절 가장 생각나는 친구이름은?">유년시절 가장 생각나는 친구이름은?</option>
				               </select>
		            	</td>
		            </tr>
		            <tr>
		            	<th>비밀번호 분실시 답변</th>
		            	<td>
				            <input class="hint-answer" type="text" name="pw_answer" id="pass_hint" placeholder="답을 입력해주세요">
		            	</td>
		            </tr>
		            
		            <tr  class="cont companyNameComentColor">
		            	<th>업체명</th>
		            	<td>
		            		<input class="company_name" type="text" name="comp_nm" id="company_name" placeholder="특수문자 제외 ">
		            	<span class="company_nameCheck"></span>
		            	</td>
		            </tr>
		            <tr class="cont companyNumComentColor">
		            	<th>업체등록 번호</th>
		            	<td>
		            		<input class="company_num" type="text" name="comp_num" id="company_num" placeholder="(-)하이픈 제외하고 입력" maxlength="20">
		            	<span class="company_numCheck"></span>
		            	</td>
		            </tr>
		            <tr class="cont companyOwnerComentColor">
		            	<th>대표자</th>
		            	<td>
		            		<input class="company_owner" type="text" name="comp_own" id="company_owner" placeholder="(공백없이 한글만 입력)" >
		            	<span class="company_ownerCheck"></span>
		            	</td>
		            </tr>
		            
		            <tr class="cont nameComentColor">
		               <th>가입자명</th>
		               <td class="tl"><input type="text" class="memberName" name="mem_nm" id="name" value="" placeholder="(공백없이 한글만 입력)">
		               <span class="nameCheck"></span>
		               </td>
		            </tr>
		            <tr class="cont phoneComentColor">
		               <th>휴대폰</th>
		               <td class="tl">
		                  
		                  <input type="text" class="mr0 memberPhone"  type="text" maxlength="11" name="mem_phone" placeholder="(-)하이픈 제외하고 입력">
		                  <span class="phoneCheck"></span>
		               </td>
		            </tr>
		            
		            <tr class="cont mailComentColor">
		               <th>이메일주소</th>
		               <td class="tl">
		                  <input type="text" class="ttext memberMail" name="mem_email" id="mail" value="" placeholder="example@example.com">
		                  <button type="button" onclick="mailCheck()" class="frm_adr_btn">중복체크</button>
		                  <!-- <a href="#n" class="btn_dark_s" style="height: 33px; line-height: 33px;">중복확인</a> -->
		                  <span class="mailCheck"></span>
		               </td>
		            </tr>
		            
		           <tr>
		            	<th>시,도 회명 </th>
		            	<td>
		            		<select  name="comp_auth"  >
				                  <option value="직할회" selected>직할회</option>
				                  <option value="서울시회">서울시회</option>
				                  <option value="인천시회">인천시회</option>
				                  <option value="대전시회">대전시회</option>
				                  <option value="광주시회">광주시회</option>
				                  <option value="부산시회">부산시회</option>
				                  <option value="대구시회">대구시회</option>
				                  <option value="울산시회">울산시회</option>
				                  <option value="경기북동회">경기북동회</option>
				                  <option value="경기북서회">경기북서회</option>
				                  <option value="경기남동회">경기남동회</option>
				                  <option value="경기남부회">경기남부회</option>
				                  <option value="경기중부회">경기중부회</option>
				                  <option value="강원도회">강원도회</option>
				                  <option value="충북도회">충북도회</option>
				                  <option value="충남도회">충남도회</option>
				                  <option value="전남도회">전남도회</option>
				                  <option value="전북도회">전북도회</option>
				                  <option value="경북동회">경북동회</option>
				                  <option value="경북서회">경북서회</option>
				                  <option value="경남도회">경남도회</option>
				                  <option value="제주도회">제주도회</option>
				               </select>
		            	</td>
		            </tr>
		            <tr class="cont companyNumberComentColor">
		               <th>회사전화번호</th>
		               <td class="tl">
		                  
		                  <input type="text" class="mr0 companyNumber"  type="text" maxlength="11" name="comp_tel" placeholder="(-)하이픈 제외하고 입력">
		                  <span class="companyNumberCheck"></span>
		               </td>
		            </tr>
		            
		            <tr class="cont companyFaxComentColor">
		               <th>회사팩스번호</th>
		               <td class="tl">
		                  
		                  <input type="text" class="mr0 companyFax"  type="text" maxlength="11" name="comp_fax" placeholder="(-)하이픈 제외하고 입력">
		                  <span class="companyFaxCheck"></span>
		               </td>
		            </tr>

		            <tr>
		            	<th>회사주소</th>
		            	<td>
		            		<input type="text" id="kakao_postcode" name="companyPostCode" readonly="readonly" placeholder="우편번호" class="kpaddr"> 
			                <span onclick="DaumPostcode()" class="frm_adr_btn">주소검색</span><br>
			                <input type="text" class="mt08 kraddr" id="kakao_roadAddress" name="companyStreetName" placeholder="도로명주소" readonly="readonly">
			                <input type="text" style="display:none;" id="kakao_jibunAddress" placeholder="지번주소">
			                <span id="guide" style="color:#999;display:none"></span>
			                <input type="text"  class="mt08" id="kakao_detailAddress" name="companyDetailStreetName" placeholder="상세주소">
			                <input type="text" style="display:none;" id="kakao_extraAddress" placeholder="참고항목">
			            	<input type="hidden" name="comp_addr" id="address" value="">
		            	</td>
		            </tr>
		            
		            
		         </tbody>
		      </table>
		      	<div class="form-group">
		      		<label for="captcha" style="display: block">자동 회원가입 방지 </label>
		      		<div class="captcha">
		      			<div class="captcha_child" >
		      				<img id="captchaImg" class="captchaImg" title="캡차 이미지" src="captchaImg.do" alt="캡차 이미지" style="width:200px;height: 60px;"/>
		      				<input type="text" id="captcha_check" value="" style="width:200px; height: 60px; font-size: 30px;">
		      			</div>
		      		</div>
		      	</div>
				
		      	<p class="btnWrap tc">
					<button class="reserv_btn sBtn" type="button">가입하기</button>
				</p>
		      </form>
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
function refreshBtn(type){
	var rand = Math.random();
	var url = "captchaImg.do?rand="+rand;
	$("#captchaImg").attr("src",url);
	
}
</script>

<script src="<%=request.getContextPath() %>/js/regi.js"></script>
