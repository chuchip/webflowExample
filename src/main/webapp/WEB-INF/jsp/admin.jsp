<%-- 
    Document   : admin
    Created on : 24-oct-2018, 21:25:49
    Author     : chuchip
--%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina del administrador</title>
    </head>
    <body>
        <h1>Pagina solo accesible por el administrador</h1>
        Contexto: <% out.println(request.getContextPath()); %>       
        <sec:authentication property="principal.authorities"/>   
        <div><a href="./index">Inicio</a></div>
    </body>
</html>
