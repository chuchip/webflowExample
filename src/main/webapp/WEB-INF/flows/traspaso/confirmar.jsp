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
            <jsp:include page="./_navegador.jsp" /> 
            <div class="row justify-content-center">
                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="salir">                                        
                    <div class="form-group">                 
                        <label class="etiqueta" for="Cuenta"> Cuenta Origen: </label>
                        <input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaOrigen}" disabled>
                    </div>                    
                    <div class="form-group">                                     
                        <label class="etiqueta" for="Importe">Introduzca Importe </label>
                        <input type="text" class="importe" name="importe" value="${traspasoBean.importe}" disabled>
                    </div>
                      <div class="form-group">
                        <label class="etiqueta" for="CuentaDestino">Cuenta Destino </label>
                        <input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaFinal}" disabled >
                    </div>
                    <div class="form-group">  
                        <label class="etiqueta" for="Periodo">Traspaso Periodico</label>
                        <input type="checkbox" name="periodico" 
                               <c:if test="${traspasoBean.periodico}">                                   
                                   checked 
                               </c:if>
                               disabled >
                        <c:if test="${traspasoBean.periodico}">           
                            <div class="form-group">
                                <label class="etiqueta" for="FechaTraspaso">Fecha Traspaso</label>
                                <input type="date" name="fechaTraspaso"  value="${traspasoBean.fechaTraspaso}" disabled>
                            </div>
                            <div class="form-group">
                                <label class="etiqueta" for="FechaFinal">Hasta Fecha</label>
                                <input type="date" name="fechaFinal"  value="${traspasoBean.fechaFinal}" disabled>
                            </div>
                        </c:if>
                    </div>

                    <div class="form-group">  
                        <input class="btn btn-primary" type="submit" value="Confirmar Traspaso" />
                    </div>                    
                </form>
            </div>
    </body>
</html>
