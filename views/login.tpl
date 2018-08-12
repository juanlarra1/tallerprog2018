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
                            <a href="#" id="register-form-link">Registro Usuario</a>
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
                            {include file="registroUsuario.tpl"}    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>