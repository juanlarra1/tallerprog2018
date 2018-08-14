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
                        <a href="index.php?op=publicacion/marcarFavPublicacion&publicacion={$publicacion['publicacion_id']}" class="btn btn-primary btn-lg active"
                             role="button" aria-pressed="true"><i class="glyphicon glyphicon-star"></i> Añadir a favoritos</a>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <h3 class="card-title">{$publicacion['titulo']}</h3>
                    <span class="label label-warning">{$categoria}</span>
                    <br><br/>
                    <p class="well well-lg">{$publicacion['texto']}</p>
                    <div class="card-body"></div>

                </div>
            </div>


            <p class="lead">Comentarios</p>


            <article class="row">
                {foreach from=$comentarios item=comentario}
                    <div class="col-md-12 col-sm-10">
                        <div class="panel panel-default arrow left">
                            <div class="panel-body">
                                <header class="text-left">
                                    <div class="comment-user"><i
                                                class="glyphicon glyphicon-user"></i>{$comentario['nombre']}</div>
                                    <time class="comment-date" datetime="16-12-2014"><i
                                                class="glyphicon glyphicon-time"></i> {$comentario['fecha']}
                                    </time>
                                </header>
                                <div class="comment-post">
                                    <p>
                                        {$comentario['detalle']}
                                    </p>

                                    <header class="text-left">
                                        <div class="comment-post arrow left"><i
                                                    class="glyphicon glyphicon-share-alt"></i>Respuesta del autor:
                                        </div>
                                    </header>
                                    <div class="comment-post"><br>
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
            {if !empty($smarty.session.user)}

                <form id="comment-form" action="index.php?op=publicacion/comentarPublicacion&id={$publicacion['publicacion_id']}" method="post" role="form" >


                    <label for="txtDetalleId">Comentar</label>
                    <textarea class="form-control" id="txtDetalleId" name="txtDetalle" rows="3"></textarea>

                    <button type="submit" class="btn btn-primary mb-2">Agregar Comentario</button>

                </form>
            {/if}
            <br><br/>
            <br><br/>
        </div>


    </div>

</div>


