<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Added</title>
</head>
<body>
    <h2>Medicine Added</h2>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            ${successMessage}
        </div>
        <table class="table table-bordered">
            <tr>
                <th>Medicine Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Bill</th>
            </tr>
            <tr>
                <td>${medicineName}</td>
                <td>${quantity}</td>
                <td>${price}</td>
                <td>${bill}</td>
            </tr>
        </table>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
    </c:if>
</body>
</html>
