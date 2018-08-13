<div class="col-md-12">
    <div id="seccionRecetas" style="text-decoration:none;" class="container col-md-6 border thin solid black">
        <h2>Publicaciones</h2>
        <br>
        <div class="tipos">
            <label>Tipo: </label>
            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">tipos
                <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                {foreach from=$tiposPublicaciones item=tipo}
                    <li role="presentation"><a role="menuitem" tabindex="-1" style="text-decoration:none;"
                                               alt="{$tipo['id']}" href="">{$tipo['nombre']}</a></li>
                {/foreach}
            </ul>
        </div>
        <br>
    </div>

    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Titulo</th>
            <th scope="col">Texto</th>
            <th scope="col">Fecha</th>
            <th scope="col">Imagen</th>
            <th scope="col">Categoria</th>
            <th scope="col">Tipo</th>
        </tr>
        </thead>
        <tbody>
        {foreach from=$publicaciones item=publicacion}
            <tr>
                <td>{$publicacion['titulo']}</td>
                <td>{$publicacion['texto']}</td>
                <td>{$publicacion['fecha']}</td>
                <td><img src="img/{$publicacion['imagen']}" height="70px"/></td>
                <td>{$publicacion['categoria_id']}</td>
                <td>{$publicacion['tipo_id']}</td>
            </tr>
        {/foreach}
        </tbody>
    </table>

    <input type='button' id='btnIni' alt='1' value='<<'/>
    <input type='button' id='btnAnt' alt='' value='<'/>
    <span id="pagina">0</span> / <span id="pagUlt">0</span>
    <input type='button' id='btnSig' alt='' value='>'/>
    <input type='button' id='btnUlt' alt='' value='>>'/>


</div>

</div>