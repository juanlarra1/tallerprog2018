<div class ="col-md-12">
    <div  id="seccionRecetas" class="container col-md-6 border thin solid black">
        <a href="index.php?op=usuario/listado"><h3>Usuarios</h3></a>
        {foreach from=$users item=user} 
            <div class="panel panel-warning">
                <div class="panel-body">
                    <p>{$user['email']}</p>
                    <input type="checkbox" name="vehicle" value={$user['administrador']} {if $user['administrador'] eq 1 }checked="checked"{/if}> Admin<br>
                </div>
                
            </div>
        {/foreach}
    </div>  

</div>