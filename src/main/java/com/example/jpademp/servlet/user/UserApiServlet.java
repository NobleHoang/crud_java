package com.example.jpademp.servlet.user;

import com.example.jpademp.dao.UserDAO;
import com.example.jpademp.entity.UserEntity;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userApi")
public class UserApiServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("view")) {
            getUser(request, response);
        } else {
            // Xử lý các action khác (nếu có)
        }
    }

    private void getUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        UserEntity user = userDAO.getUser(userId);
        String jsonUser = convertUserToJson(user);
        response.setContentType("application/json");
        response.getWriter().write(jsonUser);
    }

    private String convertUserToJson(UserEntity user) {
        Gson gson = new Gson();
        return gson.toJson(user);
    }
}
