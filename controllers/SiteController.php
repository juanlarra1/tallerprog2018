<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/UsuarioModel.php');
require_once('models/PublicacionModel.php');
require_once('librerias/seguridad.php');

class SiteController extends BaseController
{

    function IndexAction()
    {
        $publicacionModel = new PublicacionModel();

        $listaRecetas = $publicacionModel->getRecetasHome();
        $listaNotas = $publicacionModel->getNotasHome();
        // $sendData = array("publicaciones" => $listaPublicaciones, "Test" => "1");

        //Muestro el resultado al Cliente
        $this->render("sites/index", ["recetas" => $listaRecetas, "notas" => $listaNotas]);
    }

    function LoginAction()
    {
        $userModel = new UsuarioModel();
        if (!empty($_POST)) {
            $email = xss_clean($_POST['txtLoginEmail']);
            $password = xss_clean($_POST['txtLoginPassword']);

            $userModel->email = $email;
            $userModel->password = md5($password);

            $isLogged = $userModel->checkLogin();
            if ($isLogged) {
                $_SESSION["user"] = $isLogged;

                $_SESSION["user"]["esAdmin"] = $userModel->esAdmin();


                header('Location: index.php?usuario/index');
                exit;
            }
        }
        $control = array("userModel" => $userModel);


        $this->render("login", $control);
    }

    function LogoutAction()
    {
        $_SESSION["user"] = null;
        header('Location: index.php?site/index');
    }

}

/* $user = "usuario@prueba.com";
  $password = "32250170a0dca92d53ec9624f336ca24";

  $userModel = new UsuarioModel();

  $login = $userModel->checkLogin($user, $password);
  if ($login === false) {
  $this->jsonEncode(["mensaje" => "Credenciales Incorrectas"]);
  }

*/


