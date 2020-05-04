$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

//SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validatePatientForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax({
		
		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status){
			
			onPatientSaveComplete(response.responseText, status); 
			
		}
		
	});
	
});

function onPatientSaveComplete(response, status){
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			
			$("#divItemsGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show(); 

		}
		
	} else if (status == "error") {
		
		$("#alertError").text("Error while saving.");
		$("#alertError").show();

	} else {
		
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show(); 
		
	}
	
	$("#hidPatientIDSave").val("");
	$("#formPatient")[0].reset(); 
	
}

// UPDATE=======================================================================================
$(document).on("click", ".btnUpdate", function(event) 
		{
			$("#hidPatientIDSave").val($(this).closest("tr").find('#hidPatientIDUpdate').val());
			$("#pNic").val($(this).closest("tr").find('td:eq(0)').text());
			$("#pName").val($(this).closest("tr").find('td:eq(1)').text());
			$("#pAddress").val($(this).closest("tr").find('td:eq(2)').text());
			$("#pEmail").val($(this).closest("tr").find('td:eq(3)').text());
			$("#pTele").val($(this).closest("tr").find('td:eq(4)').text());
			$("#pAge").val($(this).closest("tr").find('td:eq(5)').text());
			$("#pStatus").val($(this).closest("tr").find('td:eq(6)').text());
			$("#pAllergic").val($(this).closest("tr").find('td:eq(7)').text());
			$("#pWard").val($(this).closest("tr").find('td:eq(8)').text());
			$("#pBed").val($(this).closest("tr").find('td:eq(9)').text());
		});

// DELETE========================================================================================
$(document).on("click", ".btnRemove", function(event){
	
	$.ajax({
		
		url : "PatientsAPI",
		type : "DELETE",
		data : "pID=" + $(this).data("pid"),
		dataType : "text",
		complete : function(response, status){
			
			onPatientDeleteComplete(response.responseText, status); 
			
		}
		
	});
	
});

function onPatientDeleteComplete(response, status){
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
			
			$("#divPatientsGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show(); 

		}
		
	} else if (status == "error") {
		
		$("#alertError").text("Error while Deleting.");
		$("#alertError").show();

	} else {
		
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show(); 
		
	}
	
}