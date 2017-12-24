<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="com.db.EmployDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Employee</title>
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

<form action="<%=request.getContextPath()%>/DeleteServlet" method="get">
<table align="left"><tr><td class="sub3"><a href = "<%=request.getContextPath()%>/jsp/welcomePage.jsp">Back</a></td><td class="sub"><font color="Black"><%=userName %></font></td></tr></table>
<table align="right"><tr><td class="sub4"><a href="<%=request.getContextPath()%>/LogOutServlet">Log Out</a></td></tr></table>
	

<table align="center" class="loginform">
<tr><td align="center"><%if(request.getAttribute("deletesuccess")!=null){ %><%=request.getAttribute("deletesuccess") %><%} %></td></tr>
<tr><td align="center" class="sub">Select EmpId to Delete</td></tr>
<%ResultSet rs = new EmployDb().getEmpId(); %>
	<tr ><td align="center" class="sub2"><select name="eid">
						<%while (rs.next()) {%>
						<option value="<%=rs.getString("eid")%>"><%=rs.getString("eid")%></option>
						<%}%>
			</select></td></tr>
	<tr><td align="center" class="sub1"><input type="submit" value="Delete"></td></tr>

</table>
</form>
<% } else {
	response.sendRedirect(request.getContextPath()+"/jsp/loginPage.jsp");
}
%>

</body>
</html>