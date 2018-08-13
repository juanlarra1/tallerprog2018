<div class="container">


    <h1 class="my-4">RECETAS
        <small>Blog de Cocina presenta:</small>
    </h1>


    {foreach from=$publicaciones item=publicacion}
        <div class="row">
            <div class="col-md-6">
                <a href="#">
                    <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/500x300"
                         alt="RECETAAAAAAAAAAAAAAAAAA">
                </a>
            </div>
            <header class="text-left">
                <div class="comment-user"><i class="glyphicon glyphicon-user"></i> Autor:</div>
                <div class="comment-user"><i class="glyphicon glyphicon-glass"></i>
                    Categoria: {$publicacion['categoria_id']} </div>
                <div class="comment-user"><i class="glyphicon glyphicon-flag"></i> Tipo: {$publicacion['tipo_id']}
                </div>
                <time class="comment-date" datetime="16-12-2014 01:05"><i
                            class="glyphicon glyphicon-time"></i> {$publicacion['fecha']}
                </time>

            </header>
            <div class="col-md-6">
                <a href="index.php?op=publicacion/verPublicacion&id={$publicacion['publicacion_id']}">{$publicacion['titulo']}</a>
                <p>{$publicacion['texto']}</p>


            </div>
            <a class="btn btn-primary"
               href="index.php?op=publicacion/verPublicacion&id={$publicacion['publicacion_id']}">Ver Receta</a>

        </div>
        <hr>
    {/foreach}


    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
            </a>
        </li>
    </ul>

</div>
