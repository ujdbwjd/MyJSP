<%@page import="com.kb.org.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <jsp:include page="head.jsp"/> --%>
<%@ include file="head.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#mytr").click(function(){
			alert("연결되나");
		});
	});
</script>
</head>
<body>
	<div class="container"> <!-- container-fluid 여백없이 -->
		<!-- header -->
		<jsp:include page="menu.jsp"/>
		<!-- body -->
		<div class="row">
			<div class="col-lg-9"> <!-- xs xm md lg -->
				<table class="table">
					<tr>
						<td>순번</td>
						<td>아이디</td>
						<td>이름</td>
						<td>비밀번호</td>
						<td>성별</td>
						<td>가입날짜</td>
					</tr>
					<%-- <%
						List<MemberVO> list = (List) request.getAttribute("list");
						for(MemberVO vo : list)
							out.println(vo.getName());
					%> --%>
					<c:forEach items="${list}" var="i">
						<tr id="mytr">
							<td>${i.seq}</td>
							<td>${i.id}</td>
							<td>${i.name}</td>
							<td>${i.pwd}</td>
							<td>${i.gender}</td>
							<td>${i.joindate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-xs-3">
				<button type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">회원등록</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<ul class="pagination">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <c:forEach begin="1" end="${membercnt}" var="i">
					<li class="page-item"><a class="page-link" href="${path}/member.do?pageNum=${i}">${i}</a></li>
				  </c:forEach>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
		<!-- footer -->
		<div class="row">
			<div class="col text-center">
			<hr>copyright
			</div>
		</div>
	</div>
</body>
</html>