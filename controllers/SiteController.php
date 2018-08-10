<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');

class SiteController extends BaseController {

    function IndexAction() {


//Muestro el resultado al Cliente
        $this->render("sites/index", ["Test" => "1"]);
    }

    function LoginAction() {
        $user = "usuario@prueba.com";
        $password = "32250170a0dca92d53ec9624f336ca24";

        $userModel = new UsuarioModel();

        $login = $userModel->checkLogin($user, $password);
        if ($login === false) {
            $this->jsonEncode(["mensaje" => "Credenciales Incorrectas"]);
        }
        
            $_SESSION["user"] = $login;
       header("location: index.php");
            
 
    }

}
