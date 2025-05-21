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
  <style>
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

/* Responsive Sidebar */
@media (max-width: 768px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
}
    .dashboard-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .dashboard-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 1px solid #e0e0e0;
    }

    .dashboard-header h1 {
      color: #2c3e50;
      font-size: 28px;
    }

    .header-actions {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    #current-date {
      color: #7f8c8d;
      font-size: 14px;
    }

    .logout-btn {
      background-color: #e74c3c;
      color: white;
      border: none;
      padding: 8px 15px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      transition: background-color 0.3s;
    }

    .logout-btn:hover {
      background-color: #c0392b;
    }

    .stats-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }

    .stat-card {
      background-color: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      display: flex;
      align-items: center;
      gap: 15px;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .stat-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .stat-icon {
      font-size: 30px;
      width: 60px;
      height: 60px;
      background-color: #f8f9fa;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .stat-info h3 {
      color: #7f8c8d;
      font-size: 16px;
      margin-bottom: 5px;
    }

    .stat-info p {
      color: #2c3e50;
      font-size: 24px;
      font-weight: bold;
    }

    .chart-container {
      background-color: white;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 30px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .chart-container h2 {
      color: #2c3e50;
      margin-bottom: 20px;
      font-size: 20px;
    }

    .chart-wrapper {
      width: 100%;
      overflow-x: auto;
      justify-items: center;
    }
#orders-chart {
  width: 400px !important;
  height: 400px !important;
}

    .chart-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 15px;
      margin-top: 20px;
    }

    .chart-stat-item {
      background-color: #f8f9fa;
      padding: 15px;
      border-radius: 6px;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .chart-stat-color {
      width: 15px;
      height: 15px;
      border-radius: 3px;
    }

    .chart-stat-label {
      font-size: 14px;
      color: #7f8c8d;
    }

    .chart-stat-value {
      font-weight: bold;
      margin-left: auto;
    }

    @media (max-width: 768px) {
      .stats-container {
        grid-template-columns: 1fr 1fr;
      }
    }

    @media (max-width: 480px) {
      .stats-container {
        grid-template-columns: 1fr;
      }

      .dashboard-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }
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
    <!-- Add other menu items as needed -->
  </ul>
</div>

  <div class="dashboard-container">
    <header class="dashboard-header">
      <h1>Admin Dashboard</h1>
      <div class="header-actions">
        <span id="current-date"><%= new java.util.Date() %></span>
        <form action="logout.jsp" method="post">
          <button class="logout-btn">Logout</button>
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