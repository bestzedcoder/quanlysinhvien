<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Student Check Input Grade Term</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Student Check Input Grade Term</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / Student
                                            Check Input Grade Term</li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Bảng điểm kỳ mới nhất</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">MSSV</th>
                                                            <th scope="col">Mã lớp</th>
                                                            <th scope="col">Môn học</th>
                                                            <th scope="col">Trọng số QT</th>
                                                            <th scope="col">Điểm QT</th>
                                                            <th scope="col">Trạng thái điểm QT</th>
                                                            <th scope="col">Điểm thi</th>
                                                            <th scope="col">Trạng thái điểm thi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="studentGradeDTO" items="${studentGradeDTOs}">
                                                            <tr>
                                                                <td>${studentGradeDTO.studentId}</td>
                                                                <td>${studentGradeDTO.classCourseId}</td>
                                                                <td>${studentGradeDTO.courseName}</td>
                                                                <td>${studentGradeDTO.processWeight}</td>
                                                                <td>${studentGradeDTO.midtermPoint}</td>
                                                                <td>${studentGradeDTO.statusMidtermPoint}</td>
                                                                <td>${studentGradeDTO.finalPoint}</td>
                                                                <td>${studentGradeDTO.statusFinalPoint}</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
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