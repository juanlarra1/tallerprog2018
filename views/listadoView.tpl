<div class="col-md-3"></div>
<div class="col-md-8">
    <select class="custom-select" id="{$entidad}Filter">
        {foreach from=$filters item=filterOption}
        <option {if $esAdmin eq "" } selected {/if} value={$filterOption['valor']}>{$filterOption['nombre']}</option>
        {/foreach}
    </select>

    <ul id="seccion{$entidad}" class="container col-md-6 border thin solid black">
        <a href="index.php?op={$entidad}/listado"><h3>{$entidad['nombre']}</h3></a>
        {foreach from=$users item=user}
        <li class="list-group-item">
            <p>{$user['nombre']}</p>
            <p>{$user['email']}</p>
            {if $user['administrador'] eq 1 }
                <div>
                    <span class="badge badge-secondary">Admin</span></div>
            {else}
                <a href="index.php?op=admin/upgradeAdmin&user={$user['email']}" class="btn btn-primary btn-lg active"
                   role="button"
                   aria-pressed="true">Dar permisos de administrador</a>
            {/if}
            {/foreach}
        </li>
    </ul>

    <ul class="pager" id="userPager">
        <li><a href="index.php?op={$entidad}/listado&pag={$numPag-1}">Previous</a></li>
        <li><a href="index.php?op={$entidad}/listado&pag={$numPag+1}">Next</a></li>
    </ul>
</div>
<div class="col-md-3"></div>
