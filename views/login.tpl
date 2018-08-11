<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
<script src="recursos/js/login.js" type="text/javascript"></script>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form" action="index.php?op=site/login" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="txtLoginEmail" id="email" tabindex="1" class="form-control" placeholder="Correo Electronico" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="txtLoginPassword" id="loginpassword" tabindex="2" class="form-control" placeholder="Contraseña">
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                        </div>
                                    </div>
                                </div>
               
                            </form>
                            <form id="registro-form" action="index.php?op=usuario/registro" method="post" role="form" style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="txtNombre" id="txtNombre" tabindex="1" class="form-control" placeholder="Nombre" value="">
                                </div>
                                {if $userModel->errors['nombre'] }

                                    {foreach from=$userModel->errors['nombre'] item=error} 
                                        <div class="panel panel-warning">
                                            {$error} 
                                        </div>
                                    {/foreach}
                                {/if}
                                <div class="form-group">
                                    <input type="email" name="txtEmailUsuario" id="txtEmailUsuario" tabindex="1" class="form-control" placeholder="Direccion de correo" value="">
                                </div>
                                {if $userModel->errors['email'] }

                                    {foreach from=$userModel->errors['email'] item=error} 
                                        <div class="panel panel-warning">
                                            {$error} 
                                        </div>
                                    {/foreach}
                                {/if}
                                <div class="form-group">
                                    <input type="password" name="txtPassword" id="txtPassword" tabindex="2" class="form-control" placeholder="Contraseña">
                                </div>
                                {if $userModel->errors['password'] }

                                    {foreach from=$userModel->errors['password'] item=error} 
                                        <div class="panel panel-warning">
                                            {$error} 
                                        </div>
                                    {/foreach}
                                {/if}
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>