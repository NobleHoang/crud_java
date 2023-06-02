package com.example.jpademp.servlet.user;

import com.example.jpademp.dao.UserDAO;
import com.example.jpademp.entity.UserEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listUsers(request, response);
                break;
            case "showForm":
                showForm(request, response);
                break;
            case "view":
                getUser(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));

        if (userId == 0) {
            createUser(req, resp);
        } else {
            updateUser(req, resp);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserEntity> listUsers = userDAO.getAllUsers();
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("user/listUser.jsp").forward(request, response);
    }

    private UserEntity getUser(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        return userDAO.getUser(userId);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user/createOrUpdate.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        UserEntity user = userDAO.getUser(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("user/createOrUpdate.jsp").forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        UserEntity newUser = new UserEntity(name, age, address);
        userDAO.insertUser(newUser);
        response.sendRedirect("userServlet");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        UserEntity userToUpdate = new UserEntity(userId, name, age, address);
        userDAO.updateUser(userToUpdate);
        response.sendRedirect("userServlet");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(userId);
        response.sendRedirect("userServlet");
    }
}
