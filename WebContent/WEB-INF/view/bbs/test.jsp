<%@page import="cd.com.a.model.BbsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<%
/* List<BbsVo> bbsList = (List<BbsVo>)request.getAttribute("bbsList");

System.out.println("test:"+bbsList);
	BbsVo bbs = null;
 */
%>
<p>test</p>


<table>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<c:if test="${bbsList ne null}">
	<c:forEach var="test" items="${bbsList}" varStatus="status">
	
	<%
	/* if(bbsList.size()!= 0){
		for(int i =0 ; i< bbsList.size(); i++){
		bbs = bbs List.get(i);*/
		
	%>
	<tr>
		<td>1</td>
		 <td><input type="text" value="${test.mem_name }"></td>
		<td><input type="text" value="${test.bbs_title }"></td>
		<td><input type="text" value="${test.bbs_content }"></td> 
	</tr>

		
	 </c:forEach>
	</c:if>
</table>