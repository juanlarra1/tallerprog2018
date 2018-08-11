<!DOCTYPE html>

<html>
    <head>
        <title>Alta Publicacion</title>
        <script src="recursos/js/registroPublicacion.js" type="text/javascript"></script>
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

                </div>
                <input type="submit" value="Guardar" id="btnGrabarCategoria" class="btn-primary btn-lg">
                <input type="reset" value="Cancelar" id="btnCancelarCategoria" class="btn-primary btn-lg">
            </form>
        </div>
    </body>
</html>
