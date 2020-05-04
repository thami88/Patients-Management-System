package com;

import java.sql.*; 

public class Patient {
	
	// Method to Connect Database /------------------------------------------------------------
	
	private Connection connect() {
		
		Connection con = null; 
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost/patient_management", "root", "");
			
		} catch (Exception e) {
			// Handle exception
			e.printStackTrace();
		}
		
		return con;
		
	} // End of DB Connection method /---------------------------------------------------------------------
	
	// Read Method /---------------------------------------------------------------------------------------
	
	public String readPatients() {
		
		String output = "";
		
		try {
			
			Connection con = connect();
			
			if (con == null) {
				
				return "Error while connecting to the database for reading";
				
			}
			
			//  Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Patient ID</th><th>Patient NIC</th><th>Patient Name</th><th>Patient Address</th>"
					+ "<th>Patient Email</th><th>Patient Telephone</th><th>Patient Age</th><th>Patient Status</th>"
					+ "<th>Patient Allergic</th><th>Patient Ward</th><th>Patient Bed</th> <th>Update</th><th>Remove</th></tr>";
			
			String query = "select * from patients";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			// Iterate through the rows in the result set
			while (rs.next()) {
				
				 String pID = Integer.toString(rs.getInt("pID"));
				 String pNic = rs.getString("pNic");
				 String pName = rs.getString("pName");
				 String pAddress = rs.getString("pAddress");
				 String pEmail = rs.getString("pEmail");
				 String pTele = rs.getString("pTele");
				 String pAge = Integer.toString(rs.getInt("pAge"));
				 String pStatus = rs.getString("pStatus");
				 String pAllergic = rs.getString("pAllergic");
				 String pWard = rs.getString("pWard");
				 String pBed = Integer.toString(rs.getInt("pBed"));
				
				// Add into the html table
				output += "<tr><td><input id='hidItemIDUpdate' name='hidItemIDUpdate' type='hidden' value='" + pID + "'>" + pNic + "</td>";
				 output += "<td>" + pName + "</td>";
				 output += "<td>" + pAddress + "</td>";
				 output += "<td>" + pEmail + "</td>";
				 output += "<td>" + pTele + "</td>";
				 output += "<td>" + pAge + "</td>";
				 output += "<td>" + pStatus + "</td>";
				 output += "<td>" + pAllergic + "</td>";
				 output += "<td>" + pWard + "</td>";
				 output += "<td>" + pBed + "</td>"; 
				
				// Update Delete Buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td><td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-itemid='" + pID + "'>" + "</td></tr>"; 
				
			}
			
			con.close();
			
			// Complete the html table
			output += "</table>";
			
			
		} catch (Exception e) {
			
			// Handle exception
			output = "Error while reading the patients.";
			System.err.println(e.getMessage());
			
		}
		
		return output;
		
	} // End of Read Method /-----------------------------------------------------------------------------
	
	// Insert Method /------------------------------------------------------------------------------------
	
	public String insertPatient(String nic, String name, String address, String email, String tele, String age, String status, String allergic, String ward, String bed) {
		
		String output = "";
		
		try {
			
			Connection con = connect();
			
			if (con == null) {
				
				return "Error while connecting to the database for Inserting.";
				
			}
			
			// Create a prepared statement
			String query = " insert into patients (`pID`,`pNic`,`pName`,`pAddress`,`pEmail`,`pTele`,`pAge`,`pStatus`,`pAllergic`,`pWard`,`pBed`)" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// Binding Values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, nic);
			preparedStmt.setString(3, name);
			preparedStmt.setString(4, address);
			preparedStmt.setString(5, email);
			preparedStmt.setString(6, tele);
			preparedStmt.setInt(7, Integer.parseInt(age));
			preparedStmt.setString(8, status);
			preparedStmt.setString(9, allergic);
			preparedStmt.setString(10, ward);
			preparedStmt.setInt(11, Integer.parseInt(bed));
			
			// Execute the statement
			preparedStmt.execute();
			con.close();
			
			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";
			
		} catch (Exception e) {
			
			// Handle exception
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Patient.\"}";
			
			System.err.println(e.getMessage());
		}
		
		return output;
		
	} // End of Insert Method /------------------------------------------------------------------------
	
	// Update Method /---------------------------------------------------------------------------------
	
	public String updatePatient(String ID, String nic, String name, String address, String email, String tele, String age, String status, String allergic, String ward, String bed) {
		
		String output = "";
		
		try {
			
			Connection con = connect();
			
			if (con == null) {
				
				return "Error while connecting to the database for Updating.";
				
			}
			
			// Create a prepared statement
			String query = "UPDATE patients SET pNic=?,pName=?,pAddress=?,pEmail=?,pTele=?,pAge=?,pStatus=?,pAllergic=?,pWard=?,pBed=? WHERE pID=?";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// Binding Values
			preparedStmt.setString(1, nic);
			preparedStmt.setString(2, name);
			preparedStmt.setString(3, address);
			preparedStmt.setString(4, email);
			preparedStmt.setString(5, tele);
			preparedStmt.setInt(6, Integer.parseInt(age));
			preparedStmt.setString(7, status);
			preparedStmt.setString(8, allergic);
			preparedStmt.setString(9, ward);
			preparedStmt.setInt(10, Integer.parseInt(bed));
			preparedStmt.setInt(11, Integer.parseInt(ID));
			
			// Execute the statement
			preparedStmt.execute();
			con.close();
			
			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";
			
		} catch (Exception e) {
			
			// Handle exception
			output = "{\"status\":\"error\", \"data\": \"Error while updating the Patient.\"}"; 
			System.err.println(e.getMessage());
		}
		
		return output;
		
	} // End of the Update Method /---------------------------------------------------------------------
	
	
	// Delete Method /----------------------------------------------------------------------------------
	
	public String deletePatient(String pID) {
		
		String output = "";
		
		try {
			
			Connection con = connect();
			
			if (con == null) {
				
				return "Error while connecting to the database for Deleting.";
				
			}
			
			// Create a Prepared Statement
			String query = "delete from patients where pID=?";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// Binding Values
			preparedStmt.setInt(1, Integer.parseInt(pID));
			
			// Execute the Statement
			preparedStmt.execute();
			con.close();
			
			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";
			
			
		} catch (Exception e) {
			
			// Handle exception
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the Patient.\"}"; 
			System.err.println(e.getMessage());
		}
		
		return output;
		
	}

}
