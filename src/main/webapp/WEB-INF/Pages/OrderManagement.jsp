<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Servlet.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/OrderManagement.css"/>
</head>
<body>
<jsp:include page="Servlet.jsp"/>

    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Status</th>
            <th>Total</th>
            <th>Actions</th>
        </tr>

        <%
            List<OrderModel> orders = (List<OrderModel>) request.getAttribute("orders");
            if (orders != null) {
                for (OrderModel order : orders) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getUserId() %></td>
            <td>
                <form action="OrderManagementServlet" method="post">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>"/>
                    <select name="status">
                        <option value="Pending" <%= order.getOrderStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                        <option value="Shipped" <%= order.getOrderStatus().equals("Shipped") ? "selected" : "" %>>Shipped</option>
                        <option value="Delivered" <%= order.getOrderStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
                        <option value="Cancelled" <%= order.getOrderStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                    </select>
                    <td>$<%= order.getTotalAmount() %></td>
                   
                    <td>
                        <button type="submit" name="action" value="update">Update</button>
                </form>
                <form action="OrderManagementServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>"/>
                    <button type="submit" name="action" value="delete" onclick="return confirm('Delete this order?');">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>