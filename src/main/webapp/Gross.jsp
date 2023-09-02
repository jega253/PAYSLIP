<%@page import="java.util.List"%>
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    if (session.getAttribute("listofemployee") == null)  {
        response.sendRedirect("LogoutServlet"); 
    }
%>
  <% HttpSession mysession = request.getSession(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Payroll</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		            
		<style>
		
		table{
		     font-size:13px;
		}
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-image: url("image\skyblue.avif");
	background-repeat: no-repeat;
	background-size: 100% 100%
}

.card {
	padding: 30px 40px;
	margin-top: 10px;
	border: none !important;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2);
}

.blue-text {
	color: #00BCD4
}

.form-control-label {
	margin-bottom: 0
}

input, textarea, button {
	padding: 8px 15px;
	border-radius: 5px !important;
	margin: 5px 0px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	font-size: 18px !important;
	font-weight: 300
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #00BCD4;
	outline-width: 0;
	font-weight: 400
}

.btn-block {
	text-transform: uppercase;
	font-size: 15px !important;
	font-weight: 400;
	height: 43px;
	cursor: pointer
}

.btn-block:hover {
	color: #fff !important
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}
.icons{
text-align:center;
}
#foot{
		  padding-top:85%;
		}

</style>
                                <!--  ----------import the package------  -->
         
         <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
       
  </head>
<body>
    <div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 p-md-2  sticky-top">
		  		<a href="#" class="img logo rounded-circle  mb-3" style="background-image: url(image/logopra.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	        <li>
	            <a href="admin.jsp" >Home</a>
	          </li>
	          <li>
	              <a href="addEmp.jsp">Add Emp</a>
	          </li>
	          <li >
              <a href="Edit.jsp" >Edit Emp</a>
	          </li>
	          <li class="active">
              <a href="admin.jsp" data-toggle="collapse" aria-expanded="false">Payslips</a>
	          </li>
	          <li>
              <a href="LogoutServlet">Signout</a>
	          </li>
	        </ul>

	        <div class="footer" id="foot">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> ,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>
        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-1">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="nav navbar-nav ml-auto ">
                
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Signout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
         <!-- edit  -->
		<div class="table-responsive small container ">
      
      <table class="table" id="editemp" >
         <thead class="thead-light">
           <tr>
              <th scope="col">SNO</th>
              <th scope="col">Employee ID</th>
              <th scope="col">Name</th>
              <th scope="col">Gender</th>
              <th scope="col">Designation</th>
              <th scope="col">Depatrment</th>
              <th scope="col">Generate Payslip</th>
          
             
           </tr>  
         </thead>     
          
    <tbody>
         
  <% List<Employee> data=(List) mysession.getAttribute("listofemployee");
  
  
  
  //out.print("size :"+data.size());
  for(int i=0;i<data.size();i++)
  {  
   Employee emp= (Employee)data.get(i);
    %>
    
      <tr>
   
 <td width="119"><%=i+1%></td>
	<td width="119"><%=emp.getEmpid()%></td>
	<td width="168"><%=emp.getFullname()%></td>
	<td width="119"><%=emp.getGenter()   %>
	<td width="119"><%=emp.getDesignation()%></td>
	<td width="119" class="icons"><%=emp.getDepartment()%></td>
	<%if(emp.isPayslipSent()) 
	{%>
		
	
	<td width="119" class="icons"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 48 48">
<path fill="#c8e6c9" d="M44,24c0,11.045-8.955,20-20,20S4,35.045,4,24S12.955,4,24,4S44,12.955,44,24z"></path><path fill="#4caf50" d="M34.586,14.586l-13.57,13.586l-5.602-5.586l-2.828,2.828l8.434,8.414l16.395-16.414L34.586,14.586z"></path>
</svg></a></td>
	<%}else{ %>
<td width="119" class="icons"><a href="monthctc?empid=<%=emp.getEmpid()%>"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/money-transfer.png" alt="money-transfer"/></a></td>  </tr>
  
  <%}%>
  <%} %>
    </tbody>
     </table>

      </div>
   </div>
  
</body>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
                           <!--  ----------import the package------  -->
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
      <script>
      
      $('#editemp').DataTable();
      
      </script>
    
</html>