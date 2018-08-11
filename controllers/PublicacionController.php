<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/PublicacionModel.php');
require_once('librerias/seguridad.php');

class PublicacionController extends BaseController {
    
    function ListadoAction() {

        $publicacionModel = new PublicacionModel();

        $listaPublicaciones = $publicacionModel->getAllPublicaciones();
        $listaTiposPublicaciones = $publicacionModel->getAllTiposPublicaciones();
        
        $sendData = array("publicaciones" => $listaPublicaciones, "tiposPublicaciones" => $listaTiposPublicaciones);

        $this->render("listadoPublicaciones", $sendData);
    }
}
