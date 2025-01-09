<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedWriter, java.nio.file.Files, java.nio.file.Path, java.nio.file.Paths, java.nio.file.StandardOpenOption, java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Reservation</title>
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
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .back-button {
            float: left;
            color: #800000;
            text-decoration: none;
            background-color: #ffffff;
            padding: 10px;
            border: 1px solid #800000;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .back-button:hover {
            background-color: #f4f4f4;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #800000; 
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #b30000; 
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
    <div class="container">
        <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
        <h1>Add Reservation</h1>

        <form action="addReservationAdmin.jsp" method="post">
            <label for="requestor">Name of Requestor:</label>
            <input type="text" id="requestor" name="requestor" required><br><br>

            <label for="contact">Contact Number:</label>
            <input type="text" id="contact" name="contact" required><br><br>

            <label for="organization">Organization:</label>
            <select id="organization" name="organization" required>
                <option value="" disabled selected>Select your organization</option>
                <option value="Central Student Council">Central Student Council</option>
                <option value="AECES">AECES</option>
                <option value="CS">CS</option>
                <option value="JPMAP">JPMAP</option>
                <option value="JMA">JMA</option>
                <option value="JPIA">JPIA</option>
                <option value="MS">MS</option>
                <option value="PASOA">PASOA</option>
                <option value="PSME">PSME</option>
                <option value="BYP">BYP</option>
                <option value="ERG">ERG</option>
                <option value="IROCK">IROCK</option>
                <option value="PUPUKAW">PUPUKAW</option>
                <option value="REC">REC</option>
            </select><br><br>

            <label for="dateOfRequest">Date of Request:</label>
            <input type="date" id="dateOfRequest" name="dateOfRequest" required><br><br>

            <label for="title">Title of Activity:</label>
            <input type="text" id="title" name="title" required><br><br>

            <label for="dateOfEvent">Date of Event:</label>
            <input type="date" id="dateOfEvent" name="dateOfEvent" required><br><br>

            <label for="timeOfEvent">Time of Event:</label>
            <input type="time" id="timeOfEvent" name="timeOfEvent" required><br><br>

            <label for="timeOfPreparation">Time of Preparation:</label>
            <input type="time" id="timeOfPreparation" name="timeOfPreparation" required><br><br>

            <label for="participants">Expected Number of Participants:</label>
            <input type="number" id="participants" name="participants" required><br><br>

            <label for="venue">Target Venue:</label>
            <input type="text" id="venue" name="venue" required><br><br>

            <input type="submit" value="Add Reservation">
        </form>

        <%
            String requestor = request.getParameter("requestor");
            String contact = request.getParameter("contact");
            String organization = request.getParameter("organization");
            String dateOfRequest = request.getParameter("dateOfRequest");
            String title = request.getParameter("title");
            String dateOfEvent = request.getParameter("dateOfEvent");
            String timeOfEvent = request.getParameter("timeOfEvent");
            String timeOfPreparation = request.getParameter("timeOfPreparation");
            String participants = request.getParameter("participants");
            String venue = request.getParameter("venue");

            if (requestor != null && contact != null && organization != null && dateOfRequest != null &&
                title != null && dateOfEvent != null && timeOfEvent != null && timeOfPreparation != null &&
                participants != null && venue != null) {

                if (!contact.matches("\\d{11}")) {
                    out.println("<p>Contact number must be exactly 11 digits long and contain only numbers.</p>");
                } else {
                    Path filePath = Paths.get(application.getRealPath("reservations.txt"));
                    try (BufferedWriter writer = Files.newBufferedWriter(filePath, StandardOpenOption.APPEND, StandardOpenOption.CREATE)) {
                        writer.write(requestor + "," + contact + "," + organization + "," + dateOfRequest + "," +
                                     title + "," + dateOfEvent + "," + timeOfEvent + "," + timeOfPreparation + "," +
                                     participants + "," + venue);
                        writer.newLine();
                        response.sendRedirect("adminDashboard.jsp");
                    } catch (IOException e) {
                        e.printStackTrace();
                        out.println("<p>Error adding reservation: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
    </div>
</body>
</html>
