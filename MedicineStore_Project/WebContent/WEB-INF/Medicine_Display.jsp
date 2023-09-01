<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .medicine-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .medicine-card img {
            max-height: 100px;
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function toggleEdit(rowId) {
            var quantityInput = document.getElementById("quantity_" + rowId);
            var priceInput = document.getElementById("price_" + rowId);

            quantityInput.disabled = !quantityInput.disabled;
            priceInput.disabled = !priceInput.disabled;
        }

        function removeRow(button) {
            var row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        
        
        

        
    </script>
</head>
<body>
    <div class="container">
        <h2>Medicine List</h2>
        
        <table class="table table-striped">
            <thead>
                <!-- Table headers here -->
            </thead>
            <tbody id="medicineTableBody">
                <c:forEach items="${medicines}" var="medicine" varStatus="status">
                    <tr>
                        <form action="update" method="post">
                            <td>${medicine.getId()}</td>
                            <td>${medicine.getBillNo()}</td>
                            <td>${medicine.getMedicineName()}</td>
							<input type="hidden" name="id" value="${medicine.getId()}">
							
                            <td><input name="quantity" id="quantity_${status.index}" type="text" value="${medicine.getQuantity()}" disabled></td>
                            <td><input name="price" id="price_${status.index}" type="text" value="${medicine.getPrice()}" disabled></td>

                            <td><a href="#" class="btn btn-warning" onclick="toggleEdit(${status.index});">Edit</a></td>
                            <td><a href="#" class="btn btn-danger">Delete</a></td>
                            <td><button type="submit" class="btn btn-success">Save</button></td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        
        <!-- ... Your existing HTML and script ... -->

<div class="row">
    <div class="col-md-6">
        <button class="btn btn-primary" onclick="showAddMedicineModal()">Add Medicine</button>
    </div>
</div>

<!-- Add Medicine Modal -->
<div id="addMedicineModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Medicine</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addMedicineForm" action="add" method="post">
                    <div class="form-group">
                        <label for="medicineSelect">Select Medicine</label>
                        <select class="form-control" id="medicineSelect" name="medicineName">
                            <c:forEach items="${medicines}" var="medicine">
                                <option value="${medicine.getMedicineName()}">${medicine.getMedicineName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantityInput">Quantity</label>
                        <input type="text" class="form-control" id="quantityInput" name="q">
                    </div>
                    <div class="form-group">
                        <label for="priceInput">Price</label>
                        <input type="text" class="form-control" id="priceInput" name="p">
                    </div>
                    <div class="form-group">
                        <label for="BillNoInput">Bill No</label>
                        <input type="text" class="form-control" id="BillNoInput" name="b">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="confirmAddMedicine()">Save</button>
            </div>
        </div>
    </div>
</div>

<script>
    function showAddMedicineModal() {
        $('#addMedicineModal').modal('show');
    }

    function confirmAddMedicine() {
        if (confirm('Are you sure you want to add this medicine?')) {
            document.getElementById('addMedicineForm').submit();
        }
    }
</script>
        






        
        
    </div>
    
    
    
</div>

    </div>
</body>
</html>