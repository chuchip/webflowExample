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

            <jsp:include page="./_navegador.jsp" /> 
            <div class="row justify-content-center ">
                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="activate">

                    <div class="form-group">                   
                        <label class="etiqueta" for="Cuenta">Elija Cuenta Origen: </label>
                        <select name="cuentaOrigen">
                            <c:forEach items="${cuentas}" var="item">
                                <option value="${item}">${item}</option>
                            </c:forEach>         
                        </select>
                    </div>
                    <div class="col ">
                        <input class="btn btn-primary" type="submit" value="Siguiente" />
                    </div>

                </form>
            </div>
        </div>           
    </body>
</html>
