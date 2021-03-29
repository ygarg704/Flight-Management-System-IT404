import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
    	
    	Statement stmt = null;
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
			stmt = con.createStatement();
			
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
		
	        PrintWriter out = response.getWriter();
	    
	        Boolean login = false;
	        
	        Statement stmt = null;
	        try {
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng", "root", "");
    			System.out.println("Connected database successfully...");
    			stmt = con.createStatement();
    			
    			String selector = "SELECT * FROM RegForm";
    			String loginemail = request.getParameter("email");
    			String loginpass = request.getParameter("password");
    			ResultSet rs = stmt.executeQuery(selector);
			    
			    while(rs.next()){
			    	String email_id  = rs.getString("email");
			    	String pass = rs.getString("password");
		            String f_name = rs.getString("FirstName");
	    			String l_name = rs.getString("LastName");
			    	
			    	if(email_id.equals(loginemail) && pass.equals(loginpass)){
			            login = true;
			            RequestDispatcher rd = request.getRequestDispatcher("/UserDash.jsp");
		                rd.forward(request, response);
			    		break;
			    	} else {
			    		login = false;
			    		RequestDispatcher rd = request.getRequestDispatcher("/Login.html");
		                rd.forward(request, response);
			    	}
			    }
    		} catch (Exception e) {
    			System.out.println(e);
    		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
