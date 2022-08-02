<%-- 
    Document   : create
    Created on : Feb 23, 2022, 7:20:37 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new user</title>
    </head>
    <body>
        <h1>Create new user</h1>
        
        <!--dùng post vì tạo ra password-->
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>
            ${requestScope.USER_ERROR.userIDError}
            </br>
            Full Name<input type="text" name="fullName" required=""/>
            ${requestScope.USER_ERROR.fullNameError}
            </br>
            Role ID<input type="text" name="roleID" value="US" readonly=""/></br>
            Password<input type="password" name="password" required=""/></br>
            Confirm<input type="password" name="confirm" required=""/>
            ${requestScope.USER_ERROR.confirmError}</br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset"  value="Reset"/>
        </form>
    </body>
</html>
