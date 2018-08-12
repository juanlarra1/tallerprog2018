<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');
require_once('librerias/seguridad.php');

class UsuarioController extends BaseController {


 
    function RegistroAction() {
        $userModel = new UsuarioModel();
        if (!empty($_POST)) {
            $email = xss_clean($_POST['txtEmailUsuario']);
            $password = xss_clean($_POST['txtPassword']);
            $nombre = xss_clean($_POST['txtNombre']);
            
            $userModel->email = $email;
            $userModel->password = $password;
            $userModel->nombre = $nombre;

            if ($userModel->validarUsuario()) {

                $userModel->crearUsuario();
                header('Location: index.php?usuario/index');
                exit;
            }
        }
        $control = array("userModel" => $userModel);


        $this->render("login", $control);
    }

}
