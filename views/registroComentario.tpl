<div class="col-md-6 col-md-offset-3">
    <h1> Nuevo Comentario</h1>
    <br><br>
    <form method="POST" action="index.php?op=comentario/registro" id="formComentario">

        <div class="form-group">
            <label for="txtDetalle">Detalle:</label>
            <input type="text" id="txtDetalle" name="txtDetalle" value="" class="form-control">           
        </div>

        <div class="form-group">
            <label for="txtRespuesta">Respuesta:</label>
            <input type="text" id="txtRespuesta" name="txtRespuesta" value="" class="form-control">
           
        </div>
        <input type="submit" value="Guardar" id="btnGrabarComentario" class="btn-primary btn-lg">
        <input type="reset" value="Cancelar" id="btnCancelarComentario" class="btn-primary btn-lg">
    </form>
</div>
