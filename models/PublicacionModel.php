<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class PublicacionModel {

    var $titulo;
    var $id;
    var $texto;
    var $fecha;
    var $imagen;
    var $categoria;
    var $tipo;
    var $errors = ['titulo' => [], 'texto' => [], 'fecha' => [], 'imagen' => []];

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    
    function activarPublicacion(){
        $conn = $this->conectarDB();
            
        if ($conn) {
            $sql = "UPDATE publicaciones SET eliminado = 0 WHERE publicacion_id = :pub";

            $parametros = array();
            $parametros[0] = array("pub", $this->id, "int");
            $result = $conn->consulta($sql, $parametros);
            if ($result) {
                return true;
            } else {
                return false;
            }
        }
    }

    
    function eliminarPublicacion(){
        $conn = $this->conectarDB();
            
        if ($conn) {
            $sql = "UPDATE publicaciones SET eliminado = 1 WHERE publicacion_id = :pub";

            $parametros = array();
            $parametros[0] = array("pub", $this->id, "int");
            $result = $conn->consulta($sql, $parametros);
            if ($result) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    function getPublicacion() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from publicaciones where publicacion_id=:id", array(
                array("id", $this->id, 'int')
            ));
            $res = $cn->siguienteRegistro();
            if ($res != null) {
                return $res;
            }
            return null;
        }
    }

    function getNotasHome() {
        /* Devuelve las ultimas 4 publicaciones de tipo Nota
         * texto de publicacion limitada a 150 caracteres
         * para mostrar en el home /index */

        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                    . "p.fecha as fecha, p.imagen as imagen, p.publicacion_id as publicacion_id,  c.nombre as nombre, c.categoria_id "
                    . " FROM publicaciones p, categorias c "
                    . "WHERE (p.tipo_id = 2 AND p.categoria_id = c.categoria_id AND p.eliminado = 0)"
                    . "ORDER BY p.Fecha ASC limit 4");
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
                    . "p.fecha as fecha, p.imagen as imagen, p.publicacion_id as publicacion_id, c.nombre as nombre, c.categoria_id "
                    . " FROM publicaciones p, categorias c "
                    . "WHERE (p.tipo_id = 1 AND p.categoria_id = c.categoria_id AND p.eliminado = 0)"
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

    function getAllFilterTipoPublicaciones() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from publicaciones where tipo_id=:tip and eliminado = 0", array(
                array("tip", $this->tipo, 'int')
            ));
            $res = $cn->restantesRegistros();
        }
        return $res;
    }


    function getAllFilterCategoriasPublicaciones() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                "select * from publicaciones where categoria_id=:cat and eliminado = 0", array(
                array("cat", $this->categoria, 'int')
            ));
            $res = $cn->restantesRegistros();
        }
        return $res;
    }


    function getAllTiposPublicaciones() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from tipos ");
            $res = $cn->restantesRegistros();

            return $res;
        }
    }

    function getAllCategorias() {
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                    "select * from categorias where eliminado=0");
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

        $date = date_create();
        $this->fecha = date_format($date, 'Y-m-d H:i:s');
        $cn = $this->conectarDB();
        if ($cn) {

            if (!$this->existePublicacion()) {
                $cn->consulta(
                        "insert into publicaciones"
                        . " (titulo, texto, fecha, imagen, categoria_id, tipo_id, usuario_id)"
                        . " values(:tit, :tex, :fec, :img, :cat, :tipo, :usu)", array(
                    array("tit", $this->titulo, 'string'),
                    array("tex", $this->texto, 'string'),
                    array("fec", $this->fecha, 'datetime'),
                    array("img", $this->imagen, 'string'),
                    array("cat", $this->categoria, 'int'),
                    array("tipo", $this->tipo, 'int'),
                    array("usu", (int) $_SESSION['user']['usuario_id'], 'int'),
                ));
            }
        }
    }



}
