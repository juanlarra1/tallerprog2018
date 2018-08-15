<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');
require_once('models/PublicacionModel.php');
require_once('models/FavoritoModel.php');
require_once('librerias/seguridad.php');

class FavoritoController extends BaseController
{


    function ListadoAction()
    {
        $usuario_id = $_SESSION["user"]['usuario_id'];
        $favoritosModel = new FavoritoModel();
        $favoritosModel->usuario_id = $usuario_id;
        $listaFavoritos = $favoritosModel->listarFavoritos();

        $sendData = array("favoritos" => $listaFavoritos);

        $this->render("favoritos", $sendData);
    }


}