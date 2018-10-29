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

            $.each(parameters, function (key, value) {
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
                <div class="row">                   
                    <div class="bg-light border col-8 h4 text-center">
                        Bienvenido a tu Banco Virtual
                    </div>

                    <div class="bg-primary border col-4  text-right">
                        Bienvenido:<b>${usuario.getNombre()}</b>
                    </div>
                </div>
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
          
        
                <%
                    if (request.getParameter("transferencia") != null)
                    {
                        int swTransf=Integer.parseInt(request.getParameter("transferencia"));
                %>
                <div class="alert alert-warning">
                <%
                        if (swTransf==1 )
                        {
                            out.println("Transferencia Realizada con exito");
                        }
                        else
                        {
                            out.println("Transferencia cancelada");
                        }
                %>
                </div>
                <%
                    }
                %>
                
          
            <sec:authorize access="!isAuthenticated()">      
                 <div class="row">                   
                    <div class="bg-light border col h4 text-center ">
                        Bienvenido a tu Banco Virtual
                    </div>
                 
                </div>
                <c:set var="error" value="false"/>
                <%
                    if (request.getParameter("error") != null) {
                %>
                <c:set var="msgError" value="Error. USUARIO O CONTRASEÑA NO es valida"/>
                <c:set var="error" value="true"/>
                <%
                    }
                %>    
                
                <div class="row justify-content-center border">   
                    <div class="col">
                        <c:if test="${error}">
                        <div class="alert alert-warning">
                            ${msgError}
                        </div>
                        <div class="w-100"></div>
                        </c:if>                       
                    </div>
                </div>
                <div class="row justify-content-center border">   
                    <form name='f' action="login" method='POST'>      
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="col">
                            <label class="etiqueta" for="User"> User:</label>
                            <input type='text' name='username' value=''>
                        </div>

                        <div class="w-100"></div>
                        <div class="col">
                            <label class="etiqueta"  for="password">Password:</label>
                            <input type='password' name='password' />
                        </div>
                        <div class="w-100"></div>
                        <div class="col text-center">
                            <input class="btn btn-primary" name="submit" type="submit" value="submit" />
                        </div>

                    </form>
                </div>
            </sec:authorize>
            <div style="text-align: center">
                <img  alt="Image" src="${context}/resources/img/banco.jpg">                
            </div>
        </div>
    </body>
</html>
