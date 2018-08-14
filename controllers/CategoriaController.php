<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/CategoriaModel.php');
require_once('librerias/seguridad.php');

class CategoriaController extends BaseController {

    function deleteCategoriaAction() {
        $categoriaModel = new CategoriaModel();
        $categoriaModel->id = $_GET['categoria'];

        $categoriaModel->eliminarCategoria();
        $this->ListadoAction();
    }
    
    function activarCategoriaAction() {
        $categoriaModel = new CategoriaModel();
        $categoriaModel->id = $_GET['categoria'];

        $categoriaModel->activarCategoria();
        $this->ListadoAction();
    }

    function updadeCategoriaAction() {
        $categoriaModel = new CategoriaModel();
        $categoriaModel->id = $_GET['categoria'];
        $nombre = xss_clean($_POST['txtNomCategoriaNuevo']);
        var_dump($nombre);
        exit();
        
        $categoriaModel->nombre =$nombre;
        $categoriaModel->modificarCategoria();
        
        $this->ListadoAction();
    }

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

    function getCategoriaNombre($id) {
        $categoriaModel = new CategoriaModel();

        $categoriaModel->id = $id;

        return $categoriaModel->getCategoriaNombre();
    }

    function ListadoAction() {
        $numeroPagina = empty($_GET['pag']) ? 1 : $_GET['pag'];

        $categoriaModel = new CategoriaModel();

        $listaCategorias = $categoriaModel->getAllCategorias($numeroPagina);

        $sendData = array("categorias" => $listaCategorias, "numPag" => $numeroPagina);

        if ($_GET['ajax'] == "ajax") {
            $this->renderPartial("listadoCategorias", $sendData);
        } else {
            $this->render("listadoCategorias", $sendData);
        }
    }

}
