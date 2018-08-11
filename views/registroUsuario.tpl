<div class="container">
    <div class="row">
        <div class="col-sm">
        </div>
        <div class="col-sm">
            <div class="col-md-6 col-md-offset-3">  
                <h1> Registro de usuario</h1>

                <form method="POST" action="index.php?op=usuario/registro" id="formUsuario" >
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label> 
                        <input type="text" id="txtNombre" name="txtNombre" value="" class="form-control mx-sm-3">
                        {if $userModel->errors['nombre'] }

                            {foreach from=$userModel->errors['nombre'] item=error} 
                                <div class="panel panel-warning">
                                    {$error} 
                                </div>
                            {/foreach}
                        {/if}
                    </div>
                    <div class="form-group">
                        <label for="txtEmailUsuario">Email:</label> 
                        <input type="text" id="txtEmailUsuario" name="txtEmailUsuario" value="" class="form-control mx-sm-3">
                        {if $userModel->errors['email'] }

                            {foreach from=$userModel->errors['email'] item=error} 
                                <div class="panel panel-warning">
                                    {$error} 
                                </div>
                            {/foreach}
                        {/if}
                    </div>

                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        <input type="password" id="txtPassword" name="txtPassword" class="form-control mx-sm-3" >

                        <small class="text-muted">
                            <input type="checkbox" onclick="" class="form-check-input"> Mostrar Contraseña
                        </small>
                        {if $userModel->errors['password'] }

                            {foreach from=$userModel->errors['password'] item=error} 
                                <div class="panel panel-warning">
                                    {$error} 
                                </div>
                            {/foreach}
                        {/if}

                    </div>

                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="customControlInline"  name="chkAdmin" value="1" />
                        <label class="custom-control-label" for="customControlInline">Administrador</label>
                    </div>
                    <input type="submit" value="Guardar" id="btnGrabarUsuario" class="btn-primary btn-lg">
                    <input type="reset" value="Cancelar" id="btnCancelarUsuario" class="btn-primary btn-lg">
                </form>
            </div>
            <div class="col-sm">
            </div>
        </div>
    </div>

</div>



