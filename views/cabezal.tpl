<div>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="pointer-events: none;"><img src="img/gastronomia.png"
                                                                           alt="logo de gastronomia"
                                                                           style="display: inline-block; align-items: center"
                                                                           height="30px"/>Blog de Gastronomia</a>
            </div>
            <ul class="nav navbar-nav">

                <li class="active"><a href="index.php">Home</a></li>


                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="index.php?op=publicacion/listado">Publicaciones
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.php?op=publicacion/listado">Ver Todas</a></li>
                        {if !empty($smarty.session.user)}
                            <li><a href="index.php?op=favorito/listado">Favoritos</a></li>
                        {/if}

                        {if $smarty.session.user.esAdmin eq true}
                            <li><a href="index.php?op=publicacion/registro">Alta</a></li>
                            <li><a href="index.php?op=publicacion/listadoBP">Mantenimiento </a></li>
                        {/if}
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">Categorias
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.php?op=publicacion/listado&tipoPublicacion=2">Notas</a></li>
                        <li><a href="index.php?op=publicacion/listado&tipoPublicacion=1">Recetas</a></li>
                        {if $smarty.session.user.esAdmin eq true}
                            <li><a href="index.php?op=categoria/registro" target="blank">Alta</a></li>
                            <li><a href="index.php?op=categoria/listado" target="blank">Mantenimiento</a></li>
                        {/if}
                    </ul>
                </li>
                {if $smarty.session.user.esAdmin eq true}
                    <li><a href="index.php?op=admin/listado">Administrar Usuarios</a></li>
                {/if}

            </ul>
            <ul class="nav navbar-nav navbar-right">
                {if !empty($smarty.session.user)}
                    <li><a href="index.php?op=site/logout"><span class="glyphicon glyphicon-user"></span>Salir</a></li>
                    <p class="text-warning"> Bienvenido {$smarty.session.user.email}</p>
                {else}
                    <li><a href="index.php?op=site/login"><span class="glyphicon glyphicon-log-in"></span>
                            Login/Registro</a>
                    </li>
                {/if}
            </ul>
        </div>
    </nav>
</div>
   




