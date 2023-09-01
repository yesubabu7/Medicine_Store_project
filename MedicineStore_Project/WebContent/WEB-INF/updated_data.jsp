<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Updated Medicine</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Updated Medicine Details</h2>
        
        <c:if test="${updatedMedicine != null}">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Bill No</th>
                        <th>Medicine Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${updatedMedicine.getId()}</td>
                        <td>${updatedMedicine.getBillNo()}</td>
                        <td>${updatedMedicine.getMedicineName()}</td>
                        <td>${updatedMedicine.getQuantity()}</td>
                        <td>${updatedMedicine.getPrice()}</td>
                    </tr>
                </tbody>
            </table>
        </c:if>
        
    </div>
</body>
</html>
