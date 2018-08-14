<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
<div class="container">

    <div class="form-row text-center">


        <div class="col-lg-12">

            <div class="card mt-4">
                <img src="img/{$publicacion['imagen']}" height="400px" width="900px" alt=""/>
                <br>
                <div class="form-row text-center">
                    <div class="col-12">
                        <br>
                        <button type="button" class="btn btn-default btn-lg">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Añadir a favoritos
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <h3 class="card-title">{$publicacion['titulo']}</h3>
                    <span class="label label-warning">{$categoria}</span>
<br><br />
                    <p class="well well-lg">{$publicacion['texto']}</p>
                    <div class="card-body"></div>
                    
                </div>
            </div>


            <!-- COMENTARIOS ACA ABAJO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            <p class="lead">Comentarios</p>
            
             <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='index.php?op=comentario/registro'">
                 <span class="glyphicon glyphicon-plus" id="{$publicacion['publicacion_id']}" aria-hidden="true"></span> Añadir comentario
                        </button>
            <article class="row">
            {foreach from=$comentarios item=comentario}
    
                <div class="col-md-12 col-sm-10">
                    <div class="panel panel-default arrow left">
                        <div class="panel-body">
                            <header class="text-left">
                                <div class="comment-user"><i class="glyphicon glyphicon-user"></i>{$comentario['nombre']}</div>
                                <time class="comment-date" datetime="16-12-2014"><i
                                            class="glyphicon glyphicon-time"></i>  {$comentario['fecha']}
                                </time>
                            </header>
                            <div class="comment-post">
                                <p>
                                  {$comentario['detalle']}          
                                </p>
                                
                                <header class="text-left">
                                    <div class="comment-post arrow left"><i class="glyphicon glyphicon-share-alt"></i>Respuesta:</div>
                               </header>     
                                <div class="comment-post" > <br>
                                        <p>
                                               {$comentario['respuesta']}
                                        </p>
                                    </div>
                             
                  
                            </div>
                        </div>
                    </div>
                </div>
                
                {/foreach}
            </article>

        </div>


    </div>

</div>


