<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<%
		// 인코딩 처리
		request.setCharacterEncoding("euc-kr"); 
		String userID = null;
		if((String)session.getAttribute("sessionID") != null){
			userID = (String)session.getAttribute("sessionID");
		}
	%>
	<link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		// 로그아웃 담당 JSP로 이동
		function logoutPro(){
			alert("로그아웃 되었습니다.");
			location.href="/member/pro/LogoutPro.jsp";
		}
	</script>
</head>
<nav class="navbar navbar-default"> <!-- 네비게이션 -->
	<div class="navbar-header"> 	<!-- 네비게이션 상단 부분 -->
		<!-- 네비게이션 상단 박스 영역 -->
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
		<a class="navbar-brand" href="makers.jsp">모두의 WIFI</a>
	</div>
	<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<%
			// 로그인 하지 않았을 때 보여지는 화면
			if(userID == null){
		%>
		<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
				<!-- 드랍다운 아이템 영역 -->	
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
		<%
			// 로그인이 되어 있는 상태에서 보여주는 화면
			}else{
		%>
		<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
		<ul class="nav navbar-nav">
			<li class="active"><a href="makers.jsp">메인</a></li>
			<li><a href="bbs.jsp">게시판</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
				<!-- 드랍다운 아이템 영역 -->	
				<ul class="dropdown-menu">
					<li onclick="logoutPro()"><a href="#">로그아웃</a></li>
				</ul>
			</li>
		</ul>
		<%
			}
		%>
	</div>
</nav>
</html>