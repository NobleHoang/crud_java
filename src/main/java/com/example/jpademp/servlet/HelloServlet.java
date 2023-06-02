package com.example.jpademp.servlet;

import com.example.jpademp.dao.UserDAO;
import com.example.jpademp.entity.UserEntity;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    UserDAO userDAO = new UserDAO();

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        // Hello
        PrintWriter out = response.getWriter();
        UserEntity user = new UserEntity("T2108E", 20,"Ha Noi");
        userDAO.insertUser(user);
        out.println("creat user success");
    }

    public void destroy() {
    }
}