$(document).ready(function () {
    $("#origen").change(function () {

        // dejamos vacias las option del select de destino y el valor vacio para que al cambiar no se quede el ultimo seleccionado
        $('#destino').children('option').remove();
        var origen = $("#origen").val();
        enviar_origen(origen);
    });

});

function AJAXCrearObj() {
    if (window.XMLHttpRequest) {
        // navegadores que siguen los estándares 
        objAjax = new XMLHttpRequest();
    } else {
        // navegadores obsoletos 
        objAjax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return objAjax;
}

function enviar_origen(origen) {

    objAjax_res = AJAXCrearObj();
    objAjax_res.open('GET', 'servlet_Ajax?localidad_origen=' + origen, true); // pasamos el objeto
    objAjax_res.send();
    objAjax_res.onreadystatechange = responder;
}

function responder() {

    if (objAjax_res.readyState == 4) {
        if (objAjax_res.status == 200) {

            $('#destino').append(objAjax_res.responseText);
        }
    }
}

function seleccionHorario(plazasOcupadas, hSalida, hLlegada, idHorario, nBilletes, precio) {

    $('#hSalida').children().remove();
    $('#hLlegada').children().remove();
    $('#calculo').children().remove();
    $('#precioTotal').children().remove();
    $('#hSalida').append("<p> <b> Hora Salida: </b> " + hSalida + "</p>");
    $('#hLlegada').append("<p> <b> Hora Llegada: </b> " + hLlegada + "</p>");
    $('#input_hSalida').attr("value", hSalida);
    $('#input_hLlegada').attr("value", hLlegada);
    $('#input_idHorario').attr("value", idHorario);
    $('#input_plazasOcupadas').attr("value", plazasOcupadas);
    $('#input_precio').attr("value", precio);
    $('#calculo').append("<div> " + precio + "€ x " + nBilletes + " Billetes = " + (nBilletes * precio) + "€ </div>");
    $('#precioTotal').append("<div> Precio Total " + (nBilletes * precio) + "€ </div>");
}

function pasarPasajero(nViajeros) {

    var nombre1 = $('#nombre1').val();
    $('#nombrePasajero1').children().remove();
    $('#nombrePasajero1').append('<p><b> Nombre: </b>' + nombre1 + "</p>");
}

function continuar_infoPasajeros() {

    $('#comprobar_infoPasajeros').click();
}

function continuar_selecAsientos(nBilletes) {
    
    var arrayAsiento = [];
    
    for (var i=0 ; i<nBilletes ; i++) {
        
        arrayAsiento[i] = $('#selectViajero'+i).val();
    }
    
    var res = false;
    for (var i=0 ; i<arrayAsiento.length ; i++) {
        for (var j=i+1 ; j<arrayAsiento.length ; j++) {
            if (arrayAsiento[i] === arrayAsiento[j]) {
                res = true;
            } else {
                res = false;
            }
        }
    }
    
    if (res) {
        alert("No pueden ser selecionado el mismo nº de asiento");
    } else {
        $('#comprobar_selecAsientos').click();
    }
}

// Funcion que rellena los datos de cliente a partir de un pasajero ya introducido
function asignar_datosCliente() {

    var dni_viajero = $('#select_datosCliente').val();

    $('#dni_registro').val(dni_viajero);

}

function select_asiento(array) {

    var valor = $('#selectViajero0').val();
    //alert(valor);
    //alert(array.length);
}

function enviar_asiento() {

    var nAsiento = $('#selectViajero0').val();

    objAjax_res = AJAXCrearObj();
    objAjax_res.open('GET', 'servlet_ajaxSelectAsiento?nAsiento=' + nAsiento, true); // pasamos el obj
    objAjax_res.send();
    objAjax_res.onreadystatechange = responder_asiento;
}

function responder_asiento() {
    if (objAjax_res.readyState == 4) {
        if (objAjax_res.status == 200) {

            alert(objAjax_res.responseText);
        }
    }
}

function comprobarPass() {

    var pass1 = $('#pass1').val();
    var pass = $('#pass').val();

    if (pass === pass1) {

        $('#pass1').removeClass();
        $('#pass1').addClass("form-control is-valid");
        $('#pass').removeClass();
        $('#pass').addClass("form-control is-valid");

        $('#mensajePass1').removeClass();
        $('#mensajePass1').addClass("valid-feedback");
        $('#mensajePass1').empty();
        $('#mensajePass1').append("Las contraseñas coninciden");
        

    } else {
        $('#pass1').removeClass();
        $('#pass1').addClass("form-control is-invalid");
        $('#pass').removeClass();
        $('#pass').addClass("form-control is-invalid");

        $('#mensajePass1').removeClass();
        $('#mensajePass1').addClass("invalid-feedback");
        $('#mensajePass1').empty();
        $('#mensajePass1').append("Las contraseñas no coninciden");
    }
}

function validaDni(dni) {

    var numero
    var letr
    var letra
    var expresion_regular_dni

    expresion_regular_dni = /^\d{8}[a-zA-Z]$/;

    if (expresion_regular_dni.test(dni) == true) {
        numero = dni.substr(0, dni.length - 1);
        letr = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letra = letra.substring(numero, numero + 1);
        if (letra != letr.toUpperCase()) {
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}

function comprobarDni(idInput, idMsj) {

    var valor_input = $('#'+ idInput).val();
    
    if (validaDni(valor_input)) {

        $('#'+ idInput).removeClass();
        $('#'+ idInput).addClass("form-control is-valid");

        $('#'+ idMsj).removeClass();
        $('#'+ idMsj).addClass("valid-feedback");
        $('#'+ idMsj).empty();
        $('#'+ idMsj).append("DNI correcto");

    } else {
        $('#'+ idInput).removeClass();
        $('#'+ idInput).addClass("form-control is-invalid");

        $('#'+ idMsj).removeClass();
        $('#'+ idMsj).addClass("invalid-feedback");
        $('#'+ idMsj).empty();
        $('#'+ idMsj).append("DNI erroneo");
    }
}






