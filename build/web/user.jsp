<%-- 
    Document   : user
    Created on : Feb 16, 2022, 8:12:09 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER Page</title>
    </head>
    <body>
        <h1>Your information:</h1>
        <c:if test="${sessionScope.LOGIN_USER == null or sessionScope.LOGIN_USER.roleID != 'US' }" >
            <c:redirect url="login.jsp">               
            </c:redirect>
        </c:if>
        User ID:${sessionScope.LOGIN_USER.userID}</br>
        Full Name: ${sessionScope.LOGIN_USER.fullName}</br>
        Role ID:${sessionScope.LOGIN_USER.roleID}</br>
        Password: <%= "***"%></br>
    </body>
</html>
