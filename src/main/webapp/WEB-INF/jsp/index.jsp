<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
        <c:set var="context" value="${pageContext.request.contextPath}" />   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    function post(path, parameters) {
       
        var form = $('<form></form>');

        form.attr("method", "post");
        form.attr("action", path);

        $.each(parameters, function(key, value) {
            var field = $('<input></input>');

            field.attr("type", "hidden");
            field.attr("name", key);
            field.attr("value", value);

            form.append(field);
        });
        var field = $('<input></input>');

        field.attr("type", "hidden");
        field.attr("name", "${_csrf.parameterName}");
        field.attr("value", "${_csrf.token}");

        form.append(field);
        // The form needs to be a part of the document in
        // order for us to be able to submit it.
        $(document.body).append(form);
        form.submit();
    }
</script>
        <%@include file="./_include.jsp" %>   
        <title>Bienvenido a tu banco virtual</title>
        
        <body  <sec:authorize access="!isAuthenticated()"> onload='document.f.username.focus();' </sec:authorize>  >
            <c:set var="context" value="${pageContext.request.contextPath}" />   
            <div class="container">    
                <sec:authorize access="isAuthenticated()">
                  
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                         <div class="navbar-brand" href="#">BancoVirtual</div>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="./traspaso">Transferencia</a></p>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:post('./logout')">Logout</a>
                                </li>                               
                            </ul>
                        </div>
                    </nav>   
                </sec:authorize>
                <div class="row">
                   <div class="col font-weight-bold jumbotron text-center">
                        Bienvenido a tu Banco Virtual&nbsp;                 
                        <sec:authorize access="isAuthenticated()">                       
                            <span><b>${usuario.getNombre()}</b></span>
                        </sec:authorize>
                    </div>
                </div>
                <sec:authorize access="!isAuthenticated()">
                 <!--
                 <h3 style="text-align: center">No esta autentificado</h3>
                 -->
                    <div class="row">     
                      <%
                        if (request.getParameter("error")!=null)
                        {
                            out.println("<div class='row'>"
                                + "<b>Error. USUARIO O CONTRASEÑA NO es valida!</b>"
                                +"</div>");
                        }
                        else
                        {
                            out.println("Introduzca su usuario y contraseña");
                        }
                    %>
                    </div>                                                 
                    <jsp:include page="./login_form.jsp" />                    
                </sec:authorize>
                <img alt="Image" src="${context}/resources/img/banco.jpg">
                <%--
                <p></p>
                 <div>Nombre: ${usuario.getNombre()}</div>
                  <c:set var = "salary" scope = "session" value = "${2000*2}"/>     
                 <% out.println("Hola");%>
                 <div>Valor salario: ${salary}</div>
                 <p> usuario: <c:out value="${salary}" /> </p>         
                <p> Password: <c:out value="${usuario.getPassword()}" /> </p> 
                --%>
            </div>
        </body>
</html>
