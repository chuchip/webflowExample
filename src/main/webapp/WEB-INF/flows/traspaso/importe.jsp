
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./_include.jsp" %>   
        <title>Introduzca Importe</title>
    </head>
    <body>
        <div class="container">    
           <jsp:include page="./_navegador.jsp" /> 
          
            <div class="row justify-content-center">                
                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="salir">
                    <div class="form-group">                 
                        <label class="etiqueta" for="Cuenta">Cuenta </label>
                        <input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaOrigen}" disabled >
                    </div>
                    <div class="form-group">
                        <label class="etiqueta"  for="Importe">Introduzca Importe </label>
                        <input type="text" class="importe" name="importe" value="${traspasoBean.importe}"  placeholder="Importe Traspaso" required>    
                        <c:if test="${traspasoBean.getMsgImporte()!=null}">
                            <div class="alert alert-warning">
                                <strong>Atencion!</strong> ${traspasoBean.getMsgImporte()}
                            </div>
                        </c:if>                    
                    </div>
                    <div class="form-group">
                         <label class="etiqueta"  for="Periodico">Traspaso Periodico</label>
                         <input type="checkbox" name="periodico" value="true"
                           <c:if test="${traspasoBean.periodico}">
                                checked 
                           </c:if>
                         >
                    </div>
                    <div class="col">
                        <input class="btn btn-primary" type="submit" value="Siguiente" />&nbsp;
                    </div>
                </form>
            </div>
            
        </div>
    </body>
</html>
