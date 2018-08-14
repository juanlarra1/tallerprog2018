<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/ComentarioModel.php');
require_once('librerias/seguridad.php');

class ComentarioController extends BaseController {

    function RegistroAction() {
        $comentarioModel = new ComentarioModel();
        if (!empty($_POST)) {
            $detalle = xss_clean($_POST['txtDetalle']);
            $respuesta = xss_clean($_POST['txtRespuesta']);

            $comentarioModel->detalle = $detalle;
            $comentarioModel->respuesta = $respuesta;
            $categoriaModel->crearCategoria();
            header('Location: index.php?publicacion/index');
            exit;
        }
    }

}
