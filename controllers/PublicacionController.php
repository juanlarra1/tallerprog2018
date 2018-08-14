<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/PublicacionModel.php');
require_once('models/CategoriaModel.php');
require_once('models/ComentarioModel.php');
require_once('librerias/seguridad.php');


class PublicacionController extends BaseController
{
    var $id;

    function ListadoAction()
    {

        $publicacionModel = new PublicacionModel();
        $publicacionModel ->categoria = $_GET['catPublicacion'];
        $listaPublicaciones = $publicacionModel->getAllPublicaciones();
        $listaTiposPublicaciones = $publicacionModel->getAllTiposPublicaciones();

        $sendData = array("publicaciones" => $listaPublicaciones, "tiposPublicaciones" => $listaTiposPublicaciones);

        $this->render("listadoPublicaciones", $sendData);
    }

    function RegistroAction()
    {
        $publicacionModel = new PublicacionModel();
        if (!empty($_POST)) {
            $titulo = xss_clean($_POST['txtTituloPublicacion']);
            $texto = xss_clean($_POST['txtTextoPublicacion']);
            $fecha = $_POST['date'];
            $imagen = $_POST['txtImagenPublicacion'];
            $categoria = $_POST['txtCategoriaPublicacion'];

            $publicacionModel->titulo = $titulo;
            $publicacionModel->texto = $texto;
            $publicacionModel->fecha = $fecha;
            $publicacionModel->imagen = $imagen;
            $publicacionModel->categoria = $categoria;

            if ($publicacionModel->existePublicacion() == null) {

                $publicacionModel->crearPublicacion();
                header('Location: index.php?publicacion/index');
                exit;
            }
        }


        $categoriaModel = new CategoriaModel();

        $listaCategorias = $categoriaModel->getAllCategorias();

        $control = array("publicacionModel" => $publicacionModel, "categorias" => $listaCategorias);

        $this->render("registroPublicacion", $control);
    }

    function VerPublicacionAction(){
        $cat_data = new CategoriaModel();
        $publicacionModel = new PublicacionModel();
        $publicacionModel ->id = $_GET['id'];
        $publicacion = $publicacionModel->getPublicacion();
        $cat_data->id = $publicacion['categoria_id'];

        $comentarioModel = new ComentarioModel();
        $comentarios = $comentarioModel->getAllCommentarios();
       
        $sendData = array("publicacion" => $publicacion, 
            "categoria"=> $cat_data->getCategoriaNombre(), 
            "comentarios" =>$comentarios);
        $this->render("publicacion",$sendData);

    }
    
    
    
}
