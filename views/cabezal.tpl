<div>
    <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">                
                <a class="navbar-brand" style="pointer-events: none;"><img src="img/gastronomia.png" alt="logo de gastronomia" style="display: inline-block; align-items: center" height="30px"/>Blog de Gastronomia</a>
            </div>
            <ul class="nav navbar-nav">

              <li class="active"><a href="index.php">Home</a></li>
              <li><a href="index.php?op=usuario/listado">Listar Usr</a></li>
              <li><a href="index.php?op=usuario/registro">Registrar Usuario</a></li>
               <li><a href="index.php?op=publicacion/listado">Listado Publicaciones</a></li>
              {if $smarty.session.user.isAdmin eq true}
              <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown">Administrar Categorias
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.php?op=categoria/crear" target="blank">Alta</a></li>
                       <li><a href="index.php?op=categoria/index" target="blank">Alta</a></li>
                    </ul>
              </li>
              <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Administrar Publicaciones
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="index.php?op=publicacion/crear">Alta</a></li>
                      <li><a href="#">Baja </a></li>
                      <li><a href="#">Modificacion</a></li>
                    </ul>
              </li>
        {/if}     
            </ul>
            <ul class="nav navbar-nav navbar-right">
                {if !empty($smarty.session.user)}  
              <li><a href="index.php?op=site/logout"><span class="glyphicon glyphicon-user"></span>Salir</a></li>
              {else}  
                
              <li><a href="index.php?op=site/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
           {/if}
                </ul>
          </div>
        </nav>
</div>
   




