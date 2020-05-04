package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PatientsAPI
 */
@WebServlet("/PatientsAPI")
public class PatientsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Patient patientObj = new Patient();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientsAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String output = patientObj.insertPatient(request.getParameter("pNic"), request.getParameter("pName"), request.getParameter("pAddress"), request.getParameter("pEmail"), request.getParameter("pTele"), request.getParameter("pAge"), request.getParameter("pStatus"), request.getParameter("pAllergic"), request.getParameter("pWard"), request.getParameter("pBed"));
		response.getWriter().write(output);
		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		
		String output = patientObj.updatePatient(paras.get("hidPatientIDSave").toString(), paras.get("pNic").toString(), paras.get("pName").toString(), paras.get("pAddress").toString(), paras.get("pEmail").toString(), paras.get("pTele").toString(), paras.get("pAge").toString(), paras.get("pStatus").toString(), paras.get("pAllergic").toString(), paras.get("pWard").toString(), paras.get("pBed").toString());
		
		response.getWriter().write(output);
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			
			scanner.close();
			
			String[] params = queryString.split("%");
			
			for (String param : params) {
				
				String[] p = param.split("=");
				map.put(p[0], p[1]);
				
			}
			
			
		} catch (Exception e) {
			// Handle exception
		}
		
		return map;
	}

}
