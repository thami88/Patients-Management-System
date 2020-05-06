<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.Patient"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patients Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.0/css/mdb.min.css" rel="stylesheet">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/patients.js"></script>
</head>
<body>


	<!-- ------------------------ Navigation Bar ---------------------------------- -->
	
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark special-color-dark">
		<!-- Collapse button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#basicExampleNav" aria-controls="basicExampleNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Collapsible content -->
		<div class="collapse navbar-collapse" id="basicExampleNav">

			<!-- Links -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="#">Home </a></li>
				<li class="nav-item active"><a class="nav-link" href="#">Patients Management<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<!-- Links -->
		</div>
		<!-- Collapsible content -->
	</nav><br>

	<!-- ---------------------------- End of Navigation Bar ----------------------------- -->


	<div class="container-fluid">
	
	<!-- ---------------------------- Start of Jumborone ----------------------------- -->
			<div class="row">
			<div class="col">
				<div class="jumbotron card card-image mt-5"
					style="background-image: url(https://mdbootstrap.com/img/Photos/Others/gradient1.jpg);">
					<div class="text-white text-center py-5 px-4">
						<div>
							<h2 class="card-title h1-responsive pt-3 mb-5 font-bold">
								<strong>Patients Management</strong>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		
   	<!-- ---------------------------- End of Jumborone ----------------------------- -->
   	
   	<!-- ------------------- Form to Add Details ------------------ -->
	
	<div class="container">
	<div class="row">
	<div class="col">
		
		<form id="formPatient" name="formPatient" class="text-center border border-light p-5">
		
				<p class="h4 mb-4">Add / Update Patients</p>
				
		     <div class="d-flex justify-content-center">
			 	<input id="pNic" name="pNic" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient NIC:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pName" name="pName" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Name:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pAddress" name="pAddress" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Address:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pEmail" name="pEmail" type="email" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Email:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pTele" name="pTele" type="tel" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Telephone:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pAge" name="pAge" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Age:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pStatus" name="pStatus" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Status:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pAllergic" name="pAllergic" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Allergic:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pWard" name="pWard" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Ward:"></div><br>
			 <div class="d-flex justify-content-center">
			 	<input id="pBed" name="pBed" type="text" class="form-control form-control-sm" style="width: 300px;" placeholder="Patient Bed:"></div><br>
		
			<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-dark-green">
			<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave"  value="">
		
		</form><br>
		
		<!-- ----------------------------------- End of Form -------------------------------- -->
		
			
		<!-- ----------------------------------- success & Error alert -------------------------------- -->
		
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div><br>
		
		<!-- ----------------------------------- End of success & Error alert -------------------------------- -->
		
	</div> <!-- End of Column -->
	</div> <!-- End of Row -->
	</div> <!-- End of Form Container -->
	</div> <!-- End of Fluid Container -->
	
	<!-- ----------------------------------- Table -------------------------------- -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
			
			<p class="h4 text-center mb-4">Manage Patients</p>
		
		<div id="divPatientsGrid">
			<%
				Patient patientObj = new Patient();
				out.print(patientObj.readPatients()); 
			%>
		</div>
		
		</div> <!-- End of Column -->
		</div> <!-- End of 2nd Row -->
		</div> <!-- End of Table Container -->
		

	
	<!-- ----------------------------------- End of Table -------------------------------- -->
	
	<!-- --------------------------- Footer -------------------------- -->
		<footer class="page-footer font-small special-color-dark pt-4">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">Patients Management</div>
		<!-- Copyright -->

	</footer>
	<!-- ------------------------- End of Footer --------------------- -->

</body>
</html>