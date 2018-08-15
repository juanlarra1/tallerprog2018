<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class ComentarioModel
{

    var $fecha;
    var $detalle;
    var $respuesta;
    var $usuario;
    var $publi_id;
    var $comment_id;

    function conectarDB()
    {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function crearComentario()
    {

        $date = date_create();
        $save_date = date_format($date, 'Y-m-d H:i:s');

        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                "insert into comentarios"
                . "(fecha, detalle,  usuario_id, publicacion_id)"
                . " values(:fecha, :det, :usu, :pub)", array(
                array("fecha", $save_date, 'datetime'),
                array("det", $this->detalle, 'string'),
                array("usu", $this->usuario, 'int'),
                array("pub", $this->publi_id, 'int')
            ));


        }
    }

    function getAllCommentarios()
    {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta("select c.*, u.nombre as nombre from comentarios c, usuarios u "
                . "WHERE u.usuario_id = c.usuario_id AND c.publicacion_id=:pub", array(
                array("pub", $this->publi_id, 'int')));

            $res = $cn->restantesRegistros();


        }
        return $res;
    }


    function responderComentario(){
        $conn = $this->conectarDB();

        if ($conn) {
            $sql = "UPDATE comentarios SET respuesta =:resp WHERE comentario_id =:id";

            $parametros = array();
            $parametros[0] = array("resp", $this->respuesta, "string");
            $parametros[1] = array("id", $this->comment_id, "int");
            $result = $conn->consulta($sql, $parametros);
            if ($result) {
                return true;
            } else {
                return false;
            }
        }


    }

}
