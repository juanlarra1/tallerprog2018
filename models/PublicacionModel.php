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

    function getNotasHome() {
        /* Devuelve las ultimas 4 publicaciones de tipo Nota
         * texto de publicacion limitada a 150 caracteres
         * para mostrar en el home /index */

        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                    . "p.fecha as fecha, p.imagen as imagen, c.nombre as nombre, c.categoria_id "
                    . " FROM publicaciones p, categorias c "
                    . "WHERE (p.tipo_id = 2 AND p.categoria_id = c.categoria_id)"
                    . "ORDER BY p.Fecha DESC limit 4");
            $res = $cn->restantesRegistros();
            return $res;
        }
    }

    function getRecetasHome() {

        /* Devuelve las ultimas 4 publicaciones de tipo Receta
         * texto de publicacion limitada a 150 caracteres
         * para mostrar en el home /index */
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                    . "p.fecha as fecha, p.imagen as imagen, c.nombre as nombre, c.categoria_id "
                    . " FROM publicaciones p, categorias c "
                    . "WHERE (p.tipo_id = 1 AND p.categoria_id = c.categoria_id)"
                    . "ORDER BY p.Fecha DESC limit 4");
            $res = $cn->restantesRegistros();
            return $res;
        }
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

    function getAllTiposPublicaciones() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from tipos");
            $res = $cn->restantesRegistros();

            return $res;
        }
    }

    function getAllCategorias() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from categorias");
            $res = $cn->restantesRegistros();
            return $res;
        }
    }

    function existePublicacion() {
        $existePublicacion = false;
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from publicaciones where titulo=:tit", array(
                array("tit", $this->titulo, 'string')
            ));
            $res = $cn->siguienteRegistro();
            if ($res != null) {
                $existePublicacion = true;
            }
            return $existePublicacion;
        }
    }

    function crearPublicacion() {
        $cn = $this->conectarDB();
        if ($cn) {
            if (!$this->existePublicacion()) {
                $cn->consulta(
                        "insert into publicaciones"
                        . "(titulo, texto, fecha, imagen)"
                        . " values(:tit, :tex, :fec, :img)", array(
                    array("tit", $this->titulo, 'string'),
                    array("tex", $this->texto, 'string'),
                    array("fec", $this->fecha, 'string'),
                    array("img", $this->imagen, 'string'),
                ));
            }
        }
    }

    function borrarPublicacion() {
        $cn = $this->conectarDB();
        if ($cn) {
            $sql = "DELETE FROM publicaciones WHERE id = :id";
            $parametros = array();
            $parametros[0] = array("id", $id, "int");

            $result = $cn->consulta($sql, $parametros);

            if ($result) {
                header("Location: index.php");
            } else {

                header("Location: errores.php");
            }
        }
    }

}
