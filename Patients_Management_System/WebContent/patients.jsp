<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.Patient"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patients Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/patients.js"></script>
</head>
<body>


	<!-- ------------------------ Navbar---------------------------------- -->
	
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
				<li class="nav-item active"><a class="nav-link" href="#">Patients
						Management<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<!-- Links -->
		</div>
		<!-- Collapsible content -->
	</nav>

	<!-- ---------------------------- End of Nav ----------------------------- -->


<!-- ------------------- Form to Add Details------------------ -->

	<div class="container">
	<div class="row">
	<div class="col-6">
		<h1>Patients Management</h1>
		
		<form id="formPatient" name="formPatient">
		
			Patient NIC: <input id="pNic" name="pNic" type="text" class="form-control form-control-sm"><br>
			Patient Name: <input id="pName" name="pName" type="text" class="form-control form-control-sm"><br>
			Patient Address: <input id="pAddress" name="pAddress" type="text" class="form-control form-control-sm"><br>
			Patient Email: <input id="pEmail" name="pEmail" type="text" class="form-control form-control-sm"><br>
			Patient Telephone: <input id="pTele" name="pTele" type="text" class="form-control form-control-sm"><br>
			Patient Age: <input id="pAge" name="pAge" type="text" class="form-control form-control-sm"><br>
			Patient Status: <input id="pStatus" name="pStatus" type="text" class="form-control form-control-sm"><br>
			Patient Allergic: <input id="pAllergic" name="pAllergic" type="text" class="form-control form-control-sm"><br>
			Patient Ward: <input id="pWard" name="pWard" type="text" class="form-control form-control-sm"><br>
			Patient Bed: <input id="pBed" name="pBed" type="text" class="form-control form-control-sm"><br>
		
			<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
			<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave"  value="">
		
		</form>
		
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div><br>
		
		<div id="divPatientsGrid">
			<%
				Patient patientObj = new Patient();
				out.print(patientObj.readPatients()); 
			%>
		</div>
		
	</div> <!-- End of Column -->
	</div> <!-- End of Row -->
	</div> <!-- End of Container -->
	
	<!-- ----------------------------------- End of Form -------------------------------- -->
	
	<!-- --------------------------- Footer -------------------------- -->
		<footer class="page-footer font-small special-color-dark pt-4">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">Items Management</div>
		<!-- Copyright -->

	</footer>
	<!-- ------------------------- End of Footer --------------------- -->

</body>
</html>