<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 25/05/2023
  Time: 8:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create or Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<form action="userServlet" method="POST">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" name="id" value="${user.id != null ? user.id : 0}">
                <div class="form-group">
                    Name: <input class="form-control" type="text" name="name" value="${user.name}">
                </div>
                <div class="form-group">
                    Age: <input class="form-control" type="text" name="age" value="${user.age}">
                </div>
                <div class="form-group">
                    Address: <input class="form-control" type="text" name="address" value="${user.address}">
                </div>
                <div class="form-group text-center" style="margin-top: 20px;">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>