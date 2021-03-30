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
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Servlet implementation class AddFlight
 */
@WebServlet("/AddFlight")
public class AddFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFlight() {
    	Statement stmt = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
			
			stmt = con.createStatement();

			String sql1 = "CREATE TABLE IF NOT EXISTS flightdata(Airlines VARCHAR(100),Code VARCHAR(10),Departure VARCHAR(100),Arrival VARCHAR(50),Seats INT(50),Charges INT(100))"; 

			stmt.executeUpdate(sql1);
			System.out.println("Created table in given database...");
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
		String aname = request.getParameter("aname");
        String acode = request.getParameter("acode");
        String dep = request.getParameter("dep");
        String arr = request.getParameter("arr");
        String seat = request.getParameter("seat");
        String chrg = request.getParameter("chrg");
        int id = 0;
        
        
        Statement stmt = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_mng","root","");
			System.out.println("Connected database successfully...");
			
			stmt = con.createStatement();
			String sql = "select * from flightdata";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				id = rs.getInt("ID") + 1;
			}
			
			PreparedStatement insertstm = con.prepareStatement("insert into flightdata VALUES (?,?,?,?,?,?,?)");  
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));  
		    
			insertstm.setInt(1, id);
	    	insertstm.setString(2, aname);
	    	insertstm.setString(3, acode);
	    	insertstm.setString(4, dep);
	    	insertstm.setString(5, arr);
	    	insertstm.setString(6, seat);
	    	insertstm.setString(7, chrg);
			int i = insertstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
        System.out.println("Successfully Added!");
        RequestDispatcher rd = request.getRequestDispatcher("/AdminDash.html");
        rd.forward(request, response);
	}

}
