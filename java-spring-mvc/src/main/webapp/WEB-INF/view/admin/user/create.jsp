<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="TusLeeShop" />
          <meta name="author" content="TusLeeShop" />
          <title>Create</title>
          <link href="/css/styles.css" rel="stylesheet" />
          <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
          <script>
            $(document).ready(() => {
              const avatarFile = $("#avatarFile");
              avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
              });
            });
          </script>
        </head>

        <body class="sb-nav-fixed">
          <jsp:include page="../layout/header.jsp" />
          <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
              <main>
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Create User</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"> <a href="/admin"> Dashboard </a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user"> User </a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user/create"> Create </a></li>
                  </ol>

                  <div class="container mt-5">
                    <div class="row">
                      <div class="col-md-6 col-12 mx-auto">

                        <form:form method="post" action="/admin/user/create" modelAttribute="createUser" class="row"
                          enctype="multipart/form-data">
                          <h1>Create a new user</h1>
                          <hr>
                          <div class="mb-3">
                            <c:set var="errorName">
                              <form:errors path="fullName" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="exampleInputPassword1" class="form-label">Full name</label>
                            <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                              path="fullName" />
                            ${errorName}
                          </div>
                          <div class="mb-3">
                            <c:set var="errorPhone">
                              <form:errors path="phoneNumber" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="exampleInputPassword1" class="form-label">Phone Number</label>
                            <form:input type="text" class="form-control ${not empty errorPhone ? 'is-invalid' : ''}"
                              path="phoneNumber" />
                            ${errorPhone}
                          </div>
                          <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Address</label>
                            <form:input type="text" class="form-control" path="address" />
                          </div>
                          <div class="mb-3">
                            <c:set var="errorEmail">
                              <form:errors path="email" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                              path="email" />
                            ${errorEmail}
                          </div>
                          <div class="mb-3">
                            <c:set var="errorPassword">
                              <form:errors path="password" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <form:input type="password"
                              class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" path="password" />
                            ${errorPassword}
                          </div>
                          <div class="mb-3 col-12 col-md-6">
                            <label class="form-label">Role:</label>
                            <form:select class="form-select" path="role.name">
                              <form:option value="ADMIN">ADMIN</form:option>
                              <form:option value="USER">USER</form:option>
                            </form:select>
                          </div>
                          <div class="mb-3 col-12 col-md-6">
                            <label for="avatarFile" class="form-label">Avatar:</label>
                            <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                              name="tusleeFile" />
                          </div>
                          <div class="col-12 mb-3">
                            <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
                          </div>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </form:form>
                      </div>
                    </div>
                  </div>


                </div>
              </main>
              <jsp:include page="../layout/footer.jsp" />
            </div>
          </div>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
          <script src="/js/scripts.js"></script>
        </body>

        </html>