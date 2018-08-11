<div class ="col-md-12">
    <div  id="seccionRecetas" style ="text-decoration:none;" class="container col-md-6 border thin solid black">
        <h3>Publicaciones</h3>
        
        
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
              <td><img src= "img/{$publicacion['imagen']}" height="70px" /> </td> 
              <td>{$publicacion['categoria_id']}</td> 
              <td>{$publicacion['tipo_id']}</td> 
            </tr>
            {/foreach}
        </tbody>
      </table>
            
    </div>  

</div>