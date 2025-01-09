<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader, java.io.FileReader, java.io.IOException, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Reservations - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #800000; 
            margin: 0;
            padding: 0;
            text-align: center;
        }
        header {
            width: 100%;
            background-color: #ffffff;
            color: #800000; 
            display: flex;
            align-items: center;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-bottom: 10px solid #800000; 
        }
        header img {
            width: 100px;
            height: auto;
            margin-right: 20px;
        }
        header div {
            text-align: left;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        header h3 {
            margin: 0;
            font-size: 16px;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #800000; 
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: #800000; 
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            color: #b30000; 
        }
    </style>
</head>
<body>
    <header>
        <img src="https://www.logolynx.com/images/logolynx/6b/6bd71bbc4dc9b9bf31b6ae3eec13ab7a.png" alt="PUP-Taguig Logo">
        <div>
            <h1>Polytechnic University of the Philippines</h1>
            <h3>Taguig Campus</h3>
        </div>
    </header>

    <%

        List<String[]> reservations = new ArrayList<>();
        String line;
        try (BufferedReader reader = new BufferedReader(new FileReader(application.getRealPath("reservations.txt")))) {
            while ((line = reader.readLine()) != null) {
                reservations.add(line.split(","));
            }
        } catch (IOException e) {
            e.printStackTrace();
            out.println("<p>Error reading reservations: " + e.getMessage() + "</p>");
            return;
        }
    %>

    <h1>View Reservations</h1>
    <a href="adminDashboard.jsp">Back to Dashboard</a><br><br>

    <table>
        <thead>
            <tr>
                <th>Requestor</th>
                <th>Contact Number</th>
                <th>Organization</th>
                <th>Date of Request</th>
                <th>Title of Activity</th>
                <th>Date of Event</th>
                <th>Time of Event</th>
                <th>Time of Preparation</th>
                <th>Participants</th>
                <th>Venue</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < reservations.size(); i++) {
                    String[] reservation = reservations.get(i);
            %>
            <tr>
                <td><%= reservation[0] %></td>
                <td><%= reservation[1] %></td>
                <td><%= reservation[2] %></td>
                <td><%= reservation[3] %></td>
                <td><%= reservation[4] %></td>
                <td><%= reservation[5] %></td>
                <td><%= reservation[6] %></td>
                <td><%= reservation[7] %></td>
                <td><%= reservation[8] %></td>
                <td><%= reservation[9] %></td>
                <td>
                    <a href="editReservation.jsp?index=<%= i %>">Edit</a> |
                    <a href="deleteReservation.jsp?index=<%= i %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
