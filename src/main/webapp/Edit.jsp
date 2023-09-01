<%@page import="java.util.List"%>
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <% HttpSession mysession = request.getSession(); %>
  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <%
    if (mysession.getAttribute("listofemployee") == null)  {
        response.sendRedirect("login.jsp"); 
    }
%>
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
	height: 40px;
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
	          <li class="active">
              <a href="Edit.jsp" data-toggle="collapse" aria-expanded="false">Edit Emp</a>
	          </li>
	          <li>
              <a href="Gross.jsp">Payslips</a>
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
      <div id="content" class="p-4 p-md-0">

        <nav class="navbar navbar-expand-lg navbar-light bg-light  sticky-top">
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
         <h5 class="text-center" style="color: #00BCD4;">Edit Employee</h5>
		<div class="table-responsive small container ">
      
      <table class="table" id="editemp" >
         <thead class="thead-light">
           <tr>
              <th scope="col">SNO</th>
              <th scope="col">Employee ID</th>
              <th scope="col">Name</th>
              <th scope="col">Gender</th>
              <th scope="col">Designation</th>
              <th scope="col">Department</th>
             <th scope="col">Actions</th>
             
           </tr>  
         </thead>     
          
    <tbody>
         
  <% List data=(List) mysession.getAttribute("listofemployee");
  
  
  
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
		<td width="119"><%=emp.getDepartment()%></td>
	<td>
	<a href="Editemp?empid=<%=emp.getEmpid()%>"  
	 >
	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewBox="0,0,256,256"
style="fill:#000000;">
<g fill="#94d82d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(10.66667,10.66667)"><path d="M19.17188,2c-0.72375,0 -1.4475,0.27562 -2,0.82813l-1.17187,1.17188l4,4l1.17188,-1.17187c1.104,-1.104 1.104,-2.895 0,-4c-0.5525,-0.5525 -1.27625,-0.82812 -2,-0.82812zM14.5,5.5l-11.5,11.5v4h4l11.5,-11.5z"></path></g></g>
</svg>
</a><a href="deleteemp?empid=<%=emp.getEmpid()%>"  
	 >
<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewBox="0,0,256,256"
style="fill:#000000;">
<g fill="#fa5252" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(10.66667,10.66667)"><path d="M10,2l-1,1h-4c-0.6,0 -1,0.4 -1,1c0,0.6 0.4,1 1,1h2h10h2c0.6,0 1,-0.4 1,-1c0,-0.6 -0.4,-1 -1,-1h-4l-1,-1zM5,7v13c0,1.1 0.9,2 2,2h10c1.1,0 2,-0.9 2,-2v-13zM9,9c0.6,0 1,0.4 1,1v9c0,0.6 -0.4,1 -1,1c-0.6,0 -1,-0.4 -1,-1v-9c0,-0.6 0.4,-1 1,-1zM15,9c0.6,0 1,0.4 1,1v9c0,0.6 -0.4,1 -1,1c-0.6,0 -1,-0.4 -1,-1v-9c0,-0.6 0.4,-1 1,-1z"></path></g></g>
</svg>
</a>
</td>  
  </tr>
  
  <%}%>
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