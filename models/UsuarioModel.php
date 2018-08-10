<?php
require_once("librerias/class.Conexion.BD.php");

class UsuarioModel {

    function conectarDB() {
    $conn = new ConexionBD("mysql", "localhost", "Obligatorio", "root", "root");
    $conn->conectar();
    return $conn;
}
    
    function checkLogin($user, $password) {
        $con = conectarDB();
       if(!$con->conectar()){
           
           echo ("error bd");
       }else{
        $con->consulta(
                "select * from usuarios where email=:ema and password=:cla", array(
            array("ema", $user, 'string'),
            array("cla", $password, 'string')
        ));
        $usr = $con->siguienteRegistro();
       
        if (empty($usr)) {
            return false;
        }
        unset($usr["password"]); // saca la pass de los datos
        return $usr;
    }
}


function getUsuario($email) {
    $existeUsuario = false;
    $cn = conectarDB();
    $cn->consulta(
            "select * from usuarios where email=:ema", array(
        array("ema", $email, 'string')
    ));
    $res = $cn->siguienteRegistro();
    if ($res != null) {
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
        
function modificarUsuario($email, $password, $esAdmin){
    $conn = conectarDB();
          
    if($conn){
        
        $sql = "UPDATE usuarios SET password = :password,";
        $sql .=" especialidad = :especialidad,";
        $sql .=" WHERE email = :email";
        
        $parametros = array();
        $parametros[0] = array("email",$email,"string",200);
        $parametros[1] = array("password",$password,"string",150);
        $parametros[2] = array("esAdmin",$esAdmin,"int",0);
        
        $result = $conn->consulta($sql, $parametros);
        if($result){
           return true;
        }
        else{
            return false;
        }
    }
    
    
    
}
        
        
        
        
        
        
        
        
        
        
    }




