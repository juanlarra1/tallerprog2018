<?php

require_once("Librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

function conectarDB() {
    $conn = new ConexionBD("mysql", "localhost", "Obligatorio", "root", "root");
    $conn->conectar();
    return $conn;
}

function getRecetas() {
    $con = conectarDB();

    if ($con) {
        $sqlRecetas = "SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                . "p.fecha as fecha, p.imagen as imagen, c.nombre as nombre, c.categoria_id "
                . " FROM publicaciones p, categorias c "
                . "WHERE (p.tipo_id = 1 AND p.categoria_id = c.categoria_id)"
                . "ORDER BY p.Fecha DESC limit 4";

        $parametros = array();

        $resultRecetas = $con->consulta($sqlRecetas, $parametros);

        if ($resultRecetas) {//la ejecucion de mi consulta fue V => debo obterner la lista de filas obtenidas por la consulta
            $recetas = $con->restantesRegistros();
            return $recetas;
        } else {
            echo 'error de consulta' . $con->ultimoError;
        }
    }
}

function getPublicaciones() {

    $con = conectarDB();
    if ($con) {

        $sqlPublicaciones = "SELECT * FROM publicaciones";

        $parametros = array();

        $result = $con->consulta($sqlPublicaciones, $parametros);

        if ($result) {//la ejecucion de mi consulta fue V => debo obterner la lista de filas obtenidas por la consulta
            $publicaciones = $con->restantesRegistros();

            return $publicaciones;
        } else {
            echo 'error de consulta' . $con->ultimoError;
        }
    } else {
        echo "error de conexion" . $con->ultimoError; // devuelve la cadena con el ultimo error 
    }
}

function getNotas() {
    $con = conectarDB();
    if ($con) {
        $sqlNotas = "SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                . "p.fecha as fecha, p.imagen as imagen, c.nombre as nombre, c.categoria_id "
                . " FROM publicaciones p, categorias c "
                . "WHERE (p.tipo_id = 2 AND p.categoria_id = c.categoria_id)"
                . "ORDER BY p.Fecha DESC limit 4";

        $parametrosNotas = array();

        $resultNotas = $con->consulta($sqlNotas, $parametrosNotas);

        if ($resultNotas) {//la ejecucion de mi consulta fue V => debo obterner la lista de filas obtenidas por la consulta
            $notas = $con->restantesRegistros();
            return $notas;
        } else {
            echo 'error de consulta' . $con->ultimoError;
        }
    } else {
        echo "error de conexion" . $con->ultimoError; // devuelve la cadena con el ultimo error 
    }
}

function loginUser($usuario, $clave) {
    $con = conectarDB();
    $con->consulta(
            "select * from usuarios where email=:ema and clave=:cla", array(
        array("ema", $usuario, 'string'),
        array("cla", $clave, 'string')
    ));

    $usr = $cn->siguienteRegistro();
    if ($usr != null) {
        session_start();
        $_SESSION["usuario"] = $usr;
    }

    return $usr;
}

function getUsuario($email) {
    $existeUsuario = false;
    $cn = conectarDB();
    $cn->consulta(
            "select * from usuarios where email=:ema", array(
        array("ema", $email, 'string')
               
    ));

    $res = $cn->siguienteRegistro(); 
    if ($res!=null) {

        $existeUsuario = true;
    }
    return $existeUsuario;
}

function crearUsuario($email, $password, $esAdmin) {

    $cn = conectarDB();
    $cn->consulta(
            "insert into usuarios"
            . "(email, password,administrador)"
            . " values(:ema, :pas, :adm)", array(
        array("ema", $email, 'string'),
        array("pas", $password, 'string'),
        array("adm", $esAdmin, 'int'),
    ));
}

?>