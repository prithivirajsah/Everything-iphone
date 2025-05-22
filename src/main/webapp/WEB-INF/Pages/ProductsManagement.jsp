<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Product Management</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/ProductManagement.css"/>
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