<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Manager Classes</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                    <!-- Latest compiled and minified CSS
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                Latest compiled JavaScript
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manager Classes</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / Classes
                                        </li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table classes</h3>
                                                    <a href="/admin/class/create" class="btn btn-primary">Create a
                                                        class</a>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Mã lớp</th>
                                                            <th scope="col">Tên lớp</th>
                                                            <th scope="col">Giáo viên chủ nhiệm</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="classe" items="${classes}">
                                                            <tr>
                                                                <th scope="row">${classe.id}</th>
                                                                <td>${classe.classId}</td>
                                                                <td>${classe.name}</td>
                                                                <td>${classe.teacher.fullName}</td>
                                                                <td>
                                                                    <a href="/admin/class/${classe.id}"
                                                                        class="btn btn-success">View</a>
                                                                    <a href="/admin/class/update/${classe.id}"
                                                                        class="btn btn-warning mx-2">Update</a>
                                                                    <a href="/admin/class/delete/${classe.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>

                                                <!-- <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="page-link ${1 eq currentPage ? 'disabled' : ''}"
                                                                href="/admin/product?page=${currentPage-1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                            <li class="page-item">
                                                                <a class="page-link ${(loop.index) eq currentPage ? 'active' : ''}"
                                                                    href="/admin/product?page=${loop.index}">
                                                                    ${loop.index}
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                        <li class="page-item">
                                                            <a class="page-link ${totalPages eq currentPage ? 'disabled' : ''}"
                                                                href="/admin/product?page=${currentPage+1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav> -->

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