 <div  id="seccionRecetas" class="container col-md-6 border thin solid black">
    
        <a href="index.php?op=publicacion/listado&tipoPublicacion=1" alt="1"><h3>Recetas</h3></a>
 
    {foreach from=$recetas item=receta} 
    <div class="panel panel-warning">
        <div class="panel-heading">
            <a class="panel-title" href="index.php?op=publicacion/verPublicacion&id={$receta['publicacion_id']}"><b>{$receta['titulo']}</b></a>
        </div>
        <div class="panel-body">
            <p>{$receta['texto']}</p>
            <p><b>Fecha de publicacion:</b> {$receta['fecha']}</p>
            <img src="img/{$receta['imagen']}" height="50px" alt=""/>
        </div>
      </div>
    {/foreach}

</div>

<div  id="seccionNotas" class="container col-md-6 border thin solid black">
     <a href="index.php?op=publicacion/listado&tipoPublicacion=2"><h3>Notas</h3></a>
 
    {foreach from=$notas item=nota} 
    <div class="panel panel-warning">
        <div class="panel-heading">
            <a class="panel-title" href="index.php?op=publicacion/verPublicacion&id={$nota['publicacion_id']}"><b>{$nota['titulo']}</b></a>
        </div>
        <div class="panel-body">
            <p>{$nota['texto']}</p>
            <p><b>Fecha de publicacion:</b> {$nota['fecha']}</p>
             <img src="img/{$nota['imagen']}" height="50px" alt=""/>
        </div>
      </div>
    {/foreach}

</div>

