<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class CategoriaModel
{

    var $nombre;
    var $eliminado;
    var $id;
    var $errors = ['nombre' => [], 'eliminado' => []];

    function conectarDB()
    {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function existeCategoria()
    {
        $existeCategoria = false;
        $cn = $this->conectarDB();

        if ($cn) {
            $cn->consulta(
                "select * from categorias where nombre=:nom", array(
                array("nom", $this->nombre, 'string')
            ));
            $res = $cn->siguienteRegistro();
            if ($res != null) {
                $existeCategoria = true;
            }
            return $existeCategoria;
        }
    }


    function getCategoriaNombre()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                "select * from categorias where categoria_id=:id", array(
                array("id", $this->id, 'int')
            ));
            $res = $cn->siguienteRegistro();
            if ($res != null) {
                return $res['nombre'];
            }
            return null;
        }
    }

    function crearCategoria()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            if (!$this->existeCategoria()) {
                $cn->consulta(
                    "insert into categorias"
                    . "(nombre, eliminado)"
                    . " values(:nom, 0)", array(
                    array("nom", $this->nombre, 'string'),                   
                ));
            }
        }
    }

    function validarNombre()
    {
        $isValid = false;

        $patron = "/[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s\t-]/";
        if (strlen($this->nombre) >= 2 && preg_match($patron, $this->nombre)) {
            $isValid = true;
        }

        return $isValid;
    }

    function validarCategoria()
    {
        $isValid = true;

        if (!$this->validarNombre()) {

            $isValid = false;
            array_push($this->errors['nombre'], 'El formato de nombre no es correcto');
        }
    }

    function getAllCategorias($numeroPagina)
    {
        $cn = $this->conectarDB();
        $offset = CANTXPAG * ($numeroPagina - 1);
        $sql = "select * from categorias ";
        $parametros = array();
        $sql .= " LIMIT :cantPag OFFSET :offset";
        array_push($parametros, array("cantPag", CANTXPAG, 'int'));
        array_push($parametros, array("offset", $offset, 'int'));

        $cn->consulta($sql, $parametros);
        $res = $cn->restantesRegistros();

        return $res;
        
    }

}
