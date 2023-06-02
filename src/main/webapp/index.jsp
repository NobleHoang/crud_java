<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="a" uri="WEB-INFO/tld/myCustomTag.tld" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<%@ include file="testInclude.jsp"%>--%>
<%--<%--%>
<%--    session.setAttribute("session","session implicit object");--%>
<%--    application.setAttribute("application","application implicit object");--%>
<%--    pageContext.setAttribute("pageScope","page scope object", PageContext.PAGE_SCOPE);--%>
<%--    pageContext.setAttribute("sessionScope","session scope object", PageContext.SESSION_SCOPE);--%>
<%--    pageContext.setAttribute("requestScope","request scope object", PageContext.REQUEST_SCOPE);--%>
<%--    pageContext.setAttribute("applicationScope","application scope object", PageContext.APPLICATION_SCOPE);--%>
<%--//    request.getRequestDispatcher("demoJsp?name=T2108E&age=22").forward(request,response);--%>
<%--%>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<%--</br>--%>
<%--<a href="demoJsp.jsp?name=T2108E&age=22">Go demo jsp</a>--%>


<%--<h1>Tổng: ${"2" + 2}</h1>--%>
<%--<h1>Chuỗi: ${"Hello".concat(" Servlet")}</h1>--%>

<%--<h1>Param value ${param.name}</h1>--%>
<%--<h1>Check param value ${empty param.name}</h1>--%>



<h1>
    <a:myFirstCustomTag name="Hello"/>
</h1>

<br>

<h1>
    <a href="/userServlet" class="btn btn-warning">
        Danh sách User
    </a>
</h1>

</body>
</html>