    <%--
      Created by IntelliJ IDEA.
      User: lukasz
      Date: 10.03.2023
      Time: 13:25
      To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <h1 class="h3 mb-4 text-gray-800">UTWÓRZ UŻYTKOWNIKA</h1>
    <form action="/userAdd" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Name</label>
            <input type="name" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <small id="emailHelp" class="form-text text-muted">podaj nazwe użytkownika</small>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <small id="emailHelp" class="form-text text-muted">podaj swój email</small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1">
            <small id="emailHelp" class="form-text text-muted">podaj hasło</small>
        </div>
    <%--    <div class="form-group form-check">--%>
    <%--        <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
    <%--&lt;%&ndash;        <label class="form-check-label" for="exampleCheck1">Check me out</label>&ndash;%&gt;--%>
    <%--    </div>--%>
        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
    </form>


    <%@ include file="/footer.jsp" %>
