<!doctype html>
<%@page import="payslip.geons.dto.Ctc"%>
<%@page import="payslip.geons.dto.CtcForm"%>
<%@page import="payslip.geons.service.CtcCalculation"%>
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%> 
<html lang="en">
<head>
 <%@page import="payslip.geons.dto.Employee"%>
 <% HttpSession mysession = request.getSession(false); %> 
 <%session.setAttribute("name",session.getAttribute("name")); %>
 <%Employee employee=(Employee)mysession.getAttribute("employee"); %>
 <% CtcForm ctcForm =(CtcForm) mysession.getAttribute("ctcForm"); %>
<link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Payroll</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<style>
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
</style>
<style>
      table {
        border-collapse: collapse;
      }

      table,
      th,
      td {
        border: 1px solid #000; /* Change #000 to your desired border color */
      }
      .table {
        margin-top: 5%;
      }
    </style>
</head>
<body>
	
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-3">
				<a href="#" class="img logo rounded-circle  mb-3"
					style="background-image: url(image/geon.jpg);"></a>
				<ul class="list-unstyled components ">
					<li><a href="admin.jsp">Home</a></li>
					<li><a href="addEmp.jsp" 
						>Add Emp</a></li>
					<li><a href="Edit.jsp">Edit Emp</a></li>
					<li><a href="Gross.jsp">Payslips</a></li>
					<li><a href="LogoutServlet">Signout</a></li>
				</ul>

				<div class="footer">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a
							href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
					</p>
				</div>

			</div>
		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-1 sticky-top">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid sticky-top">

					<button type="button" id="sidebarCollapse" class="btn btn-primary">
						<i class="fa fa-bars"></i> <span class="sr-only">Toggle
							Menu</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="LogoutServlet">Signout</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="container">
		 <form action="salaryCalculation" method="post">	
      <table class="table">
        <tr>
          <td
            class="bg-"
            style="text-align: center; background-color: rgb(172, 224, 248)"
            colspan="3"
          >
            <b> COST TO COMPANY(CTC) </b>
          </td>
        </tr>
        <tr>
          <td width="26%"><b>Name </b></td>
          <td colspan="2"><%=employee.getFullname() %></td>
        </tr>
        <tr>
          <td><b>Uan</b></td>
          <td colspan="2"><%=employee.getUan() %></td>
        </tr>
         <tr>
        <td >
            <b>CTC</b>
           
          </td>
          
          <td colspan="2"> <% 
			
			   out.print(session.getAttribute("constctc"));
			
			%>
          </td>
         
          
          
        </tr>
         <tr>
          <td style=" background-color: rgb(172, 224, 248);"><b>Monthly Gross/ Leaves</b></td>
          <td colspan="2">
         
          <input type="number" style=" width:25%; min="0"  border-color:black;" name="monthSAL"; placeholder="Monthly Gross"
           value="<%if(request.getAttribute("monthSAL")!=null) {
        	  out.print(request.getAttribute("monthSAL"));
          }
          %>">
          
          &nbsp;<input type="number" style=" width:25%; border-color:black;" min="0" name="leave";  placeholder="Enter Leaves" value="0">
          <button type="submit" formaction="salaryCalculation">submit</button>
         
         
          </td>
        </tr>
        
       
        <tr>
          <td style="background-color: rgb(172, 224, 248)">
            <b>Salary Components</b>
          </td>
          <td style="text-align: center; background-color: rgb(172, 224, 248)">
            <b>Annual</b>
          </td>
          <td style="text-align: center; background-color: rgb(172, 224, 248)">
            <b>Monthly</b>
          </td>
        </tr>
        <tr>
          <th>Basic</th>
          <td>
			 <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getBasic());
			} 
			%>
          </td>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getBasic()/12);
			} 
			%></td>
        </tr>
        <tr>
          <th>House Rent Allowance</th>
          <td>
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getHouseRentAllowance());
			} 
			%></td>
          <td>
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getBasic()/12);
			} 
			%></td>
        </tr>
        <tr>
          <th>Other Allowance</th>
          <td>
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getOtherAllowance());
			} 
			%></td>
          <td>
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getOtherAllowance()/12);
			} 
			%>
          </td>
        </tr>
        <tr>
          <td style="background-color: rgb(172, 224, 248)">
            <b>Total Gross Salary Components (A)</b>
          </td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalGrossSalaryComponentsA());
			} 
			%></td>
          <td style="background-color: rgb(172, 224, 248)">
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalGrossSalaryComponentsAMonth());
			} 
			%>
          </td>
        </tr>
        <tr>
          <th>Employer's Contribution to PF</th>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployersContributionToPF());
			} 
			%></td>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployeesContributionToPF()/12);
			} 
			%></td>
        </tr>
        <tr>
          <th>Employer's Contribution to ESI</th>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployersContributionToESI());
			} 
			%></td>
          <td>
           <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployersContributionToESI()/12);
			} 
			%></td>
        </tr>
        <tr>
          <td style="background-color: rgb(172, 224, 248)">
            <b>Total Components (B)</b>
          </td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalComponentsB());
			} 
			%></td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalComponentsB()/12);
			} 
			%></td>
        </tr>

        <tr>
          <td style="background-color: rgb(172, 224, 248)"><b>(A)- (B)</b></td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getAB());
			} 
			%></td>
          <td style="background-color: rgb(172, 224, 248)"><% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getAB()/12);
			} 
			%></td>
        </tr>
        <tr>
          <th>Employee's Contribution to PF</th>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployeesContributionToPF());
			} 
			%></td>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployeesContributionToPF()/12);
			} 
			%></td>
        </tr>
        <tr>
          <th>Employee's Contribution to ESI</th>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployeesContributionToESI());
			} 
			%></td>
          <td> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getEmployeesContributionToESI()/12);
			} 
			%></td>
        </tr>
        <tr>
          <td style="background-color: rgb(172, 224, 248)">
            <b>Total Deduction (C)</b>
          </td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalDeductionC());
			} 
			%></td>
          <td style="background-color: rgb(172, 224, 248)"><% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalDeductionC()/12);
			} 
			%></td>
        </tr>
        <tr>
          <td style="background-color: rgb(172, 224, 248)">
            <b>Total Net Salary (A) - (C)</b>
          </td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalNetSalaryAC());
			} 
			%></td>
          <td style="background-color: rgb(172, 224, 248)"> <% 
			if (ctcForm!=null) {
			   out.print(ctcForm.getTotalNetSalaryAC()/12);
			} 
			%></td>
        </tr>
        <tr>
          <td colspan="3">
            * As per the provision of EPF Act * Gratuity will be paid as per the
            Gratuity act 1972 * Taxes will be deducted in the net salary (as
            Applicable) as per Central/State/Local Governing Body from time to
            time. * The above pay structure /break-up can be modified by the
            management at any time
          </td>
        </tr>
        
        
      
      </table>
       <button type="submit" formaction="Payrollgen" class="btn btn-primary" style="margin-left:80%; background-color:DodgerBlue;">Submit</button>
        </form>
        
      <a href="Gross.jsp" class="btn btn-primary">Back</a>
     
      
    </div>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
		
</html>			