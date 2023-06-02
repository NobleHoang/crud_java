<%@ page import="java.io.Writer" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/23/2023
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="errorPage.jsp" %>
<html>
<head>
    <title>DEMO</title>
</head>
<body>
<%! int d = 100; %>
<%
    int a = 10;
    int b = 200;
    int c = a * b;
    request.setAttribute("c", c);
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    out.write("<h1>Name: "+ name + "</h1>");
    out.write("<h1> Age: "+ age + "</h1>");
    String sessionName = (String)session.getAttribute("session");
    String applicationName = (String) application.getAttribute("application");
    String pageScope =(String)pageContext.getAttribute("pageScope", PageContext.PAGE_SCOPE);
    String requestScope = (String) pageContext.getAttribute("requestScope", PageContext.REQUEST_SCOPE);
    String sessionScope = (String) pageContext.getAttribute("sessionScope", PageContext.SESSION_SCOPE);
    String applicationScope = (String) pageContext.getAttribute("applicationScope", PageContext.APPLICATION_SCOPE);
%>
<h1><%= 10 + 30 + 50 %></h1>
<h1>D: <%= d %></h1>
<h1>C: <%= c %></h1>
<h1> session: <%= sessionName %></h1>
<h1>application: <%= applicationName %></h1>
<h1>pageScope <%=pageScope %></h1>
<h1>requestScope <%=requestScope %></h1>
<h1>sessionScope <%= sessionScope%></h1>
<h1>applicationScope <%= applicationScope%></h1>
<h1>initParam <%= config.getInitParameter("testInit")%></h1>

</body>
</html>
