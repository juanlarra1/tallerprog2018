<?php
require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');
class AdminController extends BaseController
{

    function upgradeAdminAction(){
        $userAdmin =  new UsuarioModel();
        $userAdmin->email = $_GET['user'];
        $userAdmin->ascenderUsuario();
       $this->ListadoAction();
       


    }

    function ListadoAction() {

        $userModel = new UsuarioModel();

        $listaUsers = $userModel->getAllUsuarios();

        $sendData = array("users" => $listaUsers);

        $this->render("listadoUsuarios", $sendData);
    }

}