function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 아이디 체크(정규식 + 멘트)
var memId = document.querySelector(".memberId");

memId.addEventListener("change", function(e){
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
;

	if($(".memberId").val() == ""){ // 빈칸일 때
		if($('span.idCheck').hasClass('alert-green')) { 
    		$('.idComentColor span').removeClass('alert-red');
    		$('.idComentColor span').removeClass('alert-green');
    	} else if($('span.idCheck').hasClass('alert-red')) {
    		$('.idComentColor span').removeClass('alert-red');
    		$('.idComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".idCheck").innerHTML = "";
	}else { // 빈칸이 아닐때
	    if( !idReg.test( $(".memberId").val() )) { // 정규식 조건에 맞지 않을때
	    	if($('span.idCheck').hasClass('alert-green')) { // alert-green이 있으면
	    		$('.idComentColor span').removeClass('alert-green');
	    	}
	    	$('.idComentColor span').addClass('alert-red');
	    	document.querySelector(".idCheck").innerHTML = "id형식이 맞지 않습니다.";
	        return;
	    }  else {
	    	if($('span.idCheck').hasClass('alert-green')) { 
	    		$('.idComentColor span').removeClass('alert-green');
	    	}
	    		$('.idComentColor span').addClass('alert-red');
	    		document.querySelector(".idCheck").innerHTML = "중복체크 전입니다.";
	    }
	}
});
//var idcheck = $("#id").val();
var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
function idCheck(){
	$.ajax({
		url : `${getContextPath()}`+"/idCheck.do",
		type : "post",
		dataType:"text",
		data : "idcheck="+$("#id").val(),
		success:function(data){
			if(idReg.test( $(".memberId").val() )){
				if(data === "true"){
					$('.idComentColor span').removeClass('alert-green');
					$('.idComentColor span').addClass('alert-red');
					Swal.fire({
						icon:"info",
						title:"사용 중인  아이디입니다.",
						text:"다른 아이디를 이용해 주세요",
						confirmButtonText:"확인",
						showConfirmButton: true
						}).then(function(){
							document.querySelector(".idCheck").innerHTML = "사용 중인  아이디입니다.";
							$("#id").focus();
							return;
						})

				} else {
					$('.idComentColor span').removeClass('alert-red');
					$('.idComentColor span').addClass('alert-green');
					Swal.fire({
						icon:"info",
						title:"사용 가능한 아이디 입니다.",
						confirmButtonText:"확인",
						showConfirmButton: true
						}).then(function(){
							document.querySelector(".idCheck").innerHTML = "사용 가능한 아이디입니다.";
							return;
						})
				}
			}
		},
		error:function(request,status,error){
			
		}
		
	});
};

//패스워드 체크(정규식 + 멘트)
var memPwd = document.querySelector(".memberPwd");
memPwd.addEventListener("change", function(e){
	var pwdReg = /(?=.*\d{1,19})(?=.*[~`!@#$%\^&*()-+=]{1,19})(?=.*[a-zA-Z]{1,19}).{8,19}$/g;
	if($(".memberPwd").val() == ""){
		if($('span.pwdCheck').hasClass('alert-red')) {
    		$('.pwdComentColor span').removeClass('alert-red');
    	}
		document.querySelector(".pwdCheck").innerHTML = "";
	} else {
    if( !pwdReg.test( $(".memberPwd").val() )) {
    	if($('span.pwdCheck').hasClass('alert-green')) {
    		$('.pwdComentColor span').removeClass('alert-green');
    	}
    	$('.pwdComentColor span').addClass('alert-red');
    	Swal.fire({
			icon:"warning",
			title:"비밀번호는 숫자,영문,특수문자 포함 ",
			text:"8자리 이상 이어야 합니다.",
			confirmButtonText:"확인",
			showConfirmButton: true
			}).then(function(){
				$("#pwd").focus();
				return;
			})
    	document.querySelector(".pwdCheck").innerHTML = "숫자,영문,특수문자 포함 8자리 이상 이어야 합니다.";
        return;
    } else {
    	if($('span.pwdCheck').hasClass('alert-red')) {
    		$('.pwdComentColor span').removeClass('alert-red');
    	}
    	$('.pwdComentColor span').addClass('alert-green');
    	document.querySelector(".pwdCheck").innerHTML = "사용가능한 비밀번호 입니다";
    }
	}
});

//패스워드 재확인 + 멘트
var pw = document.querySelector(".memberPwdReCheck");

pw.addEventListener("change", function(e){
var pw1 = document.querySelector(".memberPwd").value;
var pw2 = document.querySelector(".memberPwdReCheck").value;	
if(pw1 == "" || pw2 == ""){
	if($('span.idCheck').hasClass('alert-green')) {
		$('.idComentColor span').removeClass('alert-green');
	}
	document.querySelector(".pwdEqualCheck").innerHTML = "";
} else {
	if(pw1 == pw2){
		if($('span.pwdEqualCheck').hasClass('alert-red')) {
    		$('.pwdReCheckComentColor span').removeClass('alert-red');
    	}
    	$('.pwdReCheckComentColor span').addClass('alert-green');
		document.querySelector(".pwdEqualCheck").innerHTML = "일치합니다.";
		
	} else {
		if($('span.pwdEqualCheck').hasClass('alert-green')) {
    		$('.pwdReCheckComentColor span').removeClass('alert-green');
    	}
		Swal.fire({
        	  icon: 'warning',
        	  title: '비밀번호 불일치',
        	  showConfirmButton: true
        	}).then(function(){
        		$('.memberPwdReCheck').val("");
    			$('.memberPwdReCheck').focus();
        	});
	}
}
});

//업체명 정규식 + 멘트
var company_name = document.querySelector('.company_name');
company_name.addEventListener("change", function(e){
	var nameReg = /^[가-힣a-zA-Z0-9]{1,15}$/g;
	if($('.company_name').val() == ""){
		if($('span.company_nameCheck').hasClass('alert-red')){
			$('.companyNameComentColor span').removeClass('alert-red');
		}
		document.querySelector(".company_nameCheck").innerHTML = "";
	} else {
		if( !nameReg.test( $(".company_name").val() )) {
			if($('span.company_nameCheck').hasClass('alert-green')) {
        		$('.companyNameComentColor span').removeClass('alert-green');
        	}
        	$('.companyNameComentColor span').addClass('alert-red');
        	Swal.fire({
          	  icon: 'warning',
          	  title: '특수문자가 포함 되어있습니다.',
          	  showConfirmButton: true
          	}).then(function(){
          		document.querySelector(".company_nameCheck").innerHTML = "형식 불일치";
                $("#company_name").focus();
            	return;
          	});
		} else {
			if($('span.company_nameCheck').hasClass('alert-red')) {
        		$('.companyNameComentColor span').removeClass('alert-red');
        	}
        	$('.companyNameComentColor span').addClass('alert-green');
        	document.querySelector(".company_nameCheck").innerHTML = "";
        	
		}
	}
});

//업체등록번호 정규식 + 멘트
var company_num = document.querySelector('.company_num');
company_num.addEventListener("change", function(e){
	var numReg = /^[0-9]+$/g;
	if($('.company_num').val() == ""){
		if($('span.company_numCheck').hasClass('alert-red')){
			$('.companyNumComentColor span').removeClass('alert-red');
		}
		document.querySelector(".company_nameCheck").innerHTML = "";
	} else {
		if( !numReg.test( $(".company_num").val() )) {
			if($('span.company_numCheck').hasClass('alert-green')) {
        		$('.companyNumComentColor span').removeClass('alert-green');
        	}
        	$('.companyNumComentColor span').addClass('alert-red');
        	Swal.fire({
          	  icon: 'warning',
          	  title: '숫자가 아닌 다른 문자가 포함되어 있습니다.',
          	  showConfirmButton: true
          	}).then(function(){
          		document.querySelector(".company_numCheck").innerHTML = "형식 불일치";
                $("#company_num").focus();
            	return;
          	});
		} else {
			if($('span.company_numCheck').hasClass('alert-red')) {
        		$('.companyNumComentColor span').removeClass('alert-red');
        	}
        	$('.companyNumComentColor span').addClass('alert-green');
        	document.querySelector(".company_numCheck").innerHTML = "";
        	
		}
	}
});

//대표자 정규식 + 멘트 (한글만)
var company_owner = document.querySelector('.company_owner');
company_owner.addEventListener("change", function(e){
	var ownerReg = /^[가-힣]+$/g;
	if($('.company_owner').val() == ""){
		if($('span.company_ownerCheck').hasClass('alert-red')){
			$('.companyOwnerComentColor span').removeClass('alert-red');
		}
		document.querySelector(".company_ownerCheck").innerHTML = "";
	} else {
		if( !ownerReg.test( $(".company_owner").val() )) {
			if($('span.company_ownerCheck').hasClass('alert-green')) {
        		$('.companyOwnerComentColor span').removeClass('alert-green');
        	}
        	$('.companyOwnerComentColor span').addClass('alert-red');
        	
        	Swal.fire({
          	  icon: 'warning',
          	  title: '이름은 한글만 입력 가능합니다',
          	  showConfirmButton: true
          	}).then(function(){
          		document.querySelector(".company_ownerCheck").innerHTML = "형식 불일치";
                $("#company_owner").focus();
            	return;
          	});
		} else {
			if($('span.company_ownerCheck').hasClass('alert-red')) {
        		$('.companyOwnerComentColor span').removeClass('alert-red');
        	}
        	$('.companyOwnerComentColor span').addClass('alert-green');
        	document.querySelector(".company_ownerCheck").innerHTML = "";
        	
		}
	}
});

//이름 정규식 + 멘트 (한글만)
var memberName = document.querySelector('.memberName');
memberName.addEventListener("change", function(e){
	var nm = /^[가-힣]+$/g;
	if($('.memberName').val() == ""){
		if($('span.memberName').hasClass('alert-red')){
			$('.nameComentColor span').removeClass('alert-red');
		}
		document.querySelector(".nameCheck").innerHTML = "";
	} else {
		
		if( !nm.test( $(".memberName").val() )) {
			if($('span.nameCheck').hasClass('alert-green')) {
        		$('.nameComentColor span').removeClass('alert-green');
        	}
        	$('.nameComentColor span').addClass('alert-red');
        	Swal.fire({
          	  icon: 'warning',
          	  title: '이름은 한글만 입력 가능합니다',
          	  showConfirmButton: true
          	}).then(function(){
          		document.querySelector(".nameCheck").innerHTML = "형식 불일치";
                $("#name").focus();
            	return;
          	});
		} else {
			if($('span.nameCheck').hasClass('alert-red')) {
        		$('.nameComentColor span').removeClass('alert-red');
        	}
        	$('.nameComentColor span').addClass('alert-green');
        	document.querySelector(".nameCheck").innerHTML = "";
        	
		}
	}
});

//휴대폰 정규식 + 멘트
var phone = document.querySelector(".memberPhone");
phone.addEventListener("blur", function(e){
	var ph = /^01([0|1|6|7|8|9])([1-9]{1}[0-9]{2,3})([0-9]{4})$/g;
	if($('.memberPhone').val() == ""){
		if($('span.memberPhone').hasClass('alert-red')){
			$('.phoneComentColor span').removeClass('alert-red');
		}
		document.querySelector(".phoneCheck").innerHTML = "";
	} else {
		if( !ph.test( $(".memberPhone").val() )) {
			if($('span.phoneCheck').hasClass('alert-green')) {
        		$('.phoneComentColor span').removeClass('alert-green');
        	}
        	$('.phoneComentColor span').addClass('alert-red');
        	document.querySelector(".phoneCheck").innerHTML = "형식 불일치";
        	Swal.fire({
          	  icon: 'warning',
          	  title: '숫자가 아니거나 특수문자존재.',
          	  text:'ex)01x-xxxx-xxxx',
          	  showConfirmButton: true
          	}).then(function(){
          		return;
          	});
		} else {
			if($('span.phoneCheck').hasClass('alert-red')) {
        		$('.phoneComentColor span').removeClass('alert-red');
        	}
        	$('.phoneComentColor span').addClass('alert-green');
        	document.querySelector(".phoneCheck").innerHTML = "";
        	
		}
	}
});

//이메일 체크(정규식 + 멘트)
var memberMail = document.querySelector(".memberMail");

memberMail.addEventListener("change", function(e){
	var emailReg = /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;

	if($(".memberMail").val() == ""){ // 빈칸일 때
		if($('span.mailCheck').hasClass('alert-green')) { 
    		$('.mailComentColor span').removeClass('alert-red');
    		$('.mailComentColor span').removeClass('alert-green');
    	} else if($('span.mailCheck').hasClass('alert-red')) {
    		$('.mailComentColor span').removeClass('alert-red');
    		$('.mailComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".idCheck").innerHTML = "";
	}else { // 빈칸이 아닐때
	    if( !emailReg.test( $(".memberMail").val() )) { // 정규식 조건에 맞지 않을때
	    	if($('span.mailCheck').hasClass('alert-green')) { // alert-green이 있으면
	    		$('.mailComentColor span').removeClass('alert-green');
	    	}
	    	$('.mailComentColor span').addClass('alert-red');
	    	document.querySelector(".mailCheck").innerHTML = "이메일 형식이 아닙니다 .";
	        return;
	    }  else {
	    	if($('span.idCheck').hasClass('alert-green')) { 
	    		$('.mailComentColor span').removeClass('alert-green');
	    		$('.mailComentColor span').addClass('alert-red');
	    		document.querySelector(".mailCheck").innerHTML = "중복체크 전입니다.";
	    	} else {
	    		$('.mailComentColor span').addClass('alert-red');
	    		document.querySelector(".mailCheck").innerHTML = "중복체크 전입니다.";
	    	}
	    }
	}
});

var emailReg = /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;
function mailCheck(){
	$.ajax({
		url : `${getContextPath()}`+"/mailCheck.do",
		type : "post",
		dataType:"text",
		data : "mailCheck="+$("#mail").val(),
		success:function(data){
			if(emailReg.test( $(".memberMail").val() )){
				if(data === "true"){
					$('.mailComentColor span').removeClass('alert-green');
					$('.mailComentColor span').addClass('alert-red');
					Swal.fire({
						icon:"info",
						title:"사용 중인  이메일입니다.",
						text:"다른 이메일를 이용해 주세요",
						confirmButtonText:"확인",
						showConfirmButton: true
						}).then(function(){
							document.querySelector(".mailCheck").innerHTML = "사용 중인 이메일 입니다.";
							$("#mail").focus();
							return;
						})
				} else {
					$('.mailComentColor span').removeClass('alert-red');
					$('.mailComentColor span').addClass('alert-green');
					Swal.fire({
						icon:"info",
						title:"사용 가능한 이메일 입니다.",
						confirmButtonText:"확인",
						showConfirmButton: true
						}).then(function(){
							document.querySelector(".mailCheck").innerHTML = "사용 가능한 이메일입니다.";
							return;
						})
				}
			}
		},
		error:function(request,status,error){
			
		}
		
	});
};

//회사번호 정규식 + 멘트
var companyNumber = document.querySelector(".companyNumber");
companyNumber.addEventListener("blur", function(e){
	var ph = /^0\d{1,2}\d{3,4}\d{4}$/g;
	if($('.companyNumber').val() == ""){
		if($('span.companyNumber').hasClass('alert-red')){
			$('.companyNumberComentColor span').removeClass('alert-red');
		}
		document.querySelector(".companyNumberCheck").innerHTML = "";
	} else {
		if( !ph.test( $(".companyNumber").val() )) {
			if($('span.companyNumberCheck').hasClass('alert-green')) {
        		$('.companyNumberComentColor span').removeClass('alert-green');
        	}
        	$('.companyNumberComentColor span').addClass('alert-red');
        	document.querySelector(".companyNumberCheck").innerHTML = "형식 불일치";
        	Swal.fire({
          	  icon: 'warning',
          	  title: '숫자가 아니거나 특수문자존재.',
          	  showConfirmButton: true
          	}).then(function(){
          		return;
          	});
		} else {
			if($('span.companyNumberCheck').hasClass('alert-red')) {
        		$('.companyNumberComentColor span').removeClass('alert-red');
        	}
        	$('.companyNumberComentColor span').addClass('alert-green');
        	document.querySelector(".companyNumberCheck").innerHTML = "";
        	
		}
	}
});

//팩스번호 정규식 + 멘트
var companyFax = document.querySelector(".companyFax");
companyFax.addEventListener("blur", function(e){
	var ph = /^0\d{1,2}\d{3,4}\d{4}$/g;
	if($('.companyFax').val() == ""){
		if($('span.companyFaxCheck').hasClass('alert-red')){
			$('.companyFaxComentColor span').removeClass('alert-red');
		}
		document.querySelector(".companyNumberCheck").innerHTML = "";
	} else {
		if( !ph.test( $(".companyFax").val() )) {
			if($('span.companyFaxCheck').hasClass('alert-green')) {
        		$('.companyFaxComentColor span').removeClass('alert-green');
        	}
        	$('.companyFaxComentColor span').addClass('alert-red');
        	document.querySelector(".companyFaxCheck").innerHTML = "형식 불일치";
        	Swal.fire({
          	  icon: 'warning',
          	  title: '숫자가 아니거나 특수문자존재.',
          	  showConfirmButton: true
          	}).then(function(){
          		return;
          	});
		} else {
			if($('span.companyFaxCheck').hasClass('alert-red')) {
        		$('.companyFaxComentColor span').removeClass('alert-red');
        	}
        	$('.companyFaxComentColor span').addClass('alert-green');
        	document.querySelector(".companyFaxCheck").innerHTML = "";
        	
		}
	}
});

$('button.sBtn').click(function(){
	if($('.idComentColor span').hasClass('alert-red') || $('.memberId').val().trim() == "") {
		Swal.fire({
      	  icon: 'warning',
      	  title: '아이디를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberId').focus();
    		return false;
      	});
	} else if($('.pwdComentColor span').hasClass('alert-red') || $('.memberPwd').val().trim() == "") {
		Swal.fire({
      	  icon: 'warning',
      	  title: '비밀번호를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPwd').focus();
    		return false
      	});
	} else if($('.pwdReCheckComentColor span').hasClass('alert-red') || $('.memberPwdReCheck').val().trim() == "") {
		Swal.fire({
      	  icon: 'warning',
      	  title: '비밀번호 재확인을 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPwdReCheck').focus();
    		return false;
      	});
	} else if($('#pass_hint').val().trim() == ""){
		Swal.fire({
			icon: 'warning',
			title: '비밀번호 찾기 질문을 확인해주세요',
			showConfirmButton: true
		}).then(function(){
			$('input[name=pass_hint]').focus();
			return false;
		});
	}else if($("#company_name").val().trim() == ""|| $(".companyNameComentColor span").hasClass('alert-red')) {
			Swal.fire({
	      	  icon: 'warning',
	      	  title: '대표자명을 확인해 주세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#company_name").focus();
	    		return false;
	      	});
	}else if($("#company_num").val().trim() == ""|| $(".companyNumComentColor span").hasClass('alert-red')) {
		Swal.fire({
      	  icon: 'warning',
      	  title: '업체등록 번호를 확인해 주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$("#company_num").focus();
    		return false;
      	});
	}else if($("#company_owner").val().trim() == ""|| $(".companyOwnerComentColor span").hasClass('alert-red')) {
		Swal.fire({
      	  icon: 'warning',
      	  title: '대표자명 확인해 주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$("#company_owner").focus();
    		return false;
      	});
	} else if($("#name").val().trim() == ""|| $(".nameComentColor span").hasClass('alert-red')) {
		Swal.fire({
      	  icon: 'warning',
      	  title: '이름을 확인해 주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$("#name").focus();
    		return false;
      	});
	} else if($('.phoneComentColor span').hasClass('alert-red') || $('.memberPhone').val().trim() == "") {
		Swal.fire({
      	  icon: 'warning',
      	  title: '휴대폰번호를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPhone').val("");
    		$('.memberPhone').focus();
    		return false;
      	});
	} else if($('.mailComentColor span').hasClass('alert-red') || $('.memberMail').val().trim() == "") {
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '이메일 주소를 확인해주세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('.memberMail').focus();
	    		return false;
	      	});
	} else if($('.companyNumberComentColor span').hasClass('alert-red') || $('.companyNumber').val().trim() == "") {
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '회사 전화번호를 확인해주세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('.companyNumber').focus();
	    		return false;
	      	});
	} else if($('.companyFaxComentColor span').hasClass('alert-red') || $('.companyFax').val().trim() == "") {
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '회사 팩스번호를 확인해주세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$('.companyFax').focus();
	    		return false;
	      	});
	} else if($('input[name=companyPostCode]').val().trim() == ""){
		Swal.fire({
      	  icon: 'warning',
      	  title: '회사주소를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=companyPostCode]').focus();
    		return false;
      	});
	} else if($('input[name=companyDetailStreetName]').val().trim() == ""){
		Swal.fire({
      	  icon: 'warning',
      	  title: '회사 상세주소를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=companyDetailStreetName]').focus();
    		return false;
      	});
	} else if($('#captcha_check').val().trim() == ""){
		Swal.fire({
      	  icon: 'warning',
      	  title: '보안문자를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('#captcha_check').focus();
    		return false;
      	});
	} else {
		$.ajax({
			url : "captchaCheck.do",
			type : "post",
			dataType:"text",
			data : {"captcha_check":$("#captcha_check").val()},
			success:function(data){
				if(data == "true"){
					Swal.fire({
						  title: '입력하신 정보로 가입 하시겠습니까?',
						  icon: 'question',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  cancelButtonText:'아니요',
						  confirmButtonText: '예'
						}).then((result) => {
						  if (result.value) {
							    var postCode = document.getElementById('kakao_postcode').value.trim();
								var roadAddr = document.getElementById('kakao_roadAddress').value;
								var detail = document.getElementById('kakao_detailAddress').value;
								var addr = postCode+"/"+roadAddr+"/"+detail;
								$("#address").val(addr);
								$("form").attr("action", "memberInsert.do").submit();
						  }
						})
					
				}else{
					Swal.fire({
				      	  icon: 'warning',
				      	  title: '보안문자를 확인해주세요',
				      	  showConfirmButton: true
				      	}).then(function(){
				      		$('#captcha_check').focus();
				    		return false;
				      	});
				}			
			},
			error:function(request,status,error){
				alert("error");
			}
		});
		
	}
});

















