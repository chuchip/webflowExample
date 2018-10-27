
<form name='f' action="login" method='POST'>      
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="border">
        <div class="row justify-content-center ">   
            <div class="col-1">
                <label for="User"> User:</label>
            </div>
            <div class="col-2">
                <input type='text' name='username' value=''>
            </div>
       
        <div class="w-100"></div>
            <div class="col-1">
                <label for="password">Password:</label>
            </div>
            <div class="col-2">
                <input type='password' name='password' />
            </div>
         <div class="w-100"></div>
            <div class="col-2">
                <input class="btn btn-primary" name="submit" type="submit" value="submit" />
            </div>
       </div>
    </div>
</form>

