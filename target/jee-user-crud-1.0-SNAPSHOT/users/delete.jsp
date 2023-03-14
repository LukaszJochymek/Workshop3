<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 10.03.2023
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="/userDelete" method="post">


    <div class="form-group form-check">
        <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1" value="true">

        <input type="hidden" name="id" value="${param.id}">
        <label class="form-check-label" for="exampleCheck1">
            ZAZNACZ JEŻELI JESTEŚ PEWNY ŻE CHCESZ USUNĄC TEGO UŻYTKWNIKA</label>

        <button type="submit" name="submit" class="btn btn-primary">Usuń</button>
    </div>
</form>


<%@ include file="/footer.jsp" %>

