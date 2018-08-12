<div class="col-md-2"></div>
<div class="col-md-10">
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
                <a href="index.php?op=admin/upgradeAdmin&user={$user['email']}" class="btn btn-primary btn-lg active" role="button"
                   aria-pressed="true">Dar permisos de administrador</a>
            {/if}
            {/foreach}
        </li>
    </ul>
</div>
<div class="col-md-2"></div>