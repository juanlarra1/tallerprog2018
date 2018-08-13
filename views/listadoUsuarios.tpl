<div class="col-md-3"></div>
<div class="col-md-8">
    <select class="custom-select" id="adminFilter">
        <option {if $esAdmin eq "" } selected {/if} value="">Todos</option>
        <option {if $esAdmin eq "0" } selected {/if} value="0">Usuarios</option>
        <option {if $esAdmin eq "1" } selected {/if} value="1">Admins</option>
    </select>

    <ul id="seccionUsuarios" class="container col-md-6 border thin solid black">
        <a href="index.php?op=admin/listado"><h3>Usuarios</h3></a>
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
        <li><a href="index.php?op=admin/listado&pag={$numPag-1}">Previous</a></li>
        <li><a href="index.php?op=admin/listado&pag={$numPag+1}">Next</a></li>
    </ul>
</div>
<div class="col-md-3"></div>
