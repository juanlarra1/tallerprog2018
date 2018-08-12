<!DOCTYPE html>

<html>
    <head>
        <title>Alta Publicacion</title>
        <script src="recursos/js/registroPublicacion.js" type="text/javascript"></script>
        <link href="librerias/Bootstrap/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="librerias/Bootstrap/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="col-md-6 col-md-offset-3">  
            <h1> Alta Publicación</h1>
            <br><br>

            <form method="POST" action="index.php?op=publicacion/registro" id="formPublicacion" >

                <div class="form-group">
                    <label for="txtTituloPublicacion">Titulo:</label> 
                    <input type="text" id="txtTituloPublicacion" name="txtTituloPublicacion" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label for="txtTextoPublicacion">Texto:</label> 
                    <input type="text" id="txtTextoPublicacion" name="txtTextoPublicacion" value="" class="form-control">
                </div>

                <div class="form-group"> <!-- Date input -->
                    <label class="control-label" for="date">Fecha Publicacion:</label>
                    <input class="form-control" id="date" name="date" placeholder="DD/MM/AAAA" type="text"/>
                </div>


                <div class="form-group">
                    <label for="txtImagenPublicacion">Imagen:</label> 
                    <input type="text" id="txtImagenPublicacion" name="txtImagenPublicacion" value="" class="form-control">
                </div>


                <div class="form-group">
                    <label for="txtCategoriaPublicacion">Categoria:</label> 
                    <select class="selectpicker" id="txtCategoriaPublicacion" name="txtCategoriaPublicacion">
                      {foreach from=$categorias item=categoria} 
                        <option>{$categoria['nombre']}</option>
                        {/foreach}
                      </select>


                </div>
                <input type="submit" value="Guardar" id="btnGrabarCategoria" class="btn-primary btn-lg">
                <input type="reset" value="Cancelar" id="btnCancelarCategoria" class="btn-primary btn-lg">
            </form>
        </div>
    </body>
</html>
