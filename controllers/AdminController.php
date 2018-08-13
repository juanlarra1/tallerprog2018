<?php
require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');

class AdminController extends BaseController
{

    function upgradeAdminAction()
    {
        $userAdmin = new UsuarioModel();
        $userAdmin->email = $_GET['user'];
        $userAdmin->ascenderUsuario();
        $this->ListadoAction();
    }

    function ListadoAction()
    {
        $numeroPagina = empty($_GET['pag']) ? 1 : $_GET['pag'];
        $esAdmin = $_GET['esAdmin'];

        $userModel = new UsuarioModel();

        $listaUsers = $userModel->getAllUsuarios($numeroPagina, $esAdmin);

        $sendData = array("users" => $listaUsers, "numPag" => $numeroPagina, "esAdmin" => $esAdmin, "extraScripts"=> array("recursos/js/listadoUsuarios.js"));

        if ($_GET['ajax'] == "ajax") {
            $this->renderPartial("listadoUsuarios", $sendData);
        } else {
            $this->render("listadoUsuarios", $sendData);
        }
    }

}