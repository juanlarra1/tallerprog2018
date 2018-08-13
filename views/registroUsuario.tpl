<head>
    <script src="recursos/js/registroUsuario.js" type="text/javascript"></script>
</head>

<body>
<form id="registro-form" action="index.php?op=usuario/registro" method="post" role="form" style="display: none;">
    <div class="form-group">
        <input type="text" name="txtNombre" id="txtNombre" tabindex="1" class="form-control" placeholder="Nombre"
               value="">
        <div id="errorNombre" class=""></div>
    </div>
    {if $userModel->errors['nombre'] }

        {foreach from=$userModel->errors['nombre'] item=error}
            <div class="panel panel-warning">
                {$error}
            </div>
        {/foreach}
    {/if}
    <div class="form-group">
        <input type="email" name="txtEmailUsuario" id="txtEmailUsuario" tabindex="1" class="form-control"
               placeholder="Direccion de correo" value="">
        <div id="errorEmailU" class=""></div>
    </div>
    {if $userModel->errors['email'] }

        {foreach from=$userModel->errors['email'] item=error}
            <div class="panel panel-warning">
                {$error}
            </div>
        {/foreach}
    {/if}
    <div class="form-group">
        <input type="password" name="txtPassword" id="txtPassword" tabindex="2" class="form-control"
               placeholder="Contraseña">
        <div id="errorPassword" class=""></div>
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
                <input type="submit" name="register-submit" id="register-submit" tabindex="4"
                       class="form-control btn btn-register" value="Registrar">
            </div>
        </div>
    </div>
</form>
</body>