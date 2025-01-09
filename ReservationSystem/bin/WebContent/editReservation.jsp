<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader, java.io.BufferedWriter, java.io.FileReader, java.io.IOException, java.nio.file.Files, java.nio.file.Path, java.nio.file.Paths, java.nio.file.StandardOpenOption, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; 
            margin: 0;
            padding: 0;
            color: #800000; 
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
        main {
            background: #ffffff; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 20px;
            width: 80%;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        main h1 {
            color: #800000; 
            margin: 0;
            padding: 0;
            font-size: 24px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #800000; 
            color: #ffffff; 
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.2s, transform 0.2s;
        }
        a:hover {
            background-color: #b30000; 
            transform: scale(1.1);
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #800000; 
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #800000; 
            color: #ffffff; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        input[type="submit"]:hover {
            background-color: #b30000; 
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
    <main>
        <h1>Edit Reservation</h1>
        <a href="viewReservationsAdmin.jsp">Back to View Reservations</a><br><br>

        <%
            int index = Integer.parseInt(request.getParameter("index"));
            List<String[]> reservations = new ArrayList<>();
            String line;

            try (BufferedReader reader = new BufferedReader(new FileReader(application.getRealPath("reservations.txt")))) {
                while ((line = reader.readLine()) != null) {
                    reservations.add(line.split(","));
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            String[] reservation = reservations.get(index);
        %>

        <form action="editReservation.jsp" method="post">
            <input type="hidden" name="index" value="<%= index %>">
            <label for="requestor">Name of Requestor:</label>
            <input type="text" id="requestor" name="requestor" value="<%= reservation[0] %>" required><br>

            <label for="contact">Contact Number:</label>
            <input type="text" id="contact" name="contact" value="<%= reservation[1] %>" required><br>

            <label for="organization">Organization:</label>
            <input type="text" id="organization" name="organization" value="<%= reservation[2] %>" required><br>

            <label for="dateOfRequest">Date of Request:</label>
            <input type="date" id="dateOfRequest" name="dateOfRequest" value="<%= reservation[3] %>" required><br>

            <label for="title">Title of Activity:</label>
            <input type="text" id="title" name="title" value="<%= reservation[4] %>" required><br>

            <label for="dateOfEvent">Date of Event:</label>
            <input type="date" id="dateOfEvent" name="dateOfEvent" value="<%= reservation[5] %>" required><br>

            <label for="timeOfEvent">Time of Event:</label>
            <input type="time" id="timeOfEvent" name="timeOfEvent" value="<%= reservation[6] %>" required><br>

            <label for="timeOfPreparation">Time of Preparation:</label>
            <input type="time" id="timeOfPreparation" name="timeOfPreparation" value="<%= reservation[7] %>" required><br>

            <label for="participants">Expected Number of Participants:</label>
            <input type="number" id="participants" name="participants" value="<%= reservation[8] %>" required><br>

            <label for="venue">Target Venue:</label>
            <input type="text" id="venue" name="venue" value="<%= reservation[9] %>" required><br><br>

            <input type="submit" value="Update Reservation">
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                String updatedRequestor = request.getParameter("requestor");
                String updatedContact = request.getParameter("contact");
                String updatedOrganization = request.getParameter("organization");
                String updatedDateOfRequest = request.getParameter("dateOfRequest");
                String updatedTitle = request.getParameter("title");
                String updatedDateOfEvent = request.getParameter("dateOfEvent");
                String updatedTimeOfEvent = request.getParameter("timeOfEvent");
                String updatedTimeOfPreparation = request.getParameter("timeOfPreparation");
                String updatedParticipants = request.getParameter("participants");
                String updatedVenue = request.getParameter("venue");

                reservations.set(index, new String[]{
                    updatedRequestor, updatedContact, updatedOrganization, updatedDateOfRequest,
                    updatedTitle, updatedDateOfEvent, updatedTimeOfEvent, updatedTimeOfPreparation,
                    updatedParticipants, updatedVenue
                });

                Path filePath = Paths.get(application.getRealPath("reservations.txt"));
                try (BufferedWriter writer = Files.newBufferedWriter(filePath, StandardOpenOption.TRUNCATE_EXISTING)) {
                    for (String[] res : reservations) {
                        writer.write(String.join(",", res));
                        writer.newLine();
                    }
                    out.println("Reservation updated successfully.");
                } catch (IOException e) {
                    e.printStackTrace();
                    out.println("Error updating reservation: " + e.getMessage());
                }
            }
        %>
    </main>
</body>
</html>
