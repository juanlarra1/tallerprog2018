<head>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

</head>
<div class="col-md-2"></div>
<div class="col-md-8">
    <h2 class="text-center">Publicaciones</h2>
    <form action="index.php?op={$entidad}/listado" id="listForm">
        <div id="seccionRecetas" style="text-decoration:none;" class="container col-md-6 border thin solid black">


            <div class="container">

                <div class="row">


                    <div class="col-md-8">

                        {foreach from=$publicaciones item=publicacion}
                            <div class="card mb-4">
                                <img class="card-img-top" src="img/{$publicacion['imagen']}" height="300px" width="700">
                                <div class="card-body">
                                    <h2 class="card-title">{$publicacion['titulo']}</h2>
                                    <p class="card-text">{$publicacion['texto']}</p>

                                    <a href="index.php?op=publicacion/verPublicacion&id={$publicacion['publicacion_id']}" class="btn btn-primary">Leer mas &rarr;</a>
                                </div>
                                <div class="card-footer text-muted">
                                    Posteado el {$publicacion['fecha']} por
                                    <a href="#">Start Bootstrap</a>
                                </div>
                            </div>
                            <br>
                        {/foreach}

                    </div>


                    <div class="col-md-4">
                        <h2>Filtros</h2>
                        <div class="card my-4">
                            <label for="Tipo de publicacion">Categorias</label>
                            <select class="form-control" name="tipo" onchange="loadListado(this)" data-page="1">
                                <option value="" {if $tipo['tipo_id'] == $model->tipo}selected{/if} data-page="1">
                                    Todos
                                </option>
                                {foreach from=$tipos item=tipo}
                                    <option value="{$tipo['tipo_id']}"
                                            {if $tipo['tipo_id'] == $model->tipo}selected{/if}>{$tipo['nombre']}</option>
                                {/foreach}
                            </select>
                            <br>

                            <label for="categoria">Categorias</label>
                            <select class="col-md-6 form-control" name="categoria" onchange="loadListado(this)"
                                    data-page="1">
                                <option value="" {if $categoria['categoria_id'] == $model->categoria}selected{/if}
                                        data-page="1">Todos
                                </option>
                                {foreach from=$categorias item=categoria}
                                    <option value="{$categoria['categoria_id']}"
                                            {if $categoria['categoria_id'] == $model->categoria}selected{/if}>{$categoria['nombre']}</option>
                                {/foreach}
                            </select>
                            <br>
                        </div>
                        <br>
                    </div>

                </div>
                <ul class="pager" id="pager">
                    <li><a href="#" data-page="{$pag -1}" onclick="loadListado(this)">Previous</a></li>
                    <li><a href="#" data-page="{$pag +1}" onclick="loadListado(this)">Next</a></li>
                </ul>
                <input type="hidden" name="pag">
            </div>

        </div>


</div>
</form>
<div class="col-md-2"></div>