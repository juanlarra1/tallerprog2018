<head>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
</head>

<div class="col-md-3"></div>
<div class="col-md-8">
    
                
    <ul id="seccionCategorias" class="container col-md-6 border thin solid black">
        <a href="index.php?op=categoria/listado"><h3>Categorias</h3></a>
        {foreach from=$categorias item=categoria}
           
                <li class="list-group-item">
                 <p>{$categoria['nombre']}</p>
                                   
                 {if $categoria['eliminado'] eq 0 }  
                <form method="POST" action="index.php?op=categoria/updadeCategoria" id="formulario">     
                
                <div id="modifCategoria" style="visibility: visible">
                     <input id="txtNomCategoriaNuevo" type="text" value="">                     
                 </div>
                
                   <a href="index.php?op=categoria/updadeCategoria&categoria={$categoria['categoria_id']}" class="btn btn-primary btn-sm active"
                   role="button" aria-pressed="true"><i class="glyphicon glyphicon-pencil"></i>Modificar</a>
                    <a href="index.php?op=categoria/deleteCategoria&categoria={$categoria['categoria_id']}" class="btn btn-primary btn-sm active"
                   role="sub" aria-pressed="true"><i class="glyphicon glyphicon-trash"></i>Eliminar</a>
                  
                </form>
                  {else}
                  
                    <a href="index.php?op=categoria/activarCategoria&categoria={$categoria['categoria_id']}" class="btn btn-primary btn-sm active"
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