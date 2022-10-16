<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200;300;400&family=Noto+Sans+Thai:wght@100;300;400&display=swap"
          rel="stylesheet">
    <script src="https://use.fontawesome.com/beb4edfa6b.js"></script>

    <style>
        * {
            font-family: 'Kanit', sans-serif;
            font-family: 'Noto Sans Thai', sans-serif;
        }
    </style>
    <script>
        function matchPassword() {
            const passW1 = document.getElementById(" newPass");
            const passW2 = document.getElementById("confirmPass");
            if (passW1 != passW2) {
                alert("Passwords did not match");
            } else {
                alert("Password has change");
            }
        }
    </script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark text-light">
    <div class="">
        <a class="navbar-brand" href="index.jsp"><strong>Todo List</strong>'s</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ${account.accountName==null?"d-none":""}">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item ${account.accountName==null?"d-none":""}">
                    <a class="nav-link" href="list">List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://kasidate.me/privacy.html">Privacy-Policy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Report bugs</a>
                </li>
            </ul>
            <div class="float-end">
                <span class="text-bg-light text-light fs-5 text">Hello, ${account.accountName==null?"guest":account.accountName}</span>
                &nbsp;&nbsp;&nbsp;

                <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#account"
                        aria-controls="offcanvasRight" href="index.jsp">  ${account.accountName==null?"Sign In":"My Account"}</button>

                &nbsp;&nbsp;&nbsp;
                ${account.accountRoll=="admin"?" <a href=\"admin\"><button class=\"btn btn-secondary\" type=\"submit\">Admin Dashboard</button></a>":""}

            </div>
        </div>
    </div>
</nav>
<br>
<br>
<div class="row d-flex justify-content-center">
    <div class="w-0"></div>
    <div class="row d-flex justify-content-center w-50">
        <br>
        <br>
        <h1 class="align-middle d-flex justify-content-center">Create a new account</h1><br>
        <form method="post" action="checkusername"
              class="d-flex justify-content-center" ${username!=null?"disabled":""}>
            <div class="input-group">
                <span class="input-group-text">Username</span>
                <input type="text" class="form-control" placeholder="enter username" aria-label="username"
                       value="${username}" name="username" aria-describedby="button-addon2"
                       required ${username!=null?"disabled":""}>
                <button class="btn ${username==null?"btn-outline-secondary":"btn-success"}" type="submit"
                        id="button-addon2" ${username!=null?"disabled":""}>${username!=null?"READY":"Check username"}</button>
            </div>

        </form>
        <p class=" ${username==null?"text-warning":"text-success"}"> ${username_status}</p>

        <form method="post" action="register" class=" ${username==null?"d-none":""}">
            <input type="hidden" name="username" value="${username}">
            <div class="mb-3">
                <label for="dname" class="form-label">Display name</label>
                <input type="text" class="form-control" id="dname" name="accountName" placeholder="Enter display name">
            </div>
            <div class="mb-3">
                <label for="pass" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="pass" placeholder="Enter password" minlength="8" maxlength="45">
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                    <label class="form-check-label" for="invalidCheck">
                        Agree to <a href="http://kasidate.me/privacy.html">terms and conditions</a>
                    </label>
                    <div class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary mb-3" type="submit">Create now</button>
        </form>
    </div>
</div>
</body>
</html>