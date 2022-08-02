<%-- 
    Document   : viewCart
    Created on : Feb 25, 2022, 7:52:16 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tea Farm</title>
    </head>
    <body>
        <h1>Your selected tea you like:</h1>
        <c:if test="${sessionScope.CART != null}">
            <c:if test="${not empty sessionScope.CART}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tea" varStatus="counter" items="${sessionScope.CART.getCart().values()}" >
                            <c:set var="total" value="${total+tea.price*tea.quantity}"/>
                        <form action="MainController">
                                <tr>
                                    <td>${counter.count}</td>
                                <td>
                                    ${tea.id}
                                    <input type="hidden" name="id" value="${tea.id}"
                                </td>
                                    <td>${tea.name}</td>
                                    <td>${tea.price}</td>
                                    <td>
                                        <input type="number" name="quantity" value="${tea.quantity}" min="1" required=""/>
                                    </td>
                                    <td>${tea.price*tea.quantity} $</td>
                                    <!--Remove-->
                                    <td>
                                        <input type="submit" name="action" value="Remove"/>
                                    </td>
                                    <!--Edit Product-->
                                    <td>
                                        <input type="submit" name="action" value="Edit"/>
                                    </td>
                                </tr>
                            </form>

                    </c:forEach>

                </tbody>
            </table>
                <h1>Total: ${total}</h1>
        </c:if>
    </c:if>
    <a href="shopping.jsp">Add more</a>
</body>
</html>
