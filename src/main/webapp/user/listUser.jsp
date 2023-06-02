<%@ page import="java.util.List" %>
<%@ page import="com.example.jpademp.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div style="padding: 20px 0px">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h1>DANH SÁCH USER</h1>
            </div>
            <div class="col-md-2">
                <a href="${request.getContextPath()}/userServlet?action=showForm" class="btn btn-success">
                    Add New User
                </a>
            </div>
        </div>
        <div class="row">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col" class="text-center">#</th>
                    <th scope="col">Name</th>
                    <th scope="col" class="text-center">Age</th>
                    <th scope="col">Address</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty listUsers}">
                        <c:forEach items="${listUsers}" var="user" varStatus="loop">
                            <tr>
                                <th scope="row" class=" text-center">${loop.index + 1}</th>
                                <td>${user.name}</td>
                                <td class="text-center">${user.age}</td>
                                <td>${user.address}</td>
                                <td>
                                    <button type="button" class="btn btn-view" data-userId="${user.id}"
                                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <i class="fa-solid fa-eye"></i>
                                    </button>

                                    <a href="userServlet?action=edit&id=${user.id}" class="btn">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="userServlet?action=delete&id=${user.id}" class="btn">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">Danh sách User trống</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    $('.btn-view').on('click', function () {
        var userId = $(this).attr("data-userId");
        var url = "userApi?action=view&id=" + parseInt(userId);
        var modal = $('#exampleModal');
        modal.modal('hide');
        $.ajax({
            url: url,
            method: "GET",
            success: function (result) {
                modal.modal('show');
                console.log(result)
            }
        })
    })
</script>

</html>