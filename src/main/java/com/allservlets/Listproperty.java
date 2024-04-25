package com.allservlets;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/Listproperty")
@MultipartConfig
public class Listproperty extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomName = request.getParameter("roomName");
        String numberOfRooms = request.getParameter("numberOfRooms");
        String locationName = request.getParameter("locationName");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");

        Part image1=request.getPart("image1");
        Part image2=request.getPart("image2");
        Part image3=request.getPart("image3");
        
        String image1FileName = image1.getSubmittedFileName();
        String image2FileName = image2.getSubmittedFileName();
        String image3FileName = image3.getSubmittedFileName();
        
        System.out.println(image1FileName);
        
        
        
        String uploadPath1 = "/home/bigpoppa/Documents/katiku_project/src/main/webapp/images/" + image1FileName;
        String uploadPath2 = "/home/bigpoppa/Documents/katiku_project/src/main/webapp/images/" + image2FileName;
        String uploadPath3 = "/home/bigpoppa/Documents/katiku_project/src/main/webapp/images/" + image3FileName;
     
        System.out.println(uploadPath1);
        
        FileOutputStream fos = new FileOutputStream(uploadPath1);
        InputStream is=image1.getInputStream();
        
        byte[] data = new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();
        
        FileOutputStream fos2 = new FileOutputStream(uploadPath2);
        InputStream is2=image2.getInputStream();
        
        byte[] data2 = new byte[is2.available()];
        is2.read(data2);
        fos2.write(data2);
        fos2.close();
        
        FileOutputStream fos3 = new FileOutputStream(uploadPath3);
        InputStream is3=image3.getInputStream();
        
        byte[] data3 = new byte[is3.available()];
        is3.read(data3);
        fos3.write(data3);
        fos3.close();
        
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/katikuDB";
        String username = "prog";
        String password = "netsh";
        
        // Assuming your JDBC connection details
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			PreparedStatement insertRoomStmt;
			String insertRoomQuery = "INSERT INTO Rooms (room_name, number_of_rooms, location_name, price, description, image1, image2, image3) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
			
			insertRoomStmt = connection.prepareStatement(insertRoomQuery);
			
			insertRoomStmt.setString(1, roomName);
            insertRoomStmt.setString(2, numberOfRooms);
            insertRoomStmt.setString(3, locationName);
            insertRoomStmt.setInt(4, price);
            insertRoomStmt.setString(5, description);
            insertRoomStmt.setString(6, image1FileName);
            insertRoomStmt.setString(7, image2FileName);
            insertRoomStmt.setString(8, image3FileName);
            
            int row = insertRoomStmt.executeUpdate();
            
            if(row>0) {
            	System.out.println("Property listed successfully");
            }else {
            	System.out.println("Failed to upload the property");
            }
            
            connection.close();
            
            
            request.setAttribute("roomname", roomName);
            request.setAttribute("numberOfRooms", numberOfRooms);
            request.setAttribute("locationName", locationName);
            request.setAttribute("price", price);
            request.setAttribute("description", description);
            request.setAttribute("image1FileName", image1FileName);
            request.setAttribute("image2FileName", image2FileName);
            request.setAttribute("image3FileName", image3FileName);
            
            RequestDispatcher rd = request.getRequestDispatcher("property_details.jsp");
            rd.forward(request, response);
            
        
			
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        
        
        

    }

}

