<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.nio.file.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
        main h2 {
            color: #800000; /* Maroon text */
            margin: 0;
            padding: 0;
            font-size: 24px;
            animation: fadeInText 2s ease-in-out;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
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
        @keyframes fadeInText {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
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
        <h2>Login</h2>
        <form action="login.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
        </form>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                boolean validUser = false;
                String role = "unknown";
                Path filePath = Paths.get(application.getRealPath("users.txt"));
                try (BufferedReader br = Files.newBufferedReader(filePath)) {
                    String line;
                    while ((line = br.readLine()) != null) {
                        String[] user = line.split(",");
                        if (user[0].equals(username) && user[1].equals(password)) {
                            role = user[2];
                            validUser = true;
                            break;
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }

                if (validUser) {
                    if ("admin".equals(role)) {
                        response.sendRedirect("adminDashboard.jsp");
                    } else if ("student".equals(role)) {
                        response.sendRedirect("studentDashboard.jsp");
                    }
                } else {
                    out.println("Invalid username or password");
                }
            }
        %>
    </main>
</body>
</html>
