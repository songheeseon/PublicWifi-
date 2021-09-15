<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<%
		// 인코딩 처리
		request.setCharacterEncoding("euc-kr"); 
	%>
	<title>로그인 화면</title>
	<!-- 화면 최적화 -->
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<!-- css 파일 분리 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>   
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Shared/stacks.css?v=61a74e0a2be3">
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Sites/stackoverflow/primary.css?v=9f6a4407c35d">
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Sites/stackoverflow/secondary.css?v=ed5b6b416ded">
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Shared/Channels/channels.css?v=31563f9a485c">
	<style>
		#map{
		  margin : -30px 0px 0px 0px;
		}
		
		.form-control{
		 width:500px;
		}
		.navbar{
		 margin-top:-50px;
		}
		.navbar-brand{
		  font-size:20px;
		  margin: 5px 0px 5px 3px;
		}
		.nav-link{
		  font-size:16px;
		  margin: 0px 0px 0px -12px;
		}
	</style>
	<script type="text/javascript">
		function checkValue() {
			if($("#id").val() == ""){
				alert("아이디를 입력하세요");
				$("#id").focus();
				return false;
			}
			if($("#password").val() == ""){
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return false;
			}
		}
	
		// 회원가입 버튼 클릭시 회원가입 화면으로 이동
		function goJoinForm() {
			location.href="JoinForm.jsp";
		}	
	</script>
	
</head>
<body class="universal-auth-page unified-theme floating-content">
	<jsp:include page="nav.jsp"></jsp:include>
    <div class="container" style="background-color: white;">
        <div id="content" class="grid grid__center snippet-hidden">
            <div class="grid--cell">
                <div class="ta-center fs-title mx-auto mb24">
                    <a href="LoginForm.jsp">
                    	<img src="../../img/wifi_img.jpg" style="width: 200px; height: 200px;" />
                    </a>
                </div>
                <div id="formContainer" class="mx-auto mb24 p24 wmx3 bg-white bar-lg auth-shadow mb24">
                    <form id="loginInfo" class="grid fd-column gs12 gsy" action="../pro/LoginPro.jsp" method="POST" onsubmit="return checkValue()">
                        <div class="grid fd-column gs4 gsy js-auth-item ">
                            <label class="grid--cell s-label" for="email">아이디</label>
                            
                        </div>    
                            <div class="grid ps-relative">
                               <input class="s-input" id="id" type="text" size="30" maxlength="100" name="id">
                            </div>
                        
                        <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="password" autocomplete="off" name="password"
                                    id="password">
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">비밀번호</label>
                                 <a class="grid--cell s-link fs-caption" href="searchId.jsp">아이디 찾기</a>
                                <a class="grid--cell s-link fs-caption" href="searchPwd.jsp">비밀번호 찾기</a>
                            </div>
                        </div>
                        <div class="grid gs4 gsy fd-column js-auth-item ">
                        	<input type="submit" value="로그인" class="grid--cell s-btn s-btn__primary" />
                        </div>
		                <div class="mx-auto ta-center fs-body1 p16 pb0 mb24 w100 wmx3">
		                    <a href="javascript:goJoinForm();">회원가입</a>
		                </div>
                    </form>
					<% 
						// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
						// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
						String msg = request.getParameter("msg");
						out.println("<br>");	
						if(msg!=null && msg.equals("0")) // request.getAttribute("error") == "0" 
						{
							out.println("<br>");
							out.println("<font color='red' size='4'>비밀번호를 확인해 주세요.</font>");
						}
						else if(msg!=null && msg.equals("-1")) //request.getAttribute("error") == "-1"
						{	
							out.println("<br>");
							out.println("<font color='black' size='4'>아이디를 확인해 주세요.</font>");
						}
					%>	
                </div>
            </div>
        </div>
    </div>	
</body>
</html>