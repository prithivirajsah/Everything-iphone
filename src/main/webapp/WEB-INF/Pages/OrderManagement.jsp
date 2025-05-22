<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/OrderManagement.css"/>
    <title>Order Management</title>
    <style>
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/DashboardServlet" class="active">Dashboard</a></li>
    		<li><a href="${pageContext.request.contextPath}/AdminProductServlet" class="active">Products Management</a></li>
    		<li><a href="${pageContext.request.contextPath}/OrderManagementServlet" class="active">Orders Management</a></li>
    		<li><a href="${pageContext.request.contextPath}/AdminUserServlet" class="active">User Management</a></li>
        </ul>
    </div>

    <div class="main">
        <h1>Order Management</h1>
        
        <%-- Display messages --%>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message success">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="message error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Status</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OrderModel> orders = (List<OrderModel>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                        for (OrderModel order : orders) {
                            String statusClass = "status-" + order.getOrderStatus().toLowerCase();
                %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getUserId() %></td>
                    <td class="<%= statusClass %>">
                        <form action="OrderManagementServlet" method="post">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>"/>
                            <select name="status">
                                <option value="Pending" <%= order.getOrderStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Shipped" <%= order.getOrderStatus().equals("Shipped") ? "selected" : "" %>>Shipped</option>
                                <option value="Delivered" <%= order.getOrderStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
                                <option value="Cancelled" <%= order.getOrderStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                            </select>
                            <button type="submit" name="action" value="update" class="update-btn">Update</button>
                        </form>
                    </td>
                    <td>$<%= String.format("%.2f", order.getTotalAmount()) %></td>
                    <td>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center;">No orders found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script>
        // Simple confirmation for delete action
        function confirmDelete() {
            return confirm("Are you sure you want to delete this order?");
        }
    </script>
</body>
</html>