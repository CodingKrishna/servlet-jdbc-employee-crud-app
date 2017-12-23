<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style>
.loginform{  
    padding:10px;  
    border:1px solid green;  
    border-radius:15px;  
    width:350px;
    margin-top:10px;  
}  
.formheading{  
    background-color:red;  
    color:white;  
    padding:5px;  
    text-align:center;  
}  
.sub{  
background-color:red;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:70px;  
border-radius:5px;  
}  
</style>
<script>
function validateForm() {
	if (document.loginForm.user.value == "") {
		alert("Please Enter UserName!");
		document.loginForm.user.focus();
		return false;
	}
	if(document.loginForm.password.value == "") {
		alert("Please Enter Password!");
		document.loginForm.user.focus();
		return false;
	} 
}
</script>
</head>
<body>
<form name="loginForm" action="<%=request.getContextPath()%>/LoginServlet" method="get" onsubmit="return (validateForm());">
	<table align="center" class="loginform" >
		<tr><td colspan="25" align="center"><h3><%if(request.getAttribute("loginfail")!=null)%><%= request.getAttribute("loginfail") %> </h3></td></tr>
		<tr class="formheading"> <td colspan="25" align="center"><p>Welcome to Login Page</p></td></tr>
		<tr><td>User Name</td><td><input type="text" name="user"></td></tr>
		<tr><td>Password</td><td><input type="password" name="password"></td></tr>
		<tr><td colspan="100" align="center"><input type="submit" value="Login"></td></tr>
	</table>
</form>
</body>
</html>