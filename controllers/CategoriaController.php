<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/CategoriaModel.php');
require_once('librerias/seguridad.php');

class CategoriaController extends BaseController {

    function RegistroAction() {
        $categoriaModel = new CategoriaModel();
        if (!empty($_POST)) {
            $nombre = xss_clean($_POST['txtNombreCategoria']);
            $eliminado = xss_clean(isset($_POST['chkCategoriaEliminada']) ? 1 : 0);


            $categoriaModel->nombre = $nombre;
            $categoriaModel->eliminado = $eliminado;

            if ($categoriaModel->validarCategoria() == null) {

                $categoriaModel->crearCategoria();
                header('Location: index.php?categoria/index');
                exit;
            }
        }
        $control = array("categoriaModel" => $categoriaModel);


        $this->render("registroCategoria", $control);
    }

    function getCategoriaNombre($id){
        $categoriaModel = new CategoriaModel();

        $categoriaModel->id =  $id;

        return $categoriaModel->getCategoriaNombre();

    }
    
     
}
