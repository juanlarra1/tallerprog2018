<head>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
</head>
{foreach from=$errores item=error}

    <div class="alert alert-danger" role="alert">
        {$error}
    </div>

{/foreach}
<div class="col-md-4"></div>
<div class="col-md-8">


    <ul id="seccionCategorias" class="container col-md-6 border thin solid black">
        <a href="index.php?op=categoria/listado"><h3>Categorias</h3></a>
        {foreach from=$categorias item=categoria}
            <li class="list-group-item text-center">
                <h2>{$categoria['nombre']}</h2>

                {if $categoria['eliminado'] eq 0}
                    <form method="POST"
                          action="index.php?op=categoria/modificarCategoria&categoria={$categoria['categoria_id']}"
                          id="formulario">


                            <input type="text" class="form-control text-center" name='txtNomCategoriaNuevo'
                                   placeholder="Nuevo nombre de categoria" >


                        <br>
                        <input type="submit" value="Modificar" id="btnGuardarCambios" class="btn-primary btn-lg">

                    </form>
                    <br>
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
        <ul class="pager" id="userPager">
            <li><a href="index.php?op=categoria/listado&pag={$numPag-1}">Previous</a></li>
            <li><a href="index.php?op=categoria/listado&pag={$numPag+1}">Next</a></li>
        </ul>

    </ul>

</div>
<div class="col-md-4"></div>