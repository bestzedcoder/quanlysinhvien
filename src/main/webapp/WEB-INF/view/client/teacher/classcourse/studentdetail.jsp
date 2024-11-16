<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Quản lý sinh viên" />
                <meta name="author" content="Quản lý sinh viên" />
                <title>Student Grade</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Student Grade</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/teacher">Dashboard</a> / <a
                                            href="/teacher/class-course">Class Courses</a> / <a
                                            href="/teacher/class-course/${newGrade.classCourse.id}">Infor</a> / Grade
                                    </li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Điểm sinh viên ${newGrade.student.fullName}</h3>
                                            <hr />
                                            <form:form method="post"
                                                action="/teacher/class-course/${newGrade.classCourse.id}/${newGrade.student.id}"
                                                modelAttribute="newGrade">
                                                <div class="mb-3" style="display: none">
                                                    <label class="form-label">ID:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-md-4">
                                                        <label class="form-label">Điểm giữa kỳ:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="midtermSorce" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Điểm cuối kỳ:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="finalSorce" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Điểm tổng kết:</label>
                                                        <form:input type="email" class="form-control" path="totalSorce"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </div>
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