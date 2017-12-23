<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
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
background-color:pink;  
padding: 7px 40px 7px 40px;  
color:white;  
font-weight:bold;  
margin-left:60px;  
border-radius:5px;  
}  
</style>
</head>
<script>
function validateForm() {
	if(document.updateDetails.ename.value == "") {
		alert("Please Enter Employee Name!");
		document.udateDetails.ename.focus();
		return false;
	}
	if(document.updateDetails.esal.value == "") {
		alert("Please Enter Emaployee Salary!");
		document.updateDetails.esal.focus();
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
<form name="updateDetails" action="<%=request.getContextPath()%>/UpdateServlet" method="get" onsubmit="return (validForm());">
	<table align="left"><tr><td class="sub3"><a href = "<%=request.getContextPath()%>/jsp/updateEmploy.jsp">Back</a></td><td class="sub"><font color="Black"><%=userName %></font></td></tr></table>
	<table align="right"><tr><td class="sub4"><a href="<%=request.getContextPath()%>/LogOutServlet">Log Out</a></td></tr></table>

	<table align="center" class="loginform">
		<tr><td align="center" colspan="25" class="sub4">Enter Details to Update</td></tr>
		<tr align="center" ><td class="sub2">Emp Id : </td><td class="sub2"><input type="text" value="<%=request.getParameter("eid") %>" name="eid"></td></tr>
		<tr align="center"><td class="sub">Name   : </td><td class="sub"><input type="text" name="ename"></td></tr>
		<tr align="center"><td class="sub3">Salary : </td><td class="sub3"><input type="text" name="esal"></td></tr>
		<tr><td align="center" colspan="25" class="sub1"><input type="submit" value="Update"></td></tr>
		<%request.setAttribute("eid",request.getParameter("eid"));%>
		<input type="hidden" name="fromupdatePage" value=<%=request.getAttribute("fromwhichPage") %>>
	</table>
</form>
<%} else {
	response.sendRedirect(request.getContextPath()+"/jsp/loginPage.jsp");
}
	%>
</body>
</html>