$(document).ready(inicializoRU);
function inicializoRU() {
   // $("#txtNombreUsuario").blur(validarNombre);
    $("#txtEmailUsuario").blur(validarEmail);
    $("#txtPassword").blur(validarPassword);
   
}


function validarEmail() {
     var dato = $(this).val();
    if (validarEmailLogico(dato) === false) {
        $("#errorEmailU").html("El correo electronico no es correcto");
        $("#errorEmailU").addClass("alert alert-danger");
    }
    else{
        $("#errorEmailU").removeClass("alert alert-danger");
        $("#errorEmailU").html(" ");
    }
}


function validarPassword() {
    var dato = $(this).val();
    if (!validarPasswordLogico(dato)) {
        $("#errorPassword").html("La contraseña ingresada no es valida. La misma debe tener al menos 8 caracteres, 1 mayusucula, 1 numero y 1 minuscula");
        $("#errorPassword").addClass("alert alert-danger");
       
    }else{
        $("#errorPassword").removeClass("alert alert-danger");
        $("#errorPassword").html(" ");
    }

}

function mostrarPassword(){    
    var x = document.getElementById("txtPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function validarEmailLogico(mail) {
    var retorno = true;
    var patron = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!patron.test(mail)) {
       retorno = false;
    }
    return retorno;
}

function validarPasswordLogico(password) {
    var retorno = false;
    var patron = /^(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ]/;
    if (password.length >=8 && patron.test(password)) {
       retorno=true;
    }
    
    return retorno;

}