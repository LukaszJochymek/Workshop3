<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 10.03.2023
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->

    <h1 class="h3 mb-4 text-gray-800">Szczegóły użytkownika</h1>
    <table class="table">
        <thead>
       
        </thead>
        <tbody>
        <%--            Początek petli--%>

            <tr>
                <th scope="row">ID</th>
                <td>${param.id}</td>

            </tr>
        <tr>
            <th scope="row">Nazwa użytkownika</th>
            <td>${param.userName}</td>
        </tr>
        <tr>
            <th scope="row">EMAIL</th>
            <td>${param.email}</td>

        </tr>

        <%--            koniec pętli--%>
        </tbody>
    </table>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="/footer.jsp" %>
