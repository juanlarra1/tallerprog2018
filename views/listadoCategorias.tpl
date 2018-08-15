<head>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
</head>
{foreach from=$errores item=error}

    <div class="alert alert-danger" role="alert">
        {$error}
    </div>

{/foreach}
<div class="col-md-3"></div>
<div class="col-md-8">


    <ul id="seccionCategorias" class="container col-md-6 border thin solid black">
        <a href="index.php?op=categoria/listado"><h3>Categorias</h3></a>
        {foreach from=$categorias item=categoria}
            <li class="list-group-item">
                <h2>{$categoria['nombre']}</h2>

                {if $categoria['eliminado'] eq 0}
                    <form method="POST"
                          action="index.php?op=categoria/modificarCategoria&categoria={$categoria['categoria_id']}"
                          id="formulario">

                        <div class="input-group mb-3" id="modifCategoria" style="visibility: visible">
                            <input type="text" class="form-control" name='txtNomCategoriaNuevo'
                                   placeholder="Nombre de categoria"
                                   aria-label="Recipient's username" aria-describedby="basic-addon2">
                        </div>


                        <input type="submit" value="Modificar" id="btnGuardarCambios" class="btn-primary btn-lg">

                    </form>
                    <form method="POST"
                          action="index.php?op=categoria/eliminarCategoria&categoria={$categoria['categoria_id']}"
                    ">
                    <input type="submit" value="Eliminar" id="btnEliminar" class="btn-primary btn-lg">
                    </form>
                {else}
                    <a href="index.php?op=categoria/activarCategoria&categoria={$categoria['categoria_id']}"
                       class="btn btn-primary btn-sm active"
                       role="button" aria-pressed="true"><i class="glyphicon glyphicon-ok"></i>Activar</a>
                {/if}


            </li>
        {/foreach}


    </ul>
    <ul class="pager" id="userPager">
        <li><a href="index.php?op=categoria/listado&pag={$numPag-1}">Previous</a></li>
        <li><a href="index.php?op=categoria/listado&pag={$numPag+1}">Next</a></li>
    </ul>
</div>