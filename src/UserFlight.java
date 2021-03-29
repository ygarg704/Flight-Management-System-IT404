

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserFlight
 */
@WebServlet("/UserFlight")
public class UserFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFlight() {
    	Statement stmt = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
		} catch (Exception e) {
			System.out.println(e);
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = 	request.getParameter("fname");
        String lname = 	request.getParameter("lname");
        String mail = 	request.getParameter("mail");
        String numb = 	request.getParameter("numb");
        String aname = 	request.getParameter("aname");
        String dep = 	request.getParameter("dep");
        String arr = 	request.getParameter("arr");
        String peeps = 	request.getParameter("peeps");
        
        Statement stmt = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
			
			stmt = con.createStatement();
			
			PreparedStatement insertstm = con.prepareStatement("insert into bookings VALUES (?,?,?,?,?,?,?,?)");  
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));  
		    
	    	insertstm.setString(1, fname);
	    	insertstm.setString(2, lname);
	    	insertstm.setString(3, mail);
	    	insertstm.setString(4, numb);
	    	insertstm.setString(5, aname);
	    	insertstm.setString(6, dep);
	    	insertstm.setString(7, arr);
	    	insertstm.setString(8, peeps);
			int i = insertstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
        System.out.println("Successfully Added!");
        RequestDispatcher rd = request.getRequestDispatcher("/UserDash.jsp");
        rd.forward(request, response);
	}
}

