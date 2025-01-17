<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Manager Students</title>

          <link href="/css/layout.css" rel="stylesheet" />
          <link rel="stylesheet" href="/css/admin/list.css" />
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        </head>

        <body>
          <jsp:include page="../layout/layout.jsp" />
          <div class="container-main">
            <main>
              <div class="main-header">
                <div class="main-header-title">
                  <h2>
                    <i class="fa-solid fa-user-secret"></i>
                    <span>student management</span>
                  </h2>
                  <p>View Student</p>
                </div>
                <div class="main-header-routing">
                  <i class="fa-solid fa-house"></i>
                  /
                  <a href="/admin">DashBoard</a>
                  / Student
                </div>
              </div>

              <div class="main-content">
                <div class="main-content-wrapper">
                  <div class="main-content-table">
                    <div class="table-header">
                      <h2>Student View Board</h2>
                    </div>
                    <div class="table-main">
                      <div class="table-search">
                        <span>Tìm kiếm danh sách sinh viên:</span>
                        <div class="table-search-main">
                          <div class="search">
                            <input type="text" placeholder="Nhập mã số hoặc tên" id="searchInput" />
                          </div>
                          <button id="btnSearch">
                            <i class="fa-solid fa-star icon-search"></i>
                          </button>
                        </div>
                      </div>
                      <table>
                        <thead>
                          <tr>
                            <th>mssv</th>
                            <th>name</th>
                            <th>sex</th>
                            <th>phone</th>
                            <th>email</th>
                            <th>action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:if test="${empty students}">
                            <tr>
                              <td colspan="6" class="no-data">Không tìm thấy kết quả phù hợp</td>
                            </tr>
                          </c:if>
                          <c:forEach var="student" items="${students}">
                            <tr>
                              <th>${student.studentId}</th>
                              <td>
                                <img src="<c:choose>
                                  <c:when test='${empty student.avatar}'>
                                    https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png
                                  </c:when>
                                  <c:otherwise>
                                    /images/student/${student.avatar}
                                  </c:otherwise>
                                </c:choose>" alt="user" />
                                <span>${student.fullName}</span>
                              </td>
                              <td>${student.gender}</td>
                              <td>${student.phone}</td>
                              <td>${student.user.email}</td>
                              <td>
                                <button>
                                  <a href="/admin/student/${student.id}">View</a>
                                </button>
                                <button>
                                  <a href="/admin/student/update/${student.id}">Update</a>
                                </button>
                                <button>
                                  <a href="/admin/student/delete/${student.id}">Delete</a>
                                </button>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div id="button-create-teacher">
                <a href="/admin/student/create">
                  <i class="fa-solid fa-plus"></i>
                </a>
              </div>
            </main>
          </div>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

          <script src="/js/layout.js"></script>
          <script src="/js/main.js"></script>
          <script>
            document.querySelectorAll(".nav-item")[2].classList.add("active");
          </script>
        </body>

        </html>