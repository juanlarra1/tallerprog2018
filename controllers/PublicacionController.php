<?php

require_once('librerias/smarty/libs/Smarty.class.php');
require_once('BaseController.php');
require_once('models/PublicacionModel.php');
require_once('models/FavoritoModel.php');
require_once('models/CategoriaModel.php');
require_once('models/ComentarioModel.php');
require_once('librerias/seguridad.php');

class PublicacionController extends BaseController
{
    var $entidad = 'publicacion';
    var $id;

    function ListadoAction()
    {

        $model = new PublicacionModel();
        $pag = empty($_POST['pag']) ? 1 : $_POST['pag'];
        $model->tipo = $_POST['tipo'];
        $model->categoria = $_POST['categoria'];

        $records = $model->getAllRecords($pag);

        $data = array(
            "entidad"=>$this->entidad,
            "publicaciones" => $records,
            "categorias"=> $model->getAllCategorias(),
            "tipos" => $model->getAllTiposPublicaciones(),
            "model" => $model,
            "pag"=>$pag,
            "extraScripts"=> array("recursos/js/listado.js")
        );
        if(isset($_GET['ajax'])) {
            $this->renderPartial("$this->entidad/listado", $data);
        } else {
            $this->render("$this->entidad/listado", $data);
        }

    }


    function deletePublicacionAction()
    {
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['publicacion'];

        $publicacionModel->eliminarPublicacion();
        $this->ListadoAction();
    }

    function activarPublicacionAction()
    {
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['publicacion'];

        $publicacionModel->activarPublicacion();
        $this->ListadoAction();
    }

    function ListadoBPAction()
    {

        $publicacionModel = new PublicacionModel();

        $listaPublicaciones = $publicacionModel->getAllPublicaciones();


        $sendData = array("publicaciones" => $listaPublicaciones);

        $this->render("publicaciones", $sendData);
    }

    function RegistroAction()
    {
        $publicacionModel = new PublicacionModel();
        if (!empty($_POST)) {
            $titulo = xss_clean($_POST['txtTituloPublicacion']);
            $texto = xss_clean($_POST['txtTextoPublicacion']);
            $fecha = date(d/m/Y);

            $foto = date("YmdHis") . "_" . $_FILES['imagen']['name'];

            if (is_uploaded_file($_FILES['imagen']['tmp_name'])) {
                //verifico el tipo
                if (($_FILES["imagen"]["type"] == "image/gif") ||
                    ($_FILES["imagen"]["type"] == "image/jpeg") ||
                    ($_FILES["imagen"]["type"] == "image/jpg") ||
                    ($_FILES["imagen"]["type"] == "image/png")) {
                    //muevo y veo si pude mover al destino
                    if (!move_uploaded_file($_FILES['imagen']['tmp_name'], "img/" . $foto)) {
                        die("Error al mover archivo");
                    }
                } else {
                    die("Error tipo archivo");
                }
            } else {
                die("ERROR");
            }


            $categoria = $_POST['txtCategoriaPublicacion'];

            $tipo = $_POST['txtTiposPublicacion'];

            $publicacionModel->titulo = $titulo;
            $publicacionModel->texto = $texto;
            $publicacionModel->fecha = $fecha;
            $publicacionModel->imagen = $foto;
            $publicacionModel->categoria = $categoria;
            $publicacionModel->tipo = $tipo;


            if ($publicacionModel->existePublicacion() == null) {

                $publicacionModel->crearPublicacion();
                header('Location: index.php?publicacion/index');
                exit;
            }
        }

        $categoriaModel = new CategoriaModel();

        $listaCategorias = $categoriaModel->getCategorias();
        $listaTipos = $publicacionModel->getAllTiposPublicaciones();
        $control = array("publicacionModel" => $publicacionModel,
            "tipos" => $listaTipos, "categorias" => $listaCategorias);

        $this->render("registroPublicacion", $control);
    }

    function VerPublicacionAction()
    {
        $cat_data = new CategoriaModel();
        $publicacionModel = new PublicacionModel();
        $publicacionModel->id = $_GET['id'];
        $publicacion = $publicacionModel->getPublicacion();
        $cat_data->id = $publicacion['categoria_id'];

        $comentarioModel = new ComentarioModel();
        $comentarioModel->publi_id = $_GET['id'];
        $comentarios = $comentarioModel->getAllCommentarios();

        $sendData = array("publicacion" => $publicacion,
            "categoria" => $cat_data->getCategoriaNombre(),
            "comentarios" => $comentarios);
        $this->render("publicacion", $sendData);
    }

    function ComentarPublicacionAction()
    {

        $comentarioModel = new ComentarioModel();
        $detalle = xss_clean($_POST['txtDetalle']);
        $comentarioModel->usuario = (int)$_SESSION['user']['usuario_id'];
        $comentarioModel->publi_id = $_GET['id'];
        $comentarioModel->detalle = $detalle;
        $comentarioModel->crearComentario();
        $this->id = $_GET['id'];
        $this->VerPublicacionAction();
    }

    function marcarFavPublicacionAction()
    {
        $favoritoModel = new FavoritoModel();
        $favoritoModel->publicacion_id = $_GET['publicacion'];
        $favoritoModel->usuario_id = (int)$_SESSION['user']['usuario_id'];
        $favoritoModel->crearFavorito();
        $this->ListadoAction();
    }


    function responderPublicacionAction()
    {
        $comentario = new ComentarioModel();
        $comentario->respuesta = xss_clean($_POST['txtRespuesta']);
        $comentario ->comment_id = $_GET['com_id'];
        $comentario->responderComentario();
        $publicacion = new PublicacionModel();
        $publicacion->id = $_GET['id'];
        $this->VerPublicacionAction();
    }

}
