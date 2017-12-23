<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<style>
.loginform{  
    padding:10px;  
    border:1px solid green;  
    border-radius:15px;  
    width:425px;
    margin-top:100px;  
}  
.formheading{  
    background-color:yellow;  
    color:red;  
    padding: 7px 40px 7px 40px;  
    margin-left:100px; 
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
background-color:pink;  
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
<form>

<table align="left"><tr><td class="sub3"><a href = "<%=request.getContextPath()%>/jsp/welcomePage.jsp">Back</a></td></tr></table>
<table align="right"><tr><td class="sub4"><a href="<%=request.getContextPath()%>/LogOutServlet">LogOut</a></td></tr></table>

<table align="center">
	<tr><td align="center" colspan="25" class="sub2">Employee Details</td></tr>
	<tr class="sub"><td>SNo</td><td>EmpID</td><td>Name</td><td>Salary</td><td align="center" colspan="25">Action</td></tr>
	<%LinkedHashMap<Integer,ArrayList> lhm = (LinkedHashMap)request.getAttribute("empdetails"); %>
			<%for(Map.Entry<Integer,ArrayList> entry : lhm.entrySet()) {%>
	<tr> 		<%Integer key = (Integer)entry.getKey();%>   <td class="sub3"><%=key %></td>
				<%ArrayList<String> al = (ArrayList)entry.getValue(); %>
				<%for(int i=0;i<al.size();i++) {%>
					<%String val=(String)al.get(i);%><td class="sub1"><%=val %></td><%} %>
		
					<td class="sub2"><a href="<%=request.getContextPath()%>/jsp/updatePage.jsp?method=get&eid=<%=al.get(0)%>">Update</a></td><td class="sub4"><a href="<%=request.getContextPath()%>/DeleteServletInEmpDetails?method=get&eid=<%=al.get(0)%>">Delete</a></td>
	</tr>
			<%} %>
</table>
</form>
<%} else {
	response.sendRedirect(request.getContextPath()+"/jsp/loginPage.jsp");
}%>

</body>
</html>