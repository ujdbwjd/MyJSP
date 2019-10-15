<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	.a{
		font-size : 30px;
	}
	.b {
		border: 2px solid black; 
	}
</style>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 a b" style="background-color: red">
			8만큼 차지하는 div 영역
		</div>
		<div class="col-md-4 b" style="background-color: yellow">
			4만큼 차지하는 div 영역
		</div>
	</div>
	<div class="row">
		<div class="col-xs-4">
			<table class="table table-dark">
				<tr>
					<td>이름</td><td>나이</td><td>성별</td>
				</tr>
				<tr>
					<td>이름</td><td>나이</td><td>성별</td>
				</tr>
				<tr>
					<td>이름</td><td>나이</td><td>성별</td>
				</tr>
				<tr>
					<td>이름</td><td>나이</td><td>성별</td>
				</tr>
			</table>
		</div>
		<div class="col-xs-4" style="background-color: yellow">
			4만큼 차지하는 div 영역
		</div>
		<div class="col-xs-4" style="background-color: green">
			4만큼 차지하는 div 영역
		</div>
	</div>
	<div class="row">
		<div class="col-xs-3" style="background-color: red">
			3만큼 차지하는 div 영역
		</div>
		<div class="col-xs-3" style="background-color: yellow">
			3만큼 차지하는 div 영역
		</div>
		<div class="col-xs-3" style="background-color: green">
			3만큼 차지하는 div 영역
		</div>
		<div class="col-xs-3" style="background-color: blue">
			3만큼 차지하는 div 영역
		</div>
	</div>
</div>

</body>
</html>