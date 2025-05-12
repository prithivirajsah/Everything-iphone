<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Product Management</title>
</head>
<body>
  <h2>Manage Products</h2>

  <form action="ProductmanagementServlet" method="post">
    <input type="hidden" name="action" value="add" />
    <input type="number" name="productId" placeholder="Product ID" required />
    <input type="text" name="productName" placeholder="Product Name" required />
    <input type="text" name="productDesc" placeholder="Description" />
    <input type="number" name="productPrice" placeholder="Price" required />
    <input type="text" name="category" placeholder="Category" />
    <input type="text" name="imageUrl" placeholder="Image URL" />
    <input type="number" name="stock" placeholder="Stock Quantity" required />
    <button type="submit">Add Product</button>
  </form>

  <br/><hr/>

  <h3>All Products</h3>
  <table border="1">
    <tr>
      <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Actions</th>
    </tr>
    <c:forEach var="product" items="${productList}">
      <tr>
        <td>${product.productId}</td>
        <td>${product.productName}</td>
        <td>${product.productPrice}</td>
        <td>${product.stock}</td>
        <td>
          <!-- Delete Form -->
          <form action="ProductmanagementServlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="productId" value="${product.productId}"/>
            <button type="submit">Delete</button>
          </form>

          <!-- Update Form (for simplicity, shows same form prefilled) -->
          <form action="ProductmanagementServlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="productId" value="${product.productId}" />
            <input type="hidden" name="productName" value="${product.productName}" />
            <input type="hidden" name="productDesc" value="${product.productDesc}" />
            <input type="hidden" name="productPrice" value="${product.productPrice}" />
            <input type="hidden" name="category" value="${product.category}" />
            <input type="hidden" name="imageUrl" value="${product.imageUrl}" />
            <input type="hidden" name="stock" value="${product.stock}" />
            <button type="submit">Update</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>