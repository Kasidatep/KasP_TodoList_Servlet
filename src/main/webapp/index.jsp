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
            const passW1 = document.getElementById("newPass");
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
    <div class="container-fluid">
        <a class="navbar-brand" href="list"><strong>Todo List</strong>'s</a>
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
                        aria-controls="offcanvasRight"> ${account.accountName==null?"Sign In":"My Account"}</button>

                &nbsp;&nbsp;&nbsp;
                ${account.accountRoll=="admin"?" <a href=\"admin\"><button class=\"btn btn-secondary\" type=\"submit\">Admin Dashboard</button></a>":""}

            </div>
        </div>
    </div>
</nav>

<br>
<br>

<div class="container alert alert-warning ${account.accountID==null?"":"d-none"}" role="alert">
    <h4 class="alert-heading">Oh noo..</h4>
    <p>Looks like you haven't logged into our system yet. Please click on the
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#account"
                aria-controls="offcanvasRight">Sign In
        </button>
        menu before continuing. If you don't have an account You can create account at <a href="register.jsp">
            <button class="btn btn-secondary" type="button">Create a new account</button>
        </a>
    <hr>
    <p class="mb-0">if in doubt or want to ask for more information can be contacted at <a
            href="mallto:bank@kasidate.me">bank@kasidate.me</a></p>
</div>

<div class="container ${account.accountID==null?"d-none":""}">
    <br>
    <div class="border border-1 rounded rounded-3 p-4">
        <h5 class="font-weight-bold">Add new todo... </h5>
        <form action="add" method="post" class="input-group col-12">
            <input type="hidden" class="form-control col-2" value="${account.accountID}" name="username">
            <input type="text" class="form-control col-md-8" placeholder="Add new todo..." name="title"
                   aria-label="Recipient's username" aria-describedby="button-addon2">
            <input type="date" class="form-control col-2" placeholder="set completion date" aria-label=""  name="completionDate" required>
            <button class="btn btn-secondary col-md-2" type="submit" id="button-addon2">Add Todo</button>
        </form>
    </div>
    <br>
    <table class="table table-hover">
        <h5 class="font-weight-bolder"> ${account.accountName} Todo List... </h5>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>#</th>--%>
<%--            <th>Todo...</th>--%>
<%--            <th>completionDate</th>--%>
<%--&lt;%&ndash;            <th>status</th>&ndash;%&gt;--%>
<%--            <th class="text-right"></th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
        <tbody>
        <c:forEach items="${todoList}" var="todo" varStatus="count">
            <tr class="font-weight-bold ${todo.status=="Done"?"text-secondary opacity-25":""}">
                <th class="col-1">${count.count}</th>
                <td class="col-7">${todo.title}</td>
                <td class="col-3 text-bold">Should be done before ${todo.completionDate}</td>
<%--                <td class="col-1">${todo.status}</td>--%>
                <td class="col-1 text-right  ${todo.status=="Done"?"d-none":""}">
                    <div class="btn-group btn-group-lg" role="group" aria-label="Regular button group">
                        <form action="edit" method="post">
                            <input type="hidden" name="id" value="${todo.id}">
                            <button type="submit" class="btn btn-primary" disabled> EDIT
                            </button>
                        </form>

                        &nbsp;&nbsp;
                        <form action="done" method="post">
                            <input type="hidden" name="todoDone" value="${todo.id}">
                            <button type="submit" class="btn btn-success"> DONE
                            </button>
                        </form>
                    </div>
                </td>
                <td class=" col-1 text-right  ${todo.status=="Done"?"":"d-none"}">
                    <div class="btn-group btn-group-lg" role="group" aria-label="Regular button group">
                        <form action="process" method="post">
                            <input type="hidden" name="todo-undone" value="${todo.id}">
                            <button type="submit" class="btn btn-dark">RE WORK</button>
                        </form>
                    </div>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="offcanvas offcanvas-end" tabindex="-1" id="account" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <p id="offcanvasRightLabel" class="badge bg-secondary">Ver 0.12</p>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <h2 class="text-bolder"> ${account.accountName==null?"Sign In":"My Account"}</h2>
        <h4><span class="fs-5 text">Hello, ${account.accountName==null?"guest.":account.accountName}</span></h4>
        <div class="${account.accountName==null?"":"d-none"}">
            <form action="sign-in" method="post" class="w-400 mw-full">
                <div class="form-group">
                    <label for="username" class="required">username</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="username"
                           required="required">
                </div>

                <div class="form-group">
                    <label for="password" class="required">username</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="password"
                           required="required">
                </div>
                <br>
                <!-- Switch -->
                <div class="form-group">
                    <div class="custom-switch">
                        <input type="checkbox" name="remember-account" value="remember" id="remember-my-information">
                        <label for="remember-my-information">Remember me</label>
                    </div>
                </div>  <!-- Submit button -->

                <div class="form-group mb-3 row">
                    <input class="btn btn-primary mb-3 row" type="submit" value="Sign In">
                </div>
            </form>
            <hr>
            <div class="mb-3 row">
                <h5>Don't have an account,</h5>
                <button class="btn btn-secondary" href="signup" type="button">Sign Up</button>
            </div>


        </div>
        <div class="${account.accountName==null?"d-none":""}">
            <span>@${account.accountID}</span>
            <hr>
            <div class="accordion" id="accordionAccount">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#changeName" aria-expanded="true" aria-controls="collapseOne">
                            Change Display Name
                        </button>
                    </h2>
                    <div id="changeName" class="accordion-collapse collapse show" aria-labelledby="changeName"
                         data-bs-parent="#accordionAccount">
                        <div class="accordion-body">
                            <form action="changeName" method="post">
                                <div class="mb-3 row">
                                    <label for="oldName" class="col-sm-2 col-form-label">Old name</label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control-plaintext" id="oldName"
                                               value="${account.accountName}">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="newName" class="col-sm-2 col-form-label">New name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="accountName" id="newName">
                                    </div>
                                    <input class="btn btn-primary" type="submit" value="Change now">
                                </div>
                            </form>
                            <div class="alert alert-info" role="alert">
                                Your name will be changed the next time you log in.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#changePassword" aria-expanded="false" aria-controls="collapseTwo">
                            Change password
                        </button>
                    </h2>
                    <div id="changePassword" class="accordion-collapse collapse" aria-labelledby="changePassword"
                         data-bs-parent="#accordionAccount">
                        <div class="accordion-body">
                            <form action="changePassword" method="post">
                                <div class="form-floating mb-3">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" id="oldPass" name="oldPass"
                                               placeholder="Enter your old password">
                                        <label for="oldPass">Old Password</label>
                                    </div>
                                    <hr>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" id="newPass" name="newPass"
                                               placeholder="Enter your new password">
                                        <label for="newPass">New Password</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" id="confirmPass" name="confirmPass"
                                               placeholder="Enter your new password again">
                                        <label for="confirmPass">Confirm Password</label>
                                    </div>
                                    <div class="mb-3 row">
                                        <input class="btn btn-primary" onclick="matchPassword()" type="submit"
                                               value="Change Now">
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="accordion-item disabled">
                    <h2 class="accordion-header" id="groupManagement">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#coll-gm" aria-expanded="false" aria-controls="coll-gm"
                                >
                            Group management [Coming soon]
                        </button>

                    </h2>
                    <div id="coll-gm" class="accordion-collapse collapse" aria-labelledby="groupManagement"
                         data-bs-parent="#accordionAccount">
                        <div class="accordion-body">
                            <button class="btn btn-outline-secondary float-end" href="group.jsp" disabled>Create</button>
                            <strong>Manage your group</strong>
                            [coming soon]
                        </div>
                    </div>
                </div>
                <div class="accordion-item disabled">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"
                                disabled>
                            PDPA [Coming soon]
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#accordionAccount">
                        <div class="accordion-body">
                            <strong>Personal Data Protection Act</strong>
                        </div>
                    </div>
                </div>
                <div class="accordion-item disabled">
                    <h2 class="accordion-header" id="heading4">
                        <button class="accordion-button collapsed text-danger" type="button" data-bs-toggle="collapse"
                                data-bs-target="#coll4" aria-expanded="false" aria-controls="coll4"
                                disabled>
                            Danger Zone [Coming soon]
                        </button>
                    </h2>
                    <div id="coll4" class="accordion-collapse collapse" aria-labelledby="heading4"
                         data-bs-parent="#accordionAccount">
                        <div class="accordion-body">
                            <strong>Dangerous Zone</strong>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="mb-3 row">
                <a class="btn btn-danger" href="logout">Log out</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>