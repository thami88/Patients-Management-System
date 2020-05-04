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

}
