import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import java.io.BufferedReader; 
import java.io.IOException; 
import java.io.InputStreamReader;

/**
 * Servlet implementation class Example
 */
@WebServlet("/Example")
public class Example extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Example() {
        // TODO Auto-generated constructor stub
        Statement stmt = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
			
			stmt = con.createStatement();

			String sql1 = "CREATE TABLE IF NOT EXISTS RegForm(FirstName VARCHAR(30),LastName VARCHAR(30),Email VARCHAR(60),Password VARCHAR(50))"; 

			stmt.executeUpdate(sql1);
			System.out.println("Created table in given database...");
		} catch (Exception e) {
			System.out.println(e);
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Boolean login = false;
        
       /* if(loginemail == "") {
        	System.out.println("Email: " + email);
            System.out.println("Password: " + password);
     
            PrintWriter writer = response.getWriter();

            String htmlRespone = "<html>";
            htmlRespone += "<h2>Your Name is: " + fname + " " + lname  + "<br/>";       
            htmlRespone += "</html>";
            
            Statement stmt = null;
            
            try {
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng", "root", "");
    			System.out.println("Connected database successfully...");
    			
    			stmt = con.createStatement();
    			
    			String selector = "SELECT email, password FROM RegForm";
			    ResultSet rs = stmt.executeQuery(selector);
			    
			    while(rs.next()){
			    	String email_id  = rs.getString("email");
			    	String pass = rs.getString("password");
			    	
			    	if(email_id.equals(loginemail) && pass.equals(loginpass)){
			    		System.out.println("Logged in with user: " + loginemail); 
			    		login = true;
			    		break;
			    	} else {
			    		login = false;
			    	}
			    }
    		} catch (Exception e) {
    			System.out.println(e);
    		}
             
    		
        } else { */
        	Statement stmt = null;
            
            try {
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
    			System.out.println("Connected database successfully...");
    			
    			stmt = con.createStatement();
    			
    			PreparedStatement insertstm = con.prepareStatement("insert into RegForm VALUES (?,?,?,?)");  
    			
    			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));  
    		    
    	    	insertstm.setString(1, fname);
    	    	insertstm.setString(2, lname);
    	    	insertstm.setString(3, email);
    	    	insertstm.setString(4, password);
    			int i = insertstm.executeUpdate();
    		} catch (Exception e) {
    			System.out.println(e);
    		}
            System.out.println("Successfully Registered!");
            RequestDispatcher rd = request.getRequestDispatcher("/Login.html");
            rd.forward(request, response);
         
	}

}
