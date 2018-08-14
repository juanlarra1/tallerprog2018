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

    function conectarDB()
    {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function crearComentario()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                "insert into comentarios"
                . "(fecha, detalle,  usuario_id, publicacion_id)"
                . " values(:fecha, :det, :usu, :pub)", array(
                array("fecha", getdate(), 'string'),
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

}
