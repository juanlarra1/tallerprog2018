<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class CategoriaModel {

    var $nombre;
    var $eliminado;
    var $id;
    var $errors = ['nombre' => [], 'eliminado' => []];

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, "localhost", "Obligatorio", "root", "root");
        $conn->conectar();
        return $conn;
    }

    function existeCategoria() {
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


    function getCategoriaNombre() {
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

    function crearCategoria() {
        $cn = $this->conectarDB();
        if ($cn) {
            if (!$this->existeCategoria()) {
                $cn->consulta(
                        "insert into categorias"
                        . "(nombre, eliminado)"
                        . " values(:nom, :elim)", array(
                    array("nom", $this->nombre, 'string'),
                    array("elim", $this->eliminado, 'int'),
                ));
            }
        }
    }

    function validarNombre() {
        $isValid = false;

        $patron = "/[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s\t-]/";
        if (strlen($this->nombre) >= 2 && preg_match($patron, $this->nombre)) {
            $isValid = true;
        }

        return $isValid;
    }

    function validarCategoria() {
        $isValid = true;

        if (!$this->validarNombre()) {

            $isValid = false;
            array_push($this->errors['nombre'], 'El formato de nombre no es correcto');
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

}
