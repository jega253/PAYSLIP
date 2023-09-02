<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String currentPassword=request.getParameter("currentpass");
String Newpass=request.getParameter("newpass");
String conpass=request.getParameter("confirmpass");
String connurl = "jdbc:mysql://localhost:3306/payroll_db";
Connection con=null;
String pass="";
int id=0;

try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl,"root", "root0123456789*");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select currentpassword from validate where currentpassword='"+currentPassword+"'");

while(rs.next()){
id=rs.getInt(1);
pass=rs.getString(2);
}
System.out.println(id+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update validate set newpassword='"+Newpass+"' where id='"+id+"'");
out.println("Password changed successfully");
st1.close();
con.close();
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%>

</body>
</html>