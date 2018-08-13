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
                </div>
            </div>


            <!-- COMENTARIOS ACA ABAJO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            <p class="lead">Comentarios</p>
            <article class="row">

                <div class="col-md-12 col-sm-10">
                    <div class="panel panel-default arrow left">
                        <div class="panel-body">
                            <header class="text-left">
                                <div class="comment-user"><i class="glyphicon glyphicon-user"></i> That Guy</div>
                                <time class="comment-date" datetime="16-12-2014 01:05"><i
                                            class="glyphicon glyphicon-time"></i> Dec 16, 2014
                                </time>
                            </header>
                            <div class="comment-post">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </article>

        </div>


    </div>

</div>


