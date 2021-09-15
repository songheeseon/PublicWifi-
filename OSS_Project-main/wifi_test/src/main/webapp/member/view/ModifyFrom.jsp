<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<%@ page import="jsp.member.model.MemberBean" %>
<html>
<head>
	<%
		String id = session.getAttribute("sessionID").toString();
	
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean memberBean = dao.getUserInfo(id);
	%>

	<title>ȸ������ ����ȭ��</title>
	
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>
	
	<script type="text/javascript">
	
		function init(){
			setComboValue("<%=memberBean.getMail2()%>");
		}

		function setComboValue(val) 
		{
			var selectMail = document.getElementById('mail2'); // select ���̵� �����´�.
			for (i = 0, j = selectMail.length; i < j; i++)  // select �ϴ� option ����ŭ �ݺ��� ������.
			{
				if (selectMail.options[i].value == val)  // �ԷµȰ��� option�� value�� ������ ��
				{
					selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
					break;
				}
			}
		}
		
		// ��й�ȣ �Է¿��� üũ
		function checkValue() {
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
		}
		
	</script>
	
</head>
<body onload="init()">

		<br><br>
		<b style="margin-left: 840px;"><font size="6" color="gray">ȸ������ ����</font></b>
		<br><br><br>
		
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ��� -->
		<form method="post" action="/member/pro/ModifyPro.jsp" 
				name="userInfo" onsubmit="return checkValue()">
				
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td id="title"><%=memberBean.getId() %></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="password" maxlength="50" 
							value="<%=memberBean.getPassword()%>">
					</td>
				</tr>
			</table>	
			<br><br>	
			<table>

				<tr>
					<td id="title">�̸�</td>
					<td>
					<input type="text" name="name" value="<%=memberBean.getName()%>">
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td><%=memberBean.getGender()%></td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td><input type="text" name="birth" value=
						<%=memberBean.getBirthyy() %>�� 
						<%=memberBean.getBirthmm() %>�� 
						<%=memberBean.getBirthdd() %>��>
					</td>
				</tr>
				<tr>
					<td id="title">�̸���</td>
					<td><input type="text" name="mail" value="<%=memberBean.getMail1()%>@<%=memberBean.getMail2() %>"></td>
				</tr>
				<tr>
					<td id="title">�޴���ȭ</td>
					<td><input type="text" name="phone" value="<%=memberBean.getPhone()%>">
					</td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td><input type="text" name="address" value="<%=memberBean.getAddress()%>"></td>
				</tr>
                                
                     
			</table>
			<br><br>
			<div style="margin-left: 865px;">
			<input type="button" value="���"  class="grid--cell s-btn s-btn__primary" onclick="location.href='makers.jsp'">
        	<input type="submit" value="����"  class="grid--cell s-btn z-btn__primary" onclick="location.href='LoginForm.jsp'"/>
			</div>
		
		</form>
		
</body>
</html>