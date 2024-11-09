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
                <title>Create Class</title>

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
                                <h1 class="mt-4">Create Class</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/class">Classes</a> / Create</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a class</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/class/create"
                                                modelAttribute="newClass">

                                                <div class="row g-3">
                                                    <c:set var="errorClassId">
                                                        <form:errors path="classId" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-md-3">
                                                        <label class="form-label">Mã lớp:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorClassId ? 'is-invalid' : ''}"
                                                            path="classId" />
                                                        ${errorClassId}
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label class="form-label">Tên lớp:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                            path="name" />
                                                        ${errorName}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Giảng viên dạy:</label>
                                                        <form:select class="form-select" path="teacher.id">
                                                            <c:forEach var="teacher" items="${teachers}">
                                                                <form:option value="${teacher.id}">${teacher.fullName}
                                                                </form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
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