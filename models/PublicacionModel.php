<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class PublicacionModel {

    var $titulo;
    var $texto;
    var $fecha;
    var $imagen;
    var $errors = ['titulo' => [], 'texto' => [], 'fecha' => [], 'imagen' => []];

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }
    
    function getAllPublicaciones() {
        $cn = $this->conectarDB();
        
        if ($cn) {
            $cn->consulta(
                    "select * from publicaciones");
            $res = $cn->restantesRegistros();

            return $res;
        }
    }

}
