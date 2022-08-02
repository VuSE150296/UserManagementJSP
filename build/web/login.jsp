<%-- 
    Document   : login
    Created on : Feb 16, 2022, 7:36:06 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Input your information</h1>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required="" placeholder="userID"/> </br>
            Password<input type="password" name="password" required="" placeholder="password"/> </br>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        ${requestScope.ERROR}
        <a href="create.jsp">Create new user</a></br>
        <a href="shopping.jsp">Shopping</a> 
    </body>
</html>
