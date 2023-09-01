 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>

<!doctype html>
<html lang="en">
  <head>
  <% HttpSession mysession = request.getSession(false); %> 
<%
   
    if (mysession == null ) {
        response.sendRedirect("login.jsp"); 
    }
%>

  	<title>Payslip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
		
		
		<link rel="stylesheet" href="css/stylee.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4">
		  		<h1><a href="index.html" class="logo"><img alt="logo" src="image/geons-dashboard.png"></a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#"><span class="fa fa-home mr-3"></span>Dashboard</a>
	          </li>
	          <li>
	              <a href="Paysliplist.jsp"><span class="fa fa-user mr-3"></span>payslip List</a>
	          </li>
	           <li>
	              <a href="createpassword.jsp"><span class="fa fa-user mr-3"></span>Create Password</a>
	          </li>
	          <li>
              <a href="LogoutServlet"><span class="fa fa-briefcase mr-3"></span>Signout</a>
	          </li>
	        </ul>

	         <div class="footer">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> ,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by<a href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>


	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
          <h2 class="mb-4">Welcome,<%= ((Employee) session.getAttribute("name")).getFullname() %>!</h2>
             <p class="text-center font-weight-bold  text-primary fs-5">Dashboard </p>
           <p></p>
           
           <table class="table table-sm">
  <thead>
    <tr class="table-primary text-primary">
      <th scope="col">EARNINGS</th>
      <th scope="col">Values</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
              <th>EMP CODE</td>
              <td><%= ((Employee) session.getAttribute("name")).getEmpid() %></td>
            
            </tr>
             <tr>
              <th>EMP NAME</th>
              <td><%= ((Employee) session.getAttribute("name")).getFullname() %></td>
            
            </tr>
            <tr>
              <th>DATE OF JOINING</th>
               <td><%= ((Employee) session.getAttribute("name")).getDoj() %></td>
              
            </tr>
            <tr>
              <th>DESIGNATION</th>
              <td><%= ((Employee) session.getAttribute("name")).getDesignation() %></td>
            
            </tr>
            <tr>
              <th>DEPARTMENT</th>
               <td><%= ((Employee) session.getAttribute("name")).getDepartment() %></td>
              
            </tr>
            <tr>
              <th>GENDER</th>
               <td><%= ((Employee) session.getAttribute("name")).getGenter() %></td>
            
            </tr>    
            

               <!-- ----------------------------second table----------------------------------  -->
               
    <tr>
              <th>UAN NO</td>
              <td><%= ((Employee) session.getAttribute("name")).getUan() %></td>
            
            </tr>
             <tr>
              <th>PF ACCOUNT NO</th>
              <td><%= ((Employee) session.getAttribute("name")).getPf() %></td>
            
            </tr>
            <tr>
              <th>ESI NO</th>
               <td><%= ((Employee) session.getAttribute("name")).getEsi()%></td>
              
            </tr>
            <tr>
              <th>PAN NO</th>
              <td><%= ((Employee) session.getAttribute("name")).getPan() %></td>
            
            </tr>
           
            
  </tbody>
</table>
    <!-- ----------------------------third table----------------------------------  -->
               
               <table class="table table-sm">
  <thead>
    <tr class="table-primary text-primary">
      <th scope="col">LEAVES</th>
       <th scope="col">TOTAL LEAVE</th>
      <th scope="col">AVAIL LEAVE</th>
       <th scope="col">BALANCE LEAVE</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
             
              <th>CASUAL LEAVE </th>
              <td><%= ((Employee) session.getAttribute("name")).getcLeave() %></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <th>SICK LEAVE </th>
               <td><%= ((Employee) session.getAttribute("name")).getsLeave() %></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <th>PRIVILEGE LEAVE </th>
               <td><%= ((Employee) session.getAttribute("name")).getpLeave()  %></td>
              <td></td>
              <td></td>
            </tr>
             
  </tbody>
</table>
                                  

      </div>
		</div>

    <script src="jquery.min.js"></script>
    <script src="popper.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="main.js"></script>
  </body>
</html>
