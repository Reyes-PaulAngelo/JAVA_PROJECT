<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
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
            margin: 10px;
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
        <h1>Student Dashboard</h1>
        <a href="addReservationStudent.jsp">Add Reservation</a>
        <a href="viewReservationsStudent.jsp">View Reservations</a>
        <a href="logout.jsp">Logout</a>
    </main>
</body>
</html>
