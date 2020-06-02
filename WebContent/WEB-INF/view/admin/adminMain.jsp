<%@page import="cd.com.a.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/css/admin/style.css" rel="stylesheet">


<%@ include file="../../../../include/admin/header.jsp"%>
<%@ include file="../../../../include/admin/left_frm.jsp"%>
<% List<MemberVo> regiList = (List<MemberVo>)request.getAttribute("regiList");%>


<main role="main">
<!--   
  <section class="panel important">
    <h2>신규 가입 회원</h2>
    <ul>
      <li>최근 로그인  </li>
    </ul>
  </section> -->
  
<section class="panel important">
  <h2>최근 가입 회원</h2>
      <div class="twothirds">
      <span class="detailBtn"><a href="#">Detail</a></span>
        <table>
         <tr>
        		<th><strong>회원 아이디</strong></th>
        		<th><strong>대표자</strong></th>
        		<th><strong>시도회명</strong></th>
        		<th><strong>권한</strong></th>
        		<th><strong>가입일</strong></th>
         </tr>
         <%if(regiList.size()>0 && regiList != null){ %>
         	<%for(int i=0; i<5; i++) {%>
         	<%MemberVo vo = regiList.get(i); %>
         <tr>
         	<td><%=vo.getMem_id() %></td>
         	<td><%=vo.getCompany_owner() %></td>
         	<td><%=vo.getCompany_auth() %></td>
         	<td><%=vo.getMem_auth() %></td>
         	<td><%=vo.getMem_regi() %></td>
         </tr>
         	<%} %>
         <%}else{ %>
         <tr>
         	<td colspan="5">가입자가 없습니다.</td>
         </tr>
         <%} %>
        </table>
      </div>
</section>
  
  

</main>

