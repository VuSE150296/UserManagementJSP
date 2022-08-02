<%-- 
    Document   : shopping
    Created on : Feb 25, 2022, 7:14:36 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tea Farm</title>
    </head>
    <body>
        <h1>Select your tea: </h1>
        <form action="MainController">
            <!--combo box chon loai tra-->
            <!--trong group box tea la minh se gui di id, loai tra va gia tien-->
            <select name="cmbTea">
                <option value="T01-OLong Tea-10">OLong Tea- 10$</option>
                <option value="T02-Bubble Tea-30">Bubble Tea- 30$</option>
                <option value="T03-Black Tea-60">Black Tea- 60$</option>
                <option value="T04-Pink Tea-100">Pink Tea- 100$</option>
            </select>
            <!--combo box chon so luong-->
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>               
            </select>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="View"/>
        </form>
        ${requestScope.MESSAGE}
    </body>
</html>
