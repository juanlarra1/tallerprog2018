<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/PublicacionModel.php');
require_once('models/CategoriaModel.php');
require_once('librerias/seguridad.php');

class PublicacionController extends BaseController {

    function ListadoAction() {

        $publicacionModel = new PublicacionModel();

        $listaPublicaciones = $publicacionModel->getAllPublicaciones();
        $listaTiposPublicaciones = $publicacionModel->getAllTiposPublicaciones();

        $sendData = array("publicaciones" => $listaPublicaciones, "tiposPublicaciones" => $listaTiposPublicaciones);

        $this->render("listadoPublicaciones", $sendData);
    }

    function RegistroAction() {
        $publicacionModel = new PublicacionModel();
        if (!empty($_POST)) {
            $titulo = xss_clean($_POST['txtTituloPublicacion']);
            $texto = xss_clean($_POST['txtTextoPublicacion']);
            $fecha = xss_clean($_POST['date']);
            $imagen = xss_clean($_POST['txtImagenPublicacion']);
            $categoria = xss_clean($_POST['txtCategoriaPublicacion']);

            $publicacionModel->titulo = $titulo;
            $publicacionModel->texto = $texto;
            $publicacionModel->fecha = $fecha;
            $publicacionModel->imagen = $imagen;
            $publicacionModel->imagen = $categoria;

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

}
