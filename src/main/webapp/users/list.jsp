<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 10.03.2023
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <a href="/users/add.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Dodaj Użytkownika</a>
                <h1 class="h3 mb-4 text-gray-800">Lista Użytkowników</h1>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Nazwa</th>
                        <th scope="col">Email</th>
                        <th scope="col">Akcja</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--            Początek petli--%>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <th scope="row">${user.id}</th>
                            <td>${user.userName}</td>
                            <td>${user.email}</td>
                            <td><a href='<c:url value="/users/delete.jsp?id=${user.id}"/>'>Usuń użytkownika</a>
                                <a href='<c:url value="/users/edit.jsp?id=${user.id}&userName=${user.userName}&email=${user.email}"/>'>edytuj użytkownika</a>
                                <a href='<c:url value="/users/show.jsp?id=${user.id}&userName=${user.userName}&email=${user.email}"/>'>wyświetl użytkownika</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <%--            koniec pętli--%>
                    </tbody>
                </table>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->
<%@ include file="/footer.jsp" %>
