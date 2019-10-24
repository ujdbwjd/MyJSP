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
		$(".mytr").css("cursor", "pointer");
		
		//preventDefault() 현재 이벤트의 기본 동작을 중단.
		//stopPropagation() 부모 태그의 이벤트 동작 중단.
		
		$(".inputbox").click(function(e){	
			var seq = $(this).attr("id"); //attr get
// 			alert("seq = " + seq);
			$("#"+seq).attr("checked","true"); //attr set
// 			e.preventDefault(); //기본 이벤트 제거
			e.stopPropagation(); //부모태그 이벤트 제거
		});
		
		$(".mytr").click(function(){
			var seq = $(this).attr("seq");
			location.href="memberUpdate.do?seq="+seq;
		});
	});
	
	function doDelete(){
// 		var myfr = document.getElementById("myform");
// 		myfr.submit();
		
		var test = confirm("삭제 하시겠습니까?");
		
		if(test) {
			$("#myform").attr("action", "memberDelete.do");
			$("#myform").submit();			
		}
		
	}
</script>
</head>
<body>
<form action="" method="get" id="myform">
	<div class="container"> <!-- container-fluid 여백없이 -->
		<!-- header -->
		<jsp:include page="menu.jsp"/>
		<!-- body -->
		<div class="row">
			<div class="col-xs-3">
				<button style="margin:30px 0;" type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">회원등록</button>
				<button style="margin:30px 10px;" type="button" class="btn" onclick="doDelete();">회원삭제</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12"> <!-- xs xm md lg -->
				<table class="table">
					<tr>
						<th>#</th>
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
						<tr class="mytr" seq="${i.seq}">
							<th class="justify-content-center"><input class="inputbox" type="checkbox" id="check${i.seq}" name="seq" value="${i.seq}"></th> <!-- 태그 중간정렬 justify-content-center -->
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
</form>
</body>
</html>