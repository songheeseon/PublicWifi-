<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>탈퇴 화면</title>
    
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
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
    
</head>
<body>
 
    <br><br>
    <b style="margin-left: 900px;"><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="/member/pro/DeletePro.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr >
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br>
        <div style="margin-left: 900px;"> 
        <input type="button" value="취소" onclick="javascript:window.location='../../LoginForm.jsp'">
        <input type="submit" value="탈퇴" /> 
        </div>
    </form>
</body>
</html>