<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class ComentarioModel {

    var $fecha;
    var $detalle;
    var $respuesta;
    var $usuario;
    var $publicacion;

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function crearComentario() {
        $cn = $this->conectarDB();
        if ($cn) {
            if (!$this->existeCategoria()) {
                $cn->consulta(
                        "insert into comentario"
                        . "(fecha, detalle, respuesta, usuario, publicacion)"
                        . " values(:fecha, :det, :resp, :usu, :pub)", array(
                    array("fecha", $this->fecha, 'string'),
                    array("det", $this->detalle, 'string'),
                    array("usu", $this->usuario, 'int'),
                    array("pub", $this->publicacion, 'int')
                ));
            }
        }
    }
    
   function getAllCommentarios(){
          $cn = $this->conectarDB();
          $id = (int)$_GET['id'];
          
         if ($cn) {
             $cn->consulta("select c.*, u.nombre as nombre from comentarios c, usuarios u "
                     . "WHERE u.usuario_id = c.usuario_id AND c.publicacion_id=:pub", array(
                array("pub", $id, 'int')));
            
             $res = $cn->restantesRegistros();
            
            return $res;
        }
   }

}