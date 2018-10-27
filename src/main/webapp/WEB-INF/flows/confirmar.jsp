
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./_include.jsp" %>   
        <title>Confirme Traspaso</title>
    </head>
    <body>
        <div class="container">    
            <div class="font-weight-bold jumbotron text-center">Confirme Traspaso</div>


                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="salir">                                        
                    <div class="row justify-content-center">
                        <div class="col col-lg-2">Cuenta Origen: </div>
                        <div class="col"><input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaOrigen}" disabled></div>                    
                        <div class="w-100"></div>
                        <div class="col col-lg-2"> <label for="Importe">Introduzca Importe </label></div>
                        <div class="col"><input type="text" name="importe" value="${traspasoBean.importe}" disabled>      </div>
                        <div class="w-100"></div>
                        <div class="col col-lg-2">
                            <input class="btn btn-primary" type="submit" value="Siguiente" /></div>
                            <div class="col"><input type="button" class="btn btn btn-warning" value="Cancel" onclick="location.href = '${flowExecutionUrl}&_eventId=cancel';"></div>
                        </div>
                    </div>
                </form>
        </div>
    </body>
</html>
