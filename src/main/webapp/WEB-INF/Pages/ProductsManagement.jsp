<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/admin.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Servlet.css"/>
  <title>Product Management</title>
</head>
<body>

	<jsp:include page="Servlet.jsp"/>
  <div class="sidebar">
    <h2>Admin Panel</h2>
    <ul>
      <li><a href="#" class="active">Products</a></li>
      <!-- Add other menu items as needed -->
    </ul>
  </div>

  <div class="main">
    <div id="products" class="section active">
      <h3>Product Management</h3>
      
      <!-- Add/Edit Product Form -->
      <form action="${pageContext.request.contextPath}/AdminProductServlet" method="post">
        <input type="hidden" name="action" value="${empty product ? 'add' : 'update'}" />
        <c:if test="${not empty product}">
          <input type="hidden" name="productId" value="${product.productId}" />
        </c:if>
        
        <div class="form-group">
          <label>Product Name:</label>
          <input type="text" name="productName" value="${product.productName}" required />
        </div>
        
        <div class="form-group">
          <label>Price:</label>
          <input type="number" step="0.01" name="productPrice" value="${product.productPrice}" required />
        </div>
        
        <div class="form-group">
          <label>Stock:</label>
          <input type="number" name="stock" value="${product.stock}" required />
        </div>
        
        <div class="form-group">
          <label>Description:</label>
          <textarea name="productDesc" required>${product.productDesc}</textarea>
        </div>
        
        <div class="form-group">
          <label>Category:</label>
          <input type="text" name="category" value="${product.category}" required />
        </div>
        
        <div class="form-group">
          <label>Image URL:</label>
          <input type="text" name="imageUrl" value="${product.imageUrl}" required />
        </div>
        
        <button type="submit">${empty product ? 'Add Product' : 'Update Product'}</button>
        
        <c:if test="${not empty product}">
          <a href="${pageContext.request.contextPath}/AdminProductServlet" class="cancel-btn">Cancel</a>
        </c:if>
      </form>

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
                <a href="${pageContext.request.contextPath}/AdminProductServlet?productId=${product.productId}" class="edit-btn">Edit</a>
                <form action="${pageContext.request.contextPath}/AdminProductServlet" method="post" style="display:inline;">
                  <input type="hidden" name="action" value="delete" />
                  <input type="hidden" name="productId" value="${product.productId}" />
                  <button type="submit" class="delete-btn">Delete</button>
                </form>
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
</body>
</html>