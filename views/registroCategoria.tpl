<div class="col-md-6 col-md-offset-3">
    <h1> Alta Categoria</h1>
    <br><br>
    <form method="POST" action="index.php?op=categoria/registro" id="formCategoria">

        <div class="form-group">
            <label for="txtNombreCategoria">Nombre:</label>
            <input type="text" id="txtNombreCategoria" name="txtNombreCategoria" value="" class="form-control">
            <div id="errorNombreC" name="errorNombreC" class=""></div>
        </div>

        <input type="submit" value="Guardar" id="btnGrabarCategoria" class="btn-primary btn-lg">
        <input type="reset" value="Cancelar" id="btnCancelarCategoria" class="btn-primary btn-lg">
    </form>
</div>
