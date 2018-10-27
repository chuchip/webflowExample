<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./_include.jsp" %>   
        <title>Realizar traspaso</title>
    </head>
    <body>
        <div class="container">    
            <div class="font-weight-bold jumbotron text-center">Realizar traspaso</div>

            <div class="row justify-content-center">
                
                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="activate">
                    <div class="col">
                        <label for="Cuenta">Elija Cuenta Origen: </label>
                        <select name="cuentaOrigen">
                            <c:forEach items="${cuentas}" var="item">
                                <option value="${item}">${item}</option>
                            </c:forEach>         
                        </select>
                    </div>
                   <input type="hidden" name="importe" value="${traspasoBean.importe}">         
                    <div class="col">
                        <input class="btn btn-primary" type="submit" value="Siguiente" />&nbsp;
                         <input type="button" class="btn btn btn-warning" value="Cancel" onclick="location.href = '${flowExecutionUrl}&_eventId=cancel';">
                    </div>
                </form>
            </div>
            
        </div>
    </body>
</html>
