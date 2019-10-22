<%@page import="com.kb.org.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	String path = request.getContextPath();
// 	out.println("path = " + path);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <jsp:include page="head.jsp"/> --%>
<%@ include file="head.jsp" %>

</head>
<body>
	<div class="container"> <!-- container-fluid 여백없이 -->
		<!-- header -->
		<jsp:include page="menu.jsp"/>
		<!-- body -->
		<div class="row">
			<div class="col-xs-12">
<%-- 				<form action="<%=path%>/memberInsertPro.do"> --%>
				<form action="${path}/memberInsertPro.do">
<!-- 				<form action="memberInsertPro.do"> -->
					<div class="form-group">
						<label for="id">ID:</label> <input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="name">Name:</label> <input type="text" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password" class="form-control" id="pwd" name="pwd">
					</div>
					<div class="form-group">
						<label for="gender">Gender:</label> <input type="text" class="form-control" id="gender" name="gender">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
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