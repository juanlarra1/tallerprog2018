
<div class="col-md-3"></div>
<div  id="seccionFavoritos" class="container col-md-6 center-block border thin solid black">

    <a href="" alt="1" class="text-center"><h2>Favoritos</h2></a>

    {foreach from=$favoritos item=favorito}
        <div class="panel panel-warning">
            <div class="panel-heading">
                <a class="panel-title" href="index.php?op=publicacion/verPublicacion&id={$favorito['publicacion_id']}"><b>{$favorito['titulo']}</b></a>
            </div>
            <div class="panel-body">
                <p>{$favorito['texto']}...</p>
                <p><b>Fecha de publicacion:</b> {$favorito['fecha']}</p>
                <img src="img/{$favorito['imagen']}" height="50px" alt=""/>
            </div>



        </div>
    {/foreach}

</div>
<div class="col-md-3"></div>