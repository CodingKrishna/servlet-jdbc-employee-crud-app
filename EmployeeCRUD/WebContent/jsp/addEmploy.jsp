<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
<style>
.loginform{  
    padding:10px;  
    border:1px solid green;  
    border-radius:15px;  
    width:425px;
    margin-top:10px;  
}  
.formheading{  
    background-color:red;  
    color:white;  
    padding:5px;  
    text-align:center;  
}  
.sub{  
background-color:skyblue;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:70px;  
border-radius:5px;  
}  
.sub1{  
background-color:yellow;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:70px;  
border-radius:5px;  
}  
.sub2{  
background-color:lightgreen;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:70px;  
border-radius:5px;  
} 
.sub3{  
background-color:lightgray;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:60px;  
border-radius:5px;  
}  
.sub4{  
background-color:red;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:60px;  
border-radius:5px;  
} 
</style>
</head>
<script>
function formValidation() {
	if(document.addDetails.eid.value == ""){
		alert("Please Enter Emp Id!");
		document.addDetails.eid.focus();
		return false;
	}
	if(document.addDetails.ename.value == ""){
		alert("Please Enter Employee Name!");
		document.addDetails.ename.focus();
		return false;
	}
	if(document.addDetails.esal.value == ""){
		alert("Please Enter Employee Salary!");
		document.addDetails.esal.focus();
		return false;
	}
}
</script>
<body>
<%Cookie ck[] = request.getCookies(); 
	String userName = null;
	for(int i=0;i<ck.length;i++) {
		if(ck[i].getName().equals("userName")) {
			userName = ck[i].getValue();
		}
	}
	if(userName!=null) {
%>
<form name="addDetails" action="<%=request.getContextPath()%>/AddServlet" method="get" onsubmit="return (formValidation());">
	<table align="left"><tr><td class="sub3"><a href = "<%=request.getContextPath()%>/jsp/welcomePage.jsp">Back</a></td><td class="sub"><font color="Black"><%=userName %></font></td></tr></table>
	<table align="right"><tr><td class="sub4"><a href="<%=request.getContextPath()%>/LogOutServlet">Log Out</a></td></tr></table>

	<table align="center" class="loginform">
		
		<tr align="center"><td colspan="25" align="center" class="formheading">Enter Details to Add Employee</tr>
		<tr align="center"><td class="sub">Emp Id</td><td class="sub"><input type="text" name="eid"></td></tr>
		<tr align="center"><td class="sub2">Name</td><td class="sub2"><input type="text" name="ename"></td></tr>
		<tr align="center"><td class="sub3">Salary</td><td class="sub3"><input type="text" name="esal"></td></tr>
		<tr><td colspan="25" align="center" class="sub1"><input type="submit" name="Submit"></td></tr>
	
	</table>
<% } else {
	response.sendRedirect(request.getContextPath()+"/jsp/loginPage.jsp");
}
%>
	
</form>
</body>
</html>