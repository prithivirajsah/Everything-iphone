<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map.Entry" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Dashboard.css"/>
</head>
<body>
<div class="sidebar">
  <h2>Admin Panel</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/DashboardServlet" class="active">Dashboard</a></li>
    <li><a href="${pageContext.request.contextPath}/AdminProductServlet" class="active">Products Management</a></li>
    <li><a href="${pageContext.request.contextPath}/OrderManagementServlet" class="active">Orders Management</a></li>
    <li><a href="${pageContext.request.contextPath}/AdminUserServlet" class="active">User Management</a></li>
    <!-- Add other menu items as needed -->
  </ul>
</div>

  <div class="dashboard-container">
    <header class="dashboard-header">
      <h1>Admin Dashboard</h1>
      <div class="header-actions">
        <span id="current-date"><%= new java.util.Date() %></span>
        <form action="logout.jsp" method="post">
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
        </form>
      </div>
    </header>

    <div class="stats-container">
      <div class="stat-card">
        <div class="stat-icon">👥</div>
        <div class="stat-info">
          <h3>Total Users</h3>
          <p><%= request.getAttribute("totalUsers") %></p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon">📦</div>
        <div class="stat-info">
          <h3>Total Orders</h3>
          <p><%= request.getAttribute("totalOrders") %></p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon">✅</div>
        <div class="stat-info">
          <h3>Delivered</h3>
          <p><%= request.getAttribute("deliveredOrders") %></p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon">💰</div>
        <div class="stat-info">
          <h3>Total Revenue</h3>
          <p>$<%= request.getAttribute("totalRevenue") %></p>
        </div>
      </div>
    </div>

    <!-- Chart Section -->
    <div class="chart-container">
      <h2>Order Status Distribution</h2>
      <div class="chart-wrapper">
        <canvas id="orders-chart"></canvas>
      </div>

      <div class="chart-stats">
        <%
          Map<String, Integer> statusMap = (Map<String, Integer>) request.getAttribute("statusDistribution");
          if (statusMap != null) {
              int index = 0;
              String[] colors = {"#3498db", "#2ecc71", "#f1c40f", "#e67e22", "#e74c3c", "#9b59b6", "#1abc9c"};
              for (Map.Entry<String, Integer> entry : statusMap.entrySet()) {
        %>
          <div class="chart-stat-item">
            <div class="chart-stat-color" style="background-color: <%= colors[index % colors.length] %>;"></div>
            <span class="chart-stat-label"><%= entry.getKey() %></span>
            <span class="chart-stat-value"><%= entry.getValue() %></span>
          </div>
        <%
                  index++;
              }
          }
        %>
      </div>
    </div>
  </div>

  <script>
    const ctx = document.getElementById('orders-chart').getContext('2d');
    const orderChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: [
          <% if (statusMap != null) {
               for (Map.Entry<String, Integer> entry : statusMap.entrySet()) { %>
                 '<%= entry.getKey() %>',
          <%   }
             } %>
        ],
        datasets: [{
          data: [
            <% if (statusMap != null) {
                 for (Map.Entry<String, Integer> entry : statusMap.entrySet()) { %>
                   <%= entry.getValue() %>,
            <%   }
               } %>
          ],
          backgroundColor: [
            '#3498db', '#2ecc71', '#f1c40f', '#e67e22', '#e74c3c', '#9b59b6', '#1abc9c'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'bottom',
          },
        }
      }
    });
  </script>
</body>
</html>