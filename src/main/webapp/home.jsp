<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pharma Assistant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar-custom {
            background-color: #f0967f;
            padding: 5px 25px;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: white !important;
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler-icon {
            background-color: white;
        }
        .custom-background {
            background-color: #f0967f;
            color: white;
            padding: 1em 0;
        }
        @media (min-width: 768px) {
            .custom-background {
                padding: 5px 25px;
            }
        }
        .table-custom th, .table-custom td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <%
        boolean flag = true;
        try {
            Cookie[] cookar = request.getCookies();
            for (Cookie c : cookar) {
                if (c.getName().equals("uname") && c.getValue().equals(session.getAttribute("na"))) {
                    flag = false;
                }
            }
            if (flag) {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="navbar-custom">
        <div class="container">
            <h1>Pharma Assistant</h1>
            <nav class="navbar navbar-expand-lg">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon" style="background-color:#f0967f"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="PageServ?name=init">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="PageServ?name=addb">Add New Batch</a></li>
                        <li class="nav-item"><a class="nav-link" href="PageServ?name=searchb">Search Existing Batch</a></li>
                        <li class="nav-item"><a class="nav-link" href="PageServ?name=showb">Search Result page</a></li>
                        <li class="nav-item"><a class="nav-link" href="PageServ?name=deleteb">Delete Batch</a></li>
                    </ul>
                    <form class="form-inline ms-auto">
                        <button class="btn btn-danger">
                            <a href="logout.jsp" style="text-decoration: none; color: white; ">Logout</a>
                        </button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
    <div class="container">
        <c:choose>
            <c:when test="${sessionScope.page eq 'init'}">
                <c:import url="staticHome.jsp"></c:import>
            </c:when>
            <c:when test="${sessionScope.page eq 'addb'}">
                <c:import url="addBatch.jsp"></c:import>
            </c:when>
            <c:when test="${sessionScope.page eq 'searchb'}">
                <c:import url="searchBatch.jsp"></c:import>
            </c:when>
            <c:when test="${sessionScope.page eq 'deleteb'}">
                <c:import url="deleteBatch.jsp"></c:import>
            </c:when>
            <c:when test="${sessionScope.page eq 'showb'}">
                <br>
                <h3 style="color: #5b1b0b">Medicines details</h3>
                <table class="table table-bordered table-custom">
                    <tr>
                        <th>Batch Code</th>
                        <th>Medicine Code</th>
                        <th>Weight</th>
                        <th>Price</th>
                        <th>Medicine Type</th>
                        <th>Refrigeration</th>
                        <th>Update</th>
                    </tr>
                    <c:forEach items="${sessionScope.mli}" var="m">
                        <form action="UpdateServ" method="post">
                            <tr>
                                <td><input name="bCode" type="text" readonly value="${m.batchCode()}" class="form-control" /></td>
                                <td><select class="form-select" name="mcode" required>
                                        <c:forEach items="${sessionScope.mcli}" var="med">
                                            <c:if test="${m.medicineCode() eq med}">
                                                <option selected value="${med}">${med}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.mcli}" var="d">
                                            <c:if test="${m.medicineCode() ne d}">
                                                <option value="${d}">${d}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td><input name="weight" type="text" value="${m.weight()}" class="form-control" /></td>
                                <td><input name="price" type="text" value="${m.price()}" class="form-control" /></td>
                                <td><select class="form-select" name="mtype" required>
                                        <c:forEach items="${sessionScope.tyli}" var="ty">
                                            <c:if test="${m.medicineType() eq ty}">
                                                <option selected value="${ty}">${ty}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.tyli}" var="d">
                                            <c:if test="${m.medicineType() ne d}">
                                                <option value="${d}">${d}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <c:if test="${m.refrigeration() eq 'Yes'}">
                                        <div class="form-check form-check-inline">
                                            <input checked class="form-check-input" type="radio" name="Refri" id="inlineRadio1" value="Yes">
                                            <label class="form-check-label" for="inlineRadio1">Yes</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Refri" id="inlineRadio2" value="No">
                                            <label class="form-check-label" for="inlineRadio2">No</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${m.refrigeration() eq 'No'}">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Refri" id="inlineRadio1" value="Yes">
                                            <label class="form-check-label" for="inlineRadio1">Yes</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input checked class="form-check-input" type="radio" name="Refri" id="inlineRadio2" value="No">
                                            <label class="form-check-label" for="inlineRadio2">No</label>
                                        </div>
                                    </c:if>
                                </td>
                                <td><input style="background-color: #eb4a60; border-radius: 5px; color: white; border-style: hidden; padding: 10px" type="submit" value="Update" /></td>
                            </tr>
                        </form>
                    </c:forEach>
                </table>
            </c:when>
        </c:choose>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
