<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <style>
        /* Basic Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f5f7fa;
	color: #333;
}
    /* Sidebar Styles */
.sidebar {
  	width: 250px;
  	background: #2c3e50;
  	color: white;
  	height: 100vh;
  	position: fixed;
  	padding: 20px;
  	transition: all 0.3s;
}

.sidebar h2 {
  text-align: center;
  margin-bottom: 30px;
  padding-bottom: 10px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.sidebar ul {
  list-style: none;
}

.sidebar ul li {
  padding: 10px 0;
}

.sidebar ul li a {
  color: white;
  text-decoration: none;
  display: block;
  padding: 10px;
  border-radius: 5px;
  transition: all 0.3s;
}

.sidebar ul li a:hover {
  background: #34495e;
}

.sidebar ul li a.active {
  background: #3498db;
}

/* Main Content */
.main {
	margin-left: 250px;
    background: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h1 {
    margin-bottom: 20px;
    color: #333;
}

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Form Elements */
        select {
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* Buttons */
        button {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        .update-btn {
            background-color: #4CAF50;
            color: white;
        }

        .update-btn:hover {
            background-color: #45a049;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        /* Status Colors */
        .status-pending {
            color: #ff9800;
            font-weight: bold;
        }

        .status-shipped {
            color: #2196F3;
            font-weight: bold;
        }

        .status-delivered {
            color: #4CAF50;
            font-weight: bold;
        }

        .status-cancelled {
            color: #f44336;
            font-weight: bold;
        }

        /* Messages */
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        .success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }

        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
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
                    <th>Actions</th>
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
                        <form action="OrderManagementServlet" method="post" style="display:inline;">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>"/>
                            <button type="submit" name="action" value="delete" class="delete-btn" onclick="return confirm('Are you sure you want to delete this order?');">Delete</button>
                        </form>
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