<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Product Management</title>
  <style>
    /* Reset and Base Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #f5f5f5;
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

    /* Main Content Styles */
    .main {
      margin-left: 250px;
      padding: 20px;
    }

    .section {
      display: none;
      background: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .section.active {
      display: block;
    }

    h3 {
      margin-bottom: 20px;
      color: #2c3e50;
      font-size: 24px;
    }

    h4 {
      margin: 25px 0 15px;
      color: #2c3e50;
      font-size: 20px;
    }

    /* Form Styles */
    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: 600;
      color: #555;
    }

    .form-group input,
    .form-group textarea,
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 16px;
    }

    .form-group textarea {
      min-height: 100px;
      resize: vertical;
    }

    button {
      background: #3498db;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      transition: background 0.3s;
    }

    button:hover {
      background: #2980b9;
    }

    .cancel-btn {
      display: inline-block;
      background: #95a5a6;
      color: white;
      padding: 10px 20px;
      border-radius: 4px;
      text-decoration: none;
      margin-left: 10px;
      transition: background 0.3s;
    }

    .cancel-btn:hover {
      background: #7f8c8d;
    }

    /* Table Styles */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table th, table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    table th {
      background-color: #f8f9fa;
      font-weight: 600;
      color: #2c3e50;
    }

    table tr:hover {
      background-color: #f5f5f5;
    }

    /* Action Buttons */
    .actions {
      display: flex;
      gap: 10px;
    }

    .edit-btn {
      background: #2ecc71;
      color: white;
      padding: 5px 10px;
      border-radius: 4px;
      text-decoration: none;
      transition: background 0.3s;
    }

    .edit-btn:hover {
      background: #27ae60;
    }

    .delete-btn {
      background: #e74c3c;
      color: white;
      border: none;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .delete-btn:hover {
      background: #c0392b;
    }

    /* Error Message */
    .error-message {
      color: #e74c3c;
      background: #fadbd8;
      padding: 10px;
      border-radius: 4px;
      margin-top: 20px;
      border-left: 4px solid #e74c3c;
    }

    /* Popup Styles */
    .popup-overlay {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.5);
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 1000;
      opacity: 0;
      visibility: hidden;
      transition: all 0.3s;
    }

    .popup-overlay.active {
      opacity: 1;
      visibility: visible;
    }

    .popup-content {
      background: white;
      padding: 30px;
      border-radius: 8px;
      width: 90%;
      max-width: 500px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
      transform: translateY(-20px);
      transition: all 0.3s;
    }

    .popup-overlay.active .popup-content {
      transform: translateY(0);
    }

    .popup-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }

    .popup-header h3 {
      margin: 0;
    }

    .close-btn {
      background: none;
      border: none;
      font-size: 24px;
      cursor: pointer;
      color: #7f8c8d;
    }

    .popup-footer {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 20px;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .sidebar {
        width: 100%;
        height: auto;
        position: relative;
      }
      
      .main {
        margin-left: 0;
      }

      table {
        display: block;
        overflow-x: auto;
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

  <div class="main">
    <div id="products" class="section active">
      <h3>Product Management</h3>
      
      <button id="addProductBtn" class="add-btn">Add New Product</button>

      <!-- Products Table -->
      <h4>Product List</h4>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Category</th>
            <th>Image</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="product" items="${products}">
            <tr>
              <td>${product.productId}</td>
              <td>${product.productName}</td>
              <td>$${product.productPrice}</td>
              <td>${product.stock}</td>
              <td>${product.category}</td>
              <td><img src="${product.imageUrl}" alt="${product.productName}" style="max-width: 50px; max-height: 50px;"></td>
              <td class="actions">
                <a href="#" class="edit-btn" onclick="openEditPopup(${product.productId})">Edit</a>
                <button class="delete-btn" onclick="openDeletePopup(${product.productId}, '${product.productName}')">Delete</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      
      <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
      </c:if>
    </div>
  </div>

  <!-- Add Product Popup -->
  <div id="addProductPopup" class="popup-overlay">
    <div class="popup-content">
      <div class="popup-header">
        <h3>Add New Product</h3>
        <button class="close-btn" onclick="closePopup('addProductPopup')">&times;</button>
      </div>
      <form action="${pageContext.request.contextPath}/AdminProductServlet" method="post">
        <input type="hidden" name="action" value="add" />
        
        <div class="form-group">
          <label>Product Name:</label>
          <input type="text" name="productName" required />
        </div>
        
        <div class="form-group">
          <label>Price:</label>
          <input type="number" step="0.01" name="productPrice" required />
        </div>
        
        <div class="form-group">
          <label>Stock:</label>
          <input type="number" name="stock" required />
        </div>
        
        <div class="form-group">
          <label>Description:</label>
          <textarea name="productDesc" required></textarea>
        </div>
        
        <div class="form-group">
  <label for="editCategory">Storage Capacity:</label>
  <select name="category" id="editCategory" required>
    <option value="" disabled selected>Select storage</option>
    <option value="64GB">64GB</option>
    <option value="128GB">128GB</option>
    <option value="256GB">256GB</option>
    <option value="512GB">512GB</option>
    <option value="1TB">1TB</option>
  </select>
</div>
        <div class="form-group">
          <label>Image URL:</label>
          <input type="text" name="imageUrl" required />
        </div>
        
        <div class="popup-footer">
          <button type="button" class="cancel-btn" onclick="closePopup('addProductPopup')">Cancel</button>
          <button type="submit">Add Product</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Edit Product Popup -->
  <div id="editProductPopup" class="popup-overlay">
    <div class="popup-content">
      <div class="popup-header">
        <h3>Edit Product</h3>
        <button class="close-btn" onclick="closePopup('editProductPopup')">&times;</button>
      </div>
      <form id="editForm" action="${pageContext.request.contextPath}/AdminProductServlet" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="productId" id="editProductId" />
        
        <div class="form-group">
          <label>Product Name:</label>
          <input type="text" name="productName" id="editProductName" required />
        </div>
        
        <div class="form-group">
          <label>Price:</label>
          <input type="number" step="0.01" name="productPrice" id="editProductPrice" required />
        </div>
        
        <div class="form-group">
          <label>Stock:</label>
          <input type="number" name="stock" id="editStock" required />
        </div>
        
        <div class="form-group">
          <label>Description:</label>
          <textarea name="productDesc" id="editProductDesc" required></textarea>
        </div>
        
        <div class="form-group">
  <label for="editCategory">Storage Capacity:</label>
  <select name="category" id="editCategory" required>
    <option value="" disabled selected>Select storage</option>
    <option value="64GB">64GB</option>
    <option value="128GB">128GB</option>
    <option value="256GB">256GB</option>
    <option value="512GB">512GB</option>
    <option value="1TB">1TB</option>
  </select>
</div>
        
        <div class="form-group">
          <label>Image URL:</label>
          <input type="text" name="imageUrl" id="editImageUrl" required />
        </div>
        
        <div class="popup-footer">
          <button type="button" class="cancel-btn" onclick="closePopup('editProductPopup')">Cancel</button>
          <button type="submit">Update Product</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Delete Confirmation Popup -->
  <div id="deleteProductPopup" class="popup-overlay">
    <div class="popup-content">
      <div class="popup-header">
        <h3>Confirm Deletion</h3>
        <button class="close-btn" onclick="closePopup('deleteProductPopup')">&times;</button>
      </div>
      <p id="deleteMessage">Are you sure you want to delete this product?</p>
      <form id="deleteForm" action="${pageContext.request.contextPath}/AdminProductServlet" method="post">
        <input type="hidden" name="action" value="delete" />
        <input type="hidden" name="productId" id="deleteProductId" />
        
        <div class="popup-footer">
          <button type="button" class="cancel-btn" onclick="closePopup('deleteProductPopup')">Cancel</button>
          <button type="submit" class="delete-btn">Delete</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    // Open Add Product Popup
    document.getElementById('addProductBtn').addEventListener('click', function() {
      document.getElementById('addProductPopup').classList.add('active');
    });

    // Open Edit Product Popup
    function openEditPopup(productId) {
      // In a real application, you would fetch the product data via AJAX
      // For this example, we'll simulate it by finding the product in the table
      const row = document.querySelector(`tr:has(td:first-child:contains('${productId}')`);
      if (row) {
        const cells = row.cells;
        document.getElementById('editProductId').value = productId;
        document.getElementById('editProductName').value = cells[1].textContent;
        document.getElementById('editProductPrice').value = cells[2].textContent.replace('$', '');
        document.getElementById('editStock').value = cells[3].textContent;
        document.getElementById('editCategory').value = cells[4].textContent;
        document.getElementById('editImageUrl').value = cells[5].querySelector('img').src;
        
        // For description, we would need to fetch it from the server in a real app
        document.getElementById('editProductDesc').value = "Sample description"; // Placeholder
        
        document.getElementById('editProductPopup').classList.add('active');
      }
    }

    // Open Delete Confirmation Popup
    function openDeletePopup(productId, productName) {
      document.getElementById('deleteProductId').value = productId;
      document.getElementById('deleteMessage').textContent = `Are you sure you want to delete "${productName}"?`;
      document.getElementById('deleteProductPopup').classList.add('active');
    }

    // Close Popup
    function closePopup(popupId) {
      document.getElementById(popupId).classList.remove('active');
    }

    // Close popup when clicking outside of it
    document.querySelectorAll('.popup-overlay').forEach(popup => {
      popup.addEventListener('click', function(e) {
        if (e.target === this) {
          this.classList.remove('active');
        }
      });
    });

    // Helper function for contains selector (for the edit popup simulation)
    jQuery.expr[':'].contains = function(a, i, m) {
      return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
    };
  </script>
</body>
</html>