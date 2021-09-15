<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.SearchService" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
   request.setCharacterEncoding("UTF-8");
   
   String Id = request.getParameter("Id");
   
   String Phone = request.getParameter("Phone");
   
   SearchService searchService = SearchService.getInstance();
   
   String Password = searchService.searchPwd(Id, Phone);
%>
<body>
   <form method="post" action="LoginForm.jsp">
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <%if(Password!= null){ %>
      <tr>
       <td><%=Id %>님의 비밀번호는</td>
      </tr>
      <tr>
      <td><h1><%=Password %></h1>입니다.</td>
      </tr>
      </table>
    </td> 
    </tr>       
   <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="submit" name="search" value="로그인하기" class="btn btn-primary">
       </tr>
      </table>
      <%} else{%>
      <tr>
      <td><%=Id %>님!</td>
      </tr>
      <tr>
      <td><h1>가입정보가 없습니다.</h1></td>
      </tr>   
      </table>
    </td> 
    </tr>       
   <tr> 
    <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" value="회원가입하기" class="btn btn-primary" onclick="location.href='JoinForm.jsp'"></td>
        <td><input type="button" value="처음으로" class="btn btn-primary" onclick="location.href='LoginForm.jsp'"></td>
       </tr>
      </table>   
      <%} %>
      
     
     </td>
    </tr>
  </table>
 </td>
</tr>
</table>
</form>
</body>
</html>