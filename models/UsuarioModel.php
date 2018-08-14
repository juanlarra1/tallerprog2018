<?php

require_once("librerias/class.Conexion.BD.php");

class UsuarioModel {

    var $email;
    var $password;
    var $esAdmin;
    var $nombre;
    var $errors = ['email' => [], 'password' => [], 'nombre' => []];

    function conectarDB() {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function getAllUsuarios($numeroPagina, $esAdmin) {
        $cn = $this->conectarDB();
        $offset = CANTXPAG * ($numeroPagina - 1);
        $sql = "select * from usuarios ";
        $parametros = array();
        if (!empty($esAdmin)) {
            $sql .= " WHERE administrador = :admin";
            array_push($parametros, array("admin", $esAdmin, 'int'));
        }
        $sql .= " LIMIT :cantPag OFFSET :offset";
        array_push($parametros, array("cantPag", CANTXPAG, 'int'));
        array_push($parametros, array("offset", $offset, 'int'));

        $cn->consulta($sql, $parametros);
        $res = $cn->restantesRegistros();

        return $res;
    }

    function checkLogin() {
        $con = $this->conectarDB();
        if (!$con->conectar()) {

            echo("error bd");
        } else {
            $con->consulta(
                    "select * from usuarios where email=:ema and password=:cla", array(
                array("ema", $this->email, 'string'),
                array("cla", $this->password, 'string')
            ));
            $usr = $con->siguienteRegistro();
            if (empty($usr)) {
                return false;
            }
            unset($usr["password"]); // saca la pass de los datos
            return $usr;
        }
    }

    function existeUsuario() {
        $existeUsuario = false;
        $cn = $this->conectarDB();
        $cn->consulta(
                "select * from usuarios where email=:ema", array(
            array("ema", $this->email, 'string')
        ));
        $res = $cn->siguienteRegistro();
        if ($res != null) {
            $existeUsuario = true;
        }
        return $existeUsuario;
    }

    function esAdmin() {
        $esAdmin = false;
        $cn = $this->conectarDB();
        $cn->consulta(
                "select * from usuarios where email=:ema", array(
            array("ema", $this->email, 'string')
        ));
        $res = $cn->siguienteRegistro();
        if ($res["administrador"] == 1) {
            $esAdmin = true;
        }
        return $esAdmin;
    }

    function crearUsuario() {
        $cn = $this->conectarDB();
        $cn->consulta(
                "insert into usuarios"
                . "(email, password, administrador, nombre)"
                . " values(:ema, :pas, :adm, :nom)", array(
            array("ema", $this->email, 'string'),
            array("pas", md5($this->password), 'string'),
            array("adm", 0, 'int'),
            array("nom", $this->nombre, 'string'),
        ));
    }

    function ascenderUsuario() {
        $conn = $this->conectarDB();
        if ($conn) {
            $sql = "UPDATE usuarios SET administrador = 1";
            $sql .= " WHERE email = :email";

            $parametros = array();
            $parametros[0] = array("email", $this->email, "string", 200);
            $result = $conn->consulta($sql, $parametros);
            if ($result) {
                return true;
            } else {
                return false;
            }
        }
    }

    function validarUsuario() {
        $isValid = true;

        if (!$this->validarEmail()) {
            $isValid = false;
            array_push($this->errors['email'], 'El formato del email no es correcto');
        }

        if (!$this->validarPassword()) {
            $isValid = false;
            array_push($this->errors['password'], 'El formato de la contraseña no es correcto');
        }

        if ($this->existeUsuario()) {
            $isValid = false;
            array_push($this->errors['email'], 'El correo ya existe en el registro');
        }

        if (!$this->validarNombre()) {
            $isValid = false;
            array_push($this->errors['nombre'], 'El formato de nombre es incorrecto');
        }

        return $isValid;
    }

    function validarEmail() {
        $isValid = true;
        $patron = "/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/";
        if (!preg_match($patron, $this->email)) {
            $isValid = false;
        }

        return $isValid;
    }

    function validarPassword() {
        $isValid = false;
        $patron = "/^(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ]/";
        if (strlen($this->password) >= 8 && preg_match($patron, $this->password)) {
            $isValid = true;
        }

        return $isValid;
    }

    function validarNombre() {
        $isValid = false;

        $patron = "/[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s\t-]/";
        if (strlen($this->nombre) >= 2 && preg_match($patron, $this->nombre)) {
            $isValid = true;
        }

        return $isValid;
    }

}
