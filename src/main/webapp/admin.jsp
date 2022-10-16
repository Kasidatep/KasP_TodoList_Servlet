<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List admin page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200;300;400&family=Noto+Sans+Thai:wght@100;300;400&display=swap"
          rel="stylesheet">
    <style>
        * {
            font-family: 'Kanit', sans-serif;
            font-family: 'Noto Sans Thai', sans-serif;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="./index.jsp">Todo List</a>
        <div class="position-absolute top-50 start-50 translate-middle">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>

            </button>
        </div>
        <div class="float-end">
            <span class="text-bg-light text-light fs-5 text">Hello, ${account.accountName==null?"guest":account.accountName}</span>
            &nbsp;&nbsp;&nbsp;
            ${account.accountRoll=="admin"?" <a href=\"admin.jsp\"><button class=\"btn btn-secondary\" type=\"submit\">Admin Dashboard</button></a>":""}
            <a href="${account.accountRoll==null?"index.jsp":"list"}">
                <button class="btn btn-outline-light" type="submit">Back</button>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="navbarText">

            <span class="navbar-text">
                 Hello, ${account.accountName==null?"guest":account.accountName}
                &nbsp;&nbsp;&nbsp;
                ${account.accountRoll=="admin"?" <a href=\"admin.jsp\"><button class=\"btn btn-outline-light\" type=\"submit\">Search</button></a>":""}

      </span>
        </div>
    </div>
</nav>
<br>
<div class="container ${account.accountRoll=="admin"?"d-none":""}">
    <div class="alert alert-warning" role="alert">
        You don't have permission to access this page
    </div>
</div>
<div class="container ${account.accountRoll=="admin"?"":"d-none"}">

    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Owner</th>
            <th>Title</th>
            <th>completionDate</th>
            <th>status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${todoList}" var="todo" varStatus="count">
            <tr>
                <th class="col-1">${count.count}</th>
                <td class="col-1">${todo.owner}</td>
                <td class="col-7">${todo.title}</td>
                <td class="col-2">${todo.completionDate}</td>
                <td class="col-1">${todo.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>