<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<script>
$(document).ready(function(){
	showReplyList();
});
$(document).on("click","#btnAnswerInsert",function(){
	var content = $("#content").val();
	var mem_name = $("#reg_id").val();
	var bbs_seq = ${bbsDetail.bbs_seq};
	var mem_seq =${userSession.mem_seq};
	var paramData = {"bbs_answer":content,"mem_name":mem_name,"mem_seq":mem_seq,"bbs_seq":bbs_seq};
	$.ajax({
		url: "bbsAnswerInsert.do", 
        type:"post",
        dataType: "text",
		data : paramData,
		success: function(result){
			showReplyList();
			$('#content').val('');
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
});
</script>

<div class="my-3 p-3 bg-white rounded shadow-sm" align="center" style="padding-top: 10px;">
	<form name="form" id="form" role="form" method="post" >
	<input type="hidden" value="${bbsDetail.bbs_seq }">
	<div class="row" style="margin-left: 130px;">
		<div class="col-sm-10" style="float: left;">
			<textarea rows="5" id="content" class="form-control" rows="4" style="width:700px;" placeholder="댓글을 입력해 주세요"></textarea>
		</div>
		<div class="col-sm-2"style="float: left;">
			<input class="form-control" id="reg_id" placeholder="댓글 작성자" value="${userSession.mem_name }" style="width:100%;"readonly="readonly">
			<button type="button" class="btn btn-sm btn-primary" id="btnAnswerInsert" style="width: 100%; margin-top: 10px"> 댓글달기 </button>
		</div>
	</div>
	</form>
</div>
<!-- Reply Form {e} -->
<!-- Reply List {s}-->
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top:150px;">
	<div id="replyList" align="left"></div>
</div> 




<script>
function showReplyList(){
	var paramData = {"bbs_seq" : "${bbsDetail.bbs_seq}"};
	$.ajax({
        url: "bbsAnswerList.do",
        type: 'POST',
        data: paramData,
        dataType: 'json',
        success: function(result) {
        var htmls = "";
        var regi = "";
		if(result.length < 1){
			
		} else {
			htmls +='<h2 class="border-bottom pb-2 mb-0" align="left">댓글 리스트</h2>';
            $(result).each(function(){
            	 htmls += '<div class="media text-muted pt-3" id="rid' + this.answer_seq + '">';
                 /*  htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">'; */
                  htmls += '<title>Placeholder</title>';
                  htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                  /* htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>'; */
                  htmls += '</svg>';
                  htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                  htmls += '<span class="d-block" >';
                  htmls += '<strong class="text-gray-dark">[' + this.mem_name + ']</strong>'+'&nbsp';
                  htmls += this.answer_regi.substr(2,17);
                  htmls += '<span style="padding-left: 7px; font-size: 9pt;" align="right">';
                 /*  htmls += '<c:if test="${userSession.mem_seq eq mem_seq }">'; */
                  htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.answer_seq + ', \'' + this.mem_name + '\', \'' + this.bbs_answer + '\' )" style="padding-right:5px">수정</a>';
                  htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.bbs_seq +',\''+this.answer_seq+'\')" >삭제</a>';
                 /*  htmls += '</c:if>'; */
                  htmls += '</span>';
                  htmls += '</span><br>';
                  htmls += '<textarea style="width:700px;" rows="3" readonly="readonly">'+this.bbs_answer+'</textarea>';
                  htmls += '</p>';
                  htmls += '</div>';
            });	//each end
		}
		$("#replyList").html(htmls);
        }	   // Ajax success end
	});	// Ajax end
}
function fn_updateReply(answer_seq, mem_name){
	var replyEditContent = $('#editContent').val();
	var paramData = {"bbs_answer": replyEditContent, "answer_seq": answer_seq,"mem_name":mem_name};
	$.ajax({
		url: "bbsAnswerUpdate.do",
		data : paramData,
		type : 'POST',
		dataType : 'text',
		success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

function fn_deleteReply(bbs_seq,answer_seq){
	var paramData = {"bbs_seq": bbs_seq,"answer_seq":answer_seq};
	$.ajax({
		url: "bbsAnswerDelete.do",
		data : paramData,
		type : 'POST',
		dataType : 'text',
		success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

function fn_editReply(answer_seq, mem_name, bbs_answer){
	var htmls = "";
	htmls += '<div class="media text-muted pt-3" id="rid' + answer_seq + '">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	/* htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>'; */
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">[' + mem_name + ']</strong>'+'&nbsp';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + answer_seq + ', \'' + mem_name + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
	htmls += '</span>';
	htmls += '</span><br>';		
	htmls += '<textarea name="editContent" id="editContent"  class="form-control" rows="2" style="width:500px;">'+bbs_answer+'</textarea>';
	htmls += '</p>';
	htmls += '</div>';
	$('#rid' + answer_seq).replaceWith(htmls);
	$('#rid' + answer_seq + ' #editContent').focus();
}





</script>

