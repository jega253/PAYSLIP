
<%@page import="java.util.List"%>
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%> 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
  
<% HttpSession mysession = request.getSession(false); %> 
<%
   
    if (mysession.getAttribute("listofemployee") == null)  {
        response.sendRedirect("LogoutServlet"); 
    }
%>

<!doctype html>
<html lang="en">
  <head>
  	<link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Payroll</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		
                        <!--  ----------import the package------  -->
         
         <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
		
		<style>
		h2{
		     font-size:35px;
		}
		table{
		     font-size:13px;
		}
		#foot{
		  padding-top:85%;
		}
		</style>
		
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch ">
			<nav id="sidebar">
				<div class="p-4 p-md-2 sticky-top">
		  		<a href="https://Geonslogix.com" target="_blank"#" class="img logo rounded-circle   mb-3" style="background-image: url(image/logopra.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="admin.jsp" data-toggle="collapse" aria-expanded="false">Home</a>
	          </li>
	          <li>
	              <a href="addEmp.jsp">Add Emp</a>
	          </li>
	          <li>
              <a href="Edit.jsp">Edit Emp</a>
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

        <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top"> 
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
        <h2 style="text-align:center;" class="text-primary">
        Welcome Geons
        <!--  --></h2>
        
       
      <div class="table-responsive small container ">
      
      <table class="table" id="example" style="width:100%">
  <thead class="thead-light">
    <tr>
      <th scope="col">SNO</th>
      <th scope="col">Employee ID</th>
      <th scope="col">Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Designation</th>
      <th scoope="col">Department</th>
      <th scoope="col">Date Of Joining</th>
    </tr>
  </thead>
  
  <tbody>
    <% List data=(List) mysession.getAttribute("listofemployee");
          for(int i=0;i<data.size();i++)
  {  
   Employee emp= (Employee)data.get(i);
    %>
    
      <tr>
    <td width="119"><%=i+1%></td>
  <td width="119"><%=emp.getEmpid()%></td>
  <td width="168"><%=emp.getFullname()%></td>
  <td width"119"><%=emp.getGenter() %>
  <td width="119"><%=emp.getDesignation()%></td>
  <td width="119"><%=emp.getDepartment()%></td>
  <td width="119"><%=emp.getDoj()%></td>
  </tr>
  <%}%>
    
  </tbody>
</table>
  

      </div>
      
       
		</div>
		

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
                         <!--  ----------import the package------  -->
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
      <script>
      
      $('#example').DataTable({order:[[1,"asc"]]});
    	  
      </script>
  </body>
</html>