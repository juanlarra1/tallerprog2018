<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/PublicacionModel.php');
require_once('models/FavoritoModel.php');
require_once('models/CategoriaModel.php');
require_once('models/ComentarioModel.php');
require_once('librerias/seguridad.php');

class PublicacionController extends BaseController {

    var $id;

    function ListadoAction() {

        $publicacionModel = new PublicacionModel();

        if (isset($_GET['tipoPublicacion'])) {
            $publicacionModel->tipo = $_GET['tipoPublicacion'];
            $listaPublicaciones = $publicacionModel->getAllFilterPublicaciones();
            if ($_GET['tipoPublicacion'] == 1) {
                $tipoPubli = "Recetas";
            } else {
                $tipoPubli = "Notas";
            }
        } else {
            $listaPublicaciones = $publicacionModel->getAllPublicaciones();
            $tipoPubli = "Todas las entradas";
        }
        $listaTiposPublicaciones = $publicacionModel->getAllTiposPublicaciones();

        $sendData = array("publicaciones" => $listaPublicaciones, "tipo" => $tipoPubli, 
            "tiposPublicaciones" => $listaTiposPublicaciones);

        $this->render("listadoPublicaciones", $sendData);
    }
    
   
    function deletePublicacionAction() {
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['publicacion'];

        $publicacionModel->eliminarPublicacion();
        $this->ListadoAction();
    }
    
    function activarPublicacionAction() {
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['publicacion'];

        $publicacionModel->activarPublicacion();
        $this->ListadoAction();
    }
    
    function ListadoBPAction() {

        $publicacionModel = new PublicacionModel();

        $listaPublicaciones = $publicacionModel->getAllPublicaciones();
       
             
        $sendData = array("publicaciones" => $listaPublicaciones);

        $this->render("publicaciones", $sendData);
    }

    function RegistroAction() {
        $publicacionModel = new PublicacionModel();
        if (!empty($_POST)) {
            $titulo = xss_clean($_POST['txtTituloPublicacion']);
            $texto = xss_clean($_POST['txtTextoPublicacion']);
            $fecha = $_POST['date'];
            $nombre_img = $_FILES['imagen']['name'];
            $tipo = $_FILES['imagen']['type'];
            $tamano = $_FILES['imagen']['size'];


            if (($nombre_img == !NULL) && ($_FILES['imagen']['size'] <= 200000)) {
                //indicamos los formatos que permitimos subir a nuestro servidor
                if (($_FILES["imagen"]["type"] == "image/gif") || 
                        ($_FILES["imagen"]["type"] == "image/jpeg") || 
                        ($_FILES["imagen"]["type"] == "image/jpg") || 
                        ($_FILES["imagen"]["type"] == "image/png")) {
                    // Ruta donde se guardarán las imágenes que subamos
                    $directorio = $_SERVER['DOCUMENT_ROOT'] . 'img/';
                    // Muevo la imagen desde el directorio temporal a nuestra ruta indicada anteriormente
                    move_uploaded_file($_FILES['imagen']['tmp_name'], $directorio . $nombre_img);
                } else {
                    //si no cumple con el formato
                    echo "No se puede subir una imagen con ese formato ";
                }
            } else {
                //si existe la variable pero se pasa del tamaño permitido
                if ($nombre_img == !NULL)
                    echo "La imagen es demasiado grande ";
            }
            $categoria = $_POST['txtCategoriaPublicacion'];

            $tipo = $_POST['txtTiposPublicacion'];

            $publicacionModel->titulo = $titulo;
            $publicacionModel->texto = $texto;
            $publicacionModel->fecha = $fecha;
            $publicacionModel->imagen = $nombre_img;
            $publicacionModel->categoria = $categoria;
            $publicacionModel->tipo = $tipo;

            
            if ($publicacionModel->existePublicacion() == null) {

                $publicacionModel->crearPublicacion();
                header('Location: index.php?publicacion/index');
                exit;
            }
        }

        $categoriaModel = new CategoriaModel();

        $listaCategorias = $categoriaModel->getCategorias();
        $listaTipos = $publicacionModel->getAllTiposPublicaciones();
        $control = array("publicacionModel" => $publicacionModel, 
            "tipos" => $listaTipos, "categorias" => $listaCategorias);

        $this->render("registroPublicacion", $control);
    }

    function VerPublicacionAction() {
        $cat_data = new CategoriaModel();
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['id'];
        $publicacion = $publicacionModel->getPublicacion();
        $cat_data->id = $publicacion['categoria_id'];

        $comentarioModel = new ComentarioModel();
        $comentarioModel->publi_id = $_GET['id'];
        $comentarios = $comentarioModel->getAllCommentarios();

        $sendData = array("publicacion" => $publicacion,
            "categoria" => $cat_data->getCategoriaNombre(),
            "comentarios" => $comentarios);
        $this->render("publicacion", $sendData);
    }

    function ComentarPublicacionAction() {

        $comentarioModel = new ComentarioModel();
        $detalle = xss_clean($_POST['txtDetalle']);
        $comentarioModel->usuario = (int) $_SESSION['user']['usuario_id'];
        $comentarioModel->publi_id = $_GET['id'];
        $comentarioModel->detalle = $detalle;
        $comentarioModel->crearComentario();
        $this->id = $_GET['id'];
        $this->VerPublicacionAction();
    }
    
    function marcarFavPublicacionAction (){
        $favoritoModel = new FavoritoModel();
        $favoritoModel->publicacion_id = $_GET['publicacion'];
        $favoritoModel->usuario_id=(int) $_SESSION['user']['usuario_id'];
        $favoritoModel->crearFavorito();
        $this->ListadoAction();
    }

}
