package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java. sql.*;
/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig // it is important for telling the jvm which is running this servlet that there are manyfiles like image,text, audio etc.
public class RegisterServlet extends HttpServlet   {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String email = request.getParameter("user_email");
		Part img = request.getPart("image");  // part is for file other than text or string
	    String fileName = img.getSubmittedFileName();
	    PrintWriter out = response.getWriter();
		
		
		//connection to jdbc
		
			 try{
				 Thread.sleep(2000);
				 Class.forName("oracle.jdbc.driver.OracleDriver");  
			 Connection con=DriverManager.getConnection(	"jdbc:oracle:thin:@localhost:1521:xe","ORACLETYAGI","sunraj");
			 String q = "insert into user_table values(?,?,?,?)";
			 PreparedStatement ps = con.prepareStatement(q);
			 ps.setString(1,name);
			 ps.setString(2,password);
			 ps.setString(3,email);
			 ps.setString(4, fileName);
		     ps.executeUpdate();
			 out.println("Done");
			 out.println(fileName);
			 }
			 catch(Exception e){
				e.printStackTrace();
			 }	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}

}
