package com.allservlets;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/availableflights")
public class AvailableFlightsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            // Read the JSON data from the request body
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            // Parse the JSON data
            JSONObject jsonData;
			try {
				
				// Retrieve data from JSON object
				
				jsonData = new JSONObject(sb.toString());
				 String selectedTravelClass = jsonData.getString("selectedTravelClass");
		         String leavingFrom = jsonData.getString("leavingFrom");
		         String whereTo = jsonData.getString("whereTo");
		         String travelDate = jsonData.getString("travelDate");
		         String numTravelers = jsonData.getString("numTravelers");
			

		        // JDBC parameters
		        String url = "jdbc:mysql://localhost:3306/katikuDB";
		        String username = "prog";
		        String password = "netsh";
		
		        try {
		            // Load MySQL JDBC Driver
		            Class.forName("com.mysql.cj.jdbc.Driver");
		
		            // Connect to the database
		            Connection connection = DriverManager.getConnection(url, username, password);
		
		            // Prepare SQL statement
		            String sql = "SELECT "
		                    + "    Flights.FlightNumber,"
		                    + "    Airlines.AirlineName AS Airline,"
		                    + "    Airlines.Logo,"
		                    + "    DepartureAirport.airport_name AS DepartureAirportName,"
		                    + "    DepartureAirport.City AS DepartureCity,"
		                    + "    DepartureAirport.Country AS DepartureCountry,"
		                    + "    ArrivalAirport.airport_name AS ArrivalAirportName,"
		                    + "    ArrivalAirport.City AS ArrivalCity,"
		                    + "    ArrivalAirport.Country AS ArrivalCountry,"
		                    + "    Flights.DepartureTime,"
		                    + "    Flights.ArrivalTime,"
		                    + "    FlightClasses.ClassName AS FlightClass,"
		                    + "    Flights.Price "
		                    + "FROM "
		                    + "    Flights "
		                    + "JOIN "
		                    + "    Airports AS DepartureAirport ON Flights.DepartureAirportCode = DepartureAirport.AirportCode "
		                    + "JOIN "
		                    + "    Airports AS ArrivalAirport ON Flights.ArrivalAirportCode = ArrivalAirport.AirportCode "
		                    + "JOIN "
		                    + "    Airlines ON Flights.AirlineCode = Airlines.AirlineCode "
		                    + "JOIN "
		                    + "    FlightClasses ON Flights.ClassID = FlightClasses.ClassID "
		                    + "WHERE "
		                    + "    DepartureAirport.City = ? "
		                    + "    AND ArrivalAirport.City = ? "
		                    + "    AND Flights.DepartureTime >= ? "
		                    + "    AND FlightClasses.ClassName = ? "
		                    + "ORDER BY "
		                    + "    Flights.DepartureTime;";
		
		            
		            PreparedStatement statement = connection.prepareStatement(sql);
		            statement.setString(1, leavingFrom);
		            statement.setString(2, whereTo);
		            statement.setString(3, travelDate);
		            statement.setString(4, selectedTravelClass);
		            
		            
		
		            // Execute query
		            ResultSet resultSet = statement.executeQuery();
		
		            // Forward the result set to a JSP
		            request.setAttribute("flightsResultSet", resultSet);
		            
		            // Set requested parameters as attributes in the request
		            request.setAttribute("selectedTravelClass", selectedTravelClass);
		            request.setAttribute("leavingFrom", leavingFrom);
		            request.setAttribute("whereTo", whereTo);
		            request.setAttribute("travelDate", travelDate);
		            request.setAttribute("numTravelers", numTravelers);
		            
		            
		            RequestDispatcher dispatcher = request.getRequestDispatcher("displayflights.jsp");
		            dispatcher.forward(request, response);
		
		            // Close resources
		            resultSet.close();
		            statement.close();
		            connection.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		            // Handle exceptions
		            // You may want to redirect to an error page or display an error message
	        }} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}