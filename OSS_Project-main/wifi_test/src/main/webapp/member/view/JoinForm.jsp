<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>ȸ������ ȭ��</title>
	
	<!-- css ���� �и� -->
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"/>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>   
   
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Shared/stacks.css?v=61a74e0a2be3">
    <link rel="stylesheet" type="text/css"
        href="https://cdn.sstatic.net/Sites/stackoverflow/primary.css?v=9f6a4407c35d">
    <link rel="stylesheet" type="text/css"
        href="https://cdn.sstatic.net/Sites/stackoverflow/secondary.css?v=ed5b6b416ded">
    <link rel="stylesheet" type="text/css" href="https://cdn.sstatic.net/Shared/Channels/channels.css?v=31563f9a485c">
	<script type="text/javascript">
	
		// �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
		function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("���̵� �Է��ϼ���.");
				return false;r
			
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
				return false;
			}
		}
		
		// ��� ��ư Ŭ���� �α��� ȭ������ �̵�
		function goLoginForm() {
			location.href="LoginForm.jsp";
		}
	</script>
	
</head>
<body class="universal-auth-page unified-theme floating-content">
    <div class="container" style="background-color: white;">
        <div id="content" class="grid grid__center snippet-hidden">
            <div class="grid--cell">
                <div class="ta-center fs-title mx-auto mb24">
                    <a href="LoginForm.jsp">
                    	<img src="../../img/wifi_img.jpg" style="width: 200px; height: 200px;" />
                    </a>
                </div>
                <div id="formContainer" class="mx-auto mb24 p24 wmx3 bg-white bar-lg auth-shadow mb24">
                    <form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
                        <div class="grid fd-column gs4 gsy js-auth-item ">
                            <label class="grid--cell s-label" for="email">���̵�</label>
                            <div class="grid ps-relative">
                                <input class="s-input" id="id" type="text" size="30" maxlength="100" name="id">
                            </div>
                        </div>
                        <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="password" autocomplete="off" name="password"
                                    id="password">
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">��й�ȣ</label>
                            </div>
                        </div>
                        <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="password" autocomplete="off" name="password"
                                    id="password">
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">��й�ȣ Ȯ��</label>
                            </div>
                        </div>
                        <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="text" autocomplete="off" name="name">
                                
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">�̸�</label>
                            </div>
                        </div>
                        <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input type="radio"  name="gender" value="��" >��
                                <input type="radio"  name="gender" value="��" >��
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">����</label>
                            </div>
                        </div>
                         <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                             <input type="text" name="birthyy" maxlength="4" placeholder="��(4��)" size="6" >
						<select name="birthmm">
							<option value="">��</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="��" size="4" >   
                           
						
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">�������</label>
                            </div>
                        </div>
                         <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                         
                        </div>
                         <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="text" autocomplete="off" name="mail1">@
                                <select name="mail2">
                              
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							</select>
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">�̸���</label>
                            </div>
                        </div>
                        
                         <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="text" autocomplete="off" name="phone">
                                
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">�޴���ȭ</label>
                            </div>
                        </div>
                        
                         <div class="grid fd-column-reverse gs4 gsy js-auth-item ">
                            <div class="grid ps-relative js-password">
                                <input class="grid--cell s-input" type="text" autocomplete="off" name="address">
                            </div>
                            <div class="grid ai-center ps-relative jc-space-between">
                                <label class="grid--cell s-label" for="password">�ּ�</label>
                            </div>
                        </div>
                        
                        <div class="grid gs4 gsy fd-column js-auth-item ">
                        	<input type="submit" value="ȸ������" class="grid--cell s-btn s-btn__primary" />
                        	<input type="button" value="���"  class="grid--cell s-btn z-btn__primary" onclick="location.href='LoginForm.jsp'">
                        	
               
                       
                    </form>
					
                </div>
            </div>
        </div>
    </div>	
</html>