<%@page import="cd.com.a.model.PageMaker"%>
<%@page import="cd.com.a.model.PagingCriteria"%>
<%@page import="java.util.List"%>
<%@page import="cd.com.a.model.BbsVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../../include/header.jsp"%>
<%
List<BbsVo> bbsList = (List<BbsVo>)request.getAttribute("bbsList");
%>
<style>
.paging {
	margin-top: 10px;
	text-align: center;
	font-size: 0;
}
.paging a,
.paging strong {
	display: inline-block;
	width: 20px;
	height: 18px;
	margin: 0 1px;
	border: 1px solid #dbdbdb;
	color: #767676;
	font-size: 11px;
	font-weight: bold;
	line-height: 20px;
	vertical-align: middle;
  text-decoration: none;
}
.paging a:hover,
.paging a:active,
.paging a:focus {
	border: 1px solid #4c8500;	
}
.paging strong {
	color: #fff;
	background: #668cff;
	border: 1px solid #668cff;
}
.paging .direction {
	background: url('http://leroro.net/images/ui/sp_btn_paging.gif') no-repeat;
}
.paging .direction.first {
	background-position: left top;
}
.paging .direction.prev {
	margin: 0 12px 0 1px;
	background-position: -20px 0;
}
.paging .direction.next {
	margin: 0 1px 0 12px;
	background-position: -40px 0;
}
.paging .direction.last {
	background-position: right top;
}
.paging .direction span {
	position: absolute;
	display: block;
	width: 20px;
	height: 18px;
	overflow: hidden;
	z-index: -1;
}
</style>
<c:if test="${userSession eq null }">
<script>
	Swal.fire({
		  icon: 'info',
		  title: '장시간 응답 없음으로 \n 로그아웃 되었습니다.',
		  confirmButtonText:"확인",
		  showConfirmButton: true
	}).then(function(){
		location.href="main.do";
		 });
</script>
</c:if>

<div id="sub_contents">
	<div class="sub_cont">
		<div class=left_frm_regi style="float:left; width:300px;height:500px;margin-top:200px; background-color: #ccddff;">
			사이드 영역
		</div>
		
		<div class=frm_content align="center" style="float: left;">
			<p style="color:blue">공지사항</p>
			
			<div class="table_area" style="margin-top: 200px;" >
				<table border="1px" style="text-align: center;">
					<colgroup>
						<col width="40px">
						<col width="400px">
						<col width="100px">
						<col width="100px">
						<col width="60px">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제     목</th>
							<th>작 성 자</th>
							<th>날     짜</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
					<%
					if(bbsList!=null){
							BbsVo bbsVo = null;	
						for(int i=0; i<bbsList.size();i++){
							bbsVo = bbsList.get(i);
					%>
						<tr>
							<td><%=bbsVo.getBbs_seq() %></td>
							<td style="text-align: left;">
							<a href="bbsDetail.do?bbs_seq=<%=bbsVo.getBbs_seq()%>&page=${page}&searchType=${searchType}&keyword=${keyword}">
							<%=bbsVo.getBbs_title() %>
							<span style="font-size: 10px;">( <%=bbsVo.getAnswer_count() %> )
							
							</span></a>
							</td>
							<td><%=bbsVo.getMem_name() %></td>
							<td><%=bbsVo.getBbs_regi().substring(5,10) %></td>
							<td><%=bbsVo.getBbs_readcount() %></td>
						</tr>
					<%
						}
					}else{
					%>
						<tr>
							<td colspan="5">게시글이 존재 하지 않습니다</td>
						</tr>
					<%
					}
					%>
					</tbody>
				</table>
					<div align="right" style="margin-right: 20px;margin-top: 20px;">
						<button id="listMove">목록</button>
						<a href="bbsWrite.do">
						<img style="width: 80px;height: 20px;"src="<%=request.getContextPath()%>/image/writeBtn.png">
						</a>
					</div>
					
					<div align="center" class="paging">
						    <c:if test="${paging.prev }">
						        <a href='notice_admin.do?page=${paging.startPage-1 }&searchType=${searchType}&keyword=${keyword}' class="direction prev"><span>이전</span></a>
						    </c:if>
						    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
						        <a href='notice_admin.do?page=${pageNum }&searchType=${searchType}&keyword=${keyword}'>
						    	<c:if test="${page eq pageNum}">
						        <strong>${pageNum }</strong>
						    	</c:if>
						    	<c:if test="${page ne pageNum}">
						        ${pageNum }
						    	</c:if>
						        </a>
						    </c:forEach>
						    <c:if test="${paging.next }">
						        <a href='notice_admin.do?page=${paging.endPage+1 }&searchType=${searchType}&keyword=${keyword}'class="direction next"><span>다음</span></a>
						    </c:if>
					</div>
					
					<div style="margin-top: 10px;">
						<select class="search_index" name="search_index" id="search_index" >
				                  <option value="1" selected>제목</option>
				                  <option value="2">내용</option>
				                  <option value="3">제목+내용</option>
				                  <option value="4">작성자</option>
						</select>
						<input type="text" id="keyword" value="">
						<button type="button" id="searchBtn">검색</button>
					</div>
			</div><!-- //table_frm -->
		</div><!-- //frm_content -->
		
	</div> <!-- //sub_contents -->
</div>	<!-- //sub_cont -->
		
<%@ include file="../../../include/footer.jsp"%>

<script>
$("#searchBtn").click(function(){
	var searchType = $("#search_index").val();
	var keyword = $("#keyword").val().trim();
	
	if(searchType != "" && keyword !="" ){
		
	location.href="notice_admin.do?searchType="+searchType+"&keyword="+keyword;
		
	}else if(searchType == ""){
		Swal.fire({
	      	  icon: 'info',
	      	  title: '검색 타입을 선택해주세요.',
	      	  confirmButtonText:"확인",
	      	  showConfirmButton: true
	      }).then(function(){
	      return;
	    	 });
	}else if(keyword ==""){
		Swal.fire({
	      	  icon: 'info',
	      	  title: '검색어를 입력해주세요',
	      	  confirmButtonText:"확인",
	      	  showConfirmButton: true
	      }).then(function(){
	      return;
	    	 });
	} 
	
})

$("#listMove").click(function(){
	location.href="notice_admin.do";
})
</script>
