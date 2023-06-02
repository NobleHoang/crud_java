<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 30/05/2023
  Time: 2:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Error 404 - Page Not Found</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }

    p {
      font-size: 24px;
      margin-bottom: 20px;
    }

    a {
      color: #333;
      text-decoration: none;
    }

    .button {
      display: inline-block;
      padding: 10px 20px;
      font-size: 18px;
      background-color: #333;
      color: #fff;
      border-radius: 4px;
      transition: background-color 0.3s;
    }

    .button:hover {
      background-color: #555;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>An error has occurred</h1>
  <p>Oops! The page you are looking for does not exist.</p>
  <a href="/" class="button">Go Back to Homepage</a>
</div>
</body>
</html>