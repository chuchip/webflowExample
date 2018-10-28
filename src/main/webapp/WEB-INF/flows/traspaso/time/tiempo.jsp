<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../_include.jsp" %>   
        <title>Introducir Periocidad Traspaso</title>
    </head>
    <body>
      <div class="container">    
          
          
            <div class="row justify-content-center">
                
                <form method="post" action="${flowExecutionUrl}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="_eventId" value="salir">
                    <div class="form-group">                 
                        <label class="etiqueta" for="Cuenta">Cuenta </label>
                        <input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaOrigen}" disabled >
                    </div>
                    <div class="form-group">
                        <label class="etiqueta" for="Importe">Introduzca Importe </label>
                        <input class="importe" type="text" name="importe" value="${traspasoBean.importe}"  disabled>                                       
                    </div>
                     <div class="form-group">
                        <label class="etiqueta" for="CuentaDestino">Cuenta Destino </label>
                        <input type="text" name="cuentaOrigen" value="${traspasoBean.cuentaFinal}" disabled >
                    </div>
                    <div class="form-group">
                        <label class="etiqueta" for="Periodico">Traspaso Periodico</label>
                        <input type="checkbox" name="periodico"  checked disabled>
                    </div>
                    <div class="form-group">
                         <label class="etiqueta" for="FechaTraspaso">Fecha Traspaso</label>
                         <input type="date" name="fechaTraspaso"  value="${traspasoBean.fechaTraspaso}">
                    </div>
                     <div class="form-group">
                         <label class="etiqueta" for="FechaFinal">Hasta Fecha</label>
                         <input type="date" name="fechaFinal"  value="${traspasoBean.fechaFinal}">
                    </div>
                    <div class="col">
                        <input class="btn btn-primary" type="submit" value="Siguiente" />&nbsp;
                        <a class="nav-link" href="${flowExecutionUrl}&_eventId=cancel">Cancelar</a>
                    </div>
                    
                </form>
            </div>
            
        </div>
    </body>
</html>
