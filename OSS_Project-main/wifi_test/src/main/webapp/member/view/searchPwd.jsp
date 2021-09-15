<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
<form name="searchPwd" method="post" action="viaPwd.jsp">
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <tr>

       <td>비밀번호 찾기</td>
       <td><div id="sub-title"> |  회원정보에 등록한 정보로 인증.</td>
       <td style="width:300px"></td>
      </tr>
     </table>
    </td> 
    </tr>       
   <tr> 
    <td>
   <table width="600px"  height="300px" align="center" border="0"  style=" background-color:none; border:dotted 5px none;">
    <tr>
     <td>
      <table width="400px"  border="0" style="margin-top:3%">
       <tr>
        <td><div id="middle-title">&nbsp;아이디와 핸드폰번호를 입력해주세요.</div>
        </td>
       </tr>
      </table>
     </td>
    </tr>
    <tr>
     <td>
      <table width="380px" align="center" border="0" style="font-size:19px">
       <tr>
        <td>아이디</td>
        <td><input type="text" name="Id"></td>
       </tr>
      <tr>
        <td>휴대폰</td>
        <td><input type="text" name="Phone">
       
       </tr>
      </table>
     </td>
    </tr>
   
    <tr>
     <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="submit" name="search" value="찾기" class="btn btn-default">
         <input type="button" name="cancel" value="취소" class="btn btn-default" onclick="location.href='LoginForm.jsp'"></td>
       </tr>
      </table>
     </td>
    </tr>
  </table>
 </td>
</tr>
</table>
</td>
</table>
</form>
</body>
</html>