<head>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
</head>

<div class="col-md-3"></div>
<div class="col-md-8">
    
                
    <ul id="seccionPublicaciones" class="container col-md-6 border thin solid black">
        <a href="index.php?op=publicacion/listado"><h3>Publicaciones</h3></a>
        {foreach from=$publicaciones item=publicacion}
           
                <li class="list-group-item">
                 <p>{$publicacion['titulo']}</p>
                                   
                 {if $publicacion['eliminado'] eq 0 }  
                
                   <a href="index.php?op=categoria/updadeCategoria&categoria={$publicacion['publicacion_id']}" class="btn btn-primary btn-sm active"
                   role="button" aria-pressed="true"><i class="glyphicon glyphicon-pencil"></i>Modificar</a>
                    <a href="index.php?op=publicacion/deletePublicacion&publicacion={$publicacion['publicacion_id']}" class="btn btn-primary btn-sm active"
                   role="sub" aria-pressed="true"><i class="glyphicon glyphicon-trash"></i>Eliminar</a>
                  
                  {else}
                    <a href="index.php?op=publicacion/activarPublicacion&publicacion={$publicacion['publicacion_id']}" class="btn btn-primary btn-sm active"
                   role="button" aria-pressed="true"><i class="glyphicon glyphicon-ok"></i>Activar</a>
                      
                  {/if}
                
            
             </li>
            
        {/foreach}
           
      
    </ul>
    <ul class="pager" id="userPager">
        <li><a href="index.php?op=categoria/listado&pag={$pag-1}">Previous</a></li>
        <li><a href="index.php?op=categoria/listado&pag={$pag+1}">Next</a></li>
    </ul>
</div>