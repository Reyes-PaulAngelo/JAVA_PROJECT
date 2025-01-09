<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Reservation System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            height: 100vh;
            width: 100%;
            background: url('../Assets/pupt.jpg') no-repeat center center;
            background-size: cover; /* Ensures the image covers the container without stretching */
        }

        /* Left side with image */
        .left-side {
            flex: 3; /* 3/4 of the width */
        }

        /* Right side with blur effect */
        .right-side {
            flex: 1; /* 1/4 of the width */
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(255, 255, 255, 0.7); /* Semi-transparent white */
            backdrop-filter: blur(5px); /* Apply blur effect */
            box-shadow: -2px 0 4px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            text-align: center;
            padding: 10px;
        }

        .form-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        .form-container h1 {
            font-size: 24px;
            color: maroon; /* Changed to maroon */
            margin-bottom: 10px;
        }

        .form-container p {
            color: #fff;
            margin-bottom: 30px;
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 15px; /* Increased padding for spaciousness */
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 10px; /* Added more curve to the input fields */
            font-size: 16px;
        }

        .form-container input {
            background-color: #fff;
        }

        .form-container select {
            background-color: #fff;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: maroon; /* Changed to maroon */
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .form-container button:hover {
            background-color: #800000; /* Darker maroon */
        }

        .form-container a {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: maroon; /* Changed to maroon */
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }

        .form-container .terms {
            margin-top: 20px;
            font-size: 12px;
            color: black; /* Changed text color to black */
        }

        .form-container .terms a {
            color: maroon; /* Links remain maroon */
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .container {
                flex-direction: column; /* Stacks left and right sides on small screens */
                height: auto;
            }

            .left-side {
                flex: 1;
                height: 200px; /* Set a fixed height for mobile view */
                background-size: cover;
            }

            .right-side {
                flex: 1;
                height: auto;
                background: rgba(255, 255, 255, 0.7); /* Semi-transparent white for readability */
                backdrop-filter: blur(5px);
            }

            .form-container {
                padding: 20px;
            }

            .form-container h1 {
                font-size: 20px;
            }

            .form-container input, .form-container button {
                font-size: 14px;
                padding: 12px; /* Slightly reduce padding for smaller screens */
            }

            .form-container a {
                font-size: 12px;
            }

            .form-container .terms {
                font-size: 10px;
            }
        }

        @media (max-width: 480px) {
            .form-container {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Side with Image -->
        <div class="left-side"></div>

        <!-- Right Side with Form and Blur Effect -->
        <div class="right-side">
            <div class="form-container">
                <img src="https://www.logolynx.com/images/logolynx/6b/6bd71bbc4dc9b9bf31b6ae3eec13ab7a.png" alt="PUP Logo">
                <h1>PUP-Taguig Event Reservation</h1>
                <p>Sign in to start your session</p>
                <form action="login.jsp" method="POST">
                    <input type="text" name="studentNumber" placeholder="Student Number" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <button type="submit">Sign in</button>
                </form>
                <a href="#">I forgot my password</a>
                <a href="#">PUPT Tools</a>
                <div class="terms">
                    By using this service, you understand and agree to the PUP Online Services
                    <a href="#" target="_blank">Terms of Use</a> and
                    <a href="#" target="_blank">Privacy Statement</a>.
                </div>
            </div>
        </div>
    </div>
</body>
</html>
