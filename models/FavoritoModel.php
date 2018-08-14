<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class FavoritoModel {

    var $usuario_id;
    var $publicacion_id;

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function crearFavorito() {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                    "insert into favoritos"
                    . "(usuario_id, publicacion_id)"
                    . " values(:usu, :pub)", array(
                array("usu", $this->usuario_id, 'int'),
                array("pub", $this->publicacion_id, 'int'),
            ));
        }
    }

}
