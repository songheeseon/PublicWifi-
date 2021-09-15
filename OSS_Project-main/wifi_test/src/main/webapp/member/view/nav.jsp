<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<%
		// ���ڵ� ó��
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
		// �α׾ƿ� ��� JSP�� �̵�
		function logoutPro(){
			alert("�α׾ƿ� �Ǿ����ϴ�.");
			location.href="/member/pro/LogoutPro.jsp";
		}
	</script>
</head>
<nav class="navbar navbar-default"> <!-- �׺���̼� -->
	<div class="navbar-header"> 	<!-- �׺���̼� ��� �κ� -->
		<!-- �׺���̼� ��� �ڽ� ���� -->
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<!-- �� ���� ��ư�� ȭ���� �������� ������ ��Ÿ���� -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<!-- ��� �ٿ� ������ ��Ÿ���� Ŭ���ϸ� main �������� �̵��Ѵ� -->
		<a class="navbar-brand" href="makers.jsp">����� WIFI</a>
	</div>
	<!-- �Խ��� ���� �̸� ���� ��Ÿ���� �޴� ���� -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<%
			// �α��� ���� �ʾ��� �� �������� ȭ��
			if(userID == null){
		%>
		<!-- ��� ������ ��Ÿ���� ����ٿ� ���� -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">�����ϱ�<span class="caret"></span></a>
				<!-- ����ٿ� ������ ���� -->	
				<ul class="dropdown-menu">
					<li><a href="login.jsp">�α���</a></li>
					<li><a href="join.jsp">ȸ������</a></li>
				</ul>
			</li>
		</ul>
		<%
			// �α����� �Ǿ� �ִ� ���¿��� �����ִ� ȭ��
			}else{
		%>
		<!-- ��� ������ ��Ÿ���� ����ٿ� ���� -->
		<ul class="nav navbar-nav">
			<li class="active"><a href="makers.jsp">����</a></li>
			<li><a href="bbs.jsp">�Խ���</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">ȸ������<span class="caret"></span></a>
				<!-- ����ٿ� ������ ���� -->	
				<ul class="dropdown-menu">
					<li onclick="logoutPro()"><a href="#">�α׾ƿ�</a></li>
				</ul>
			</li>
		</ul>
		<%
			}
		%>
	</div>
</nav>
</html>