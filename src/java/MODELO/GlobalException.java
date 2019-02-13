/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

/**
 *
 * @author Angel David
 */
public class GlobalException extends Exception {
    private String cadena;
    private int codigo;
    private String message;

    /**
     *  Constructor de la clase propia creada para recoger los errores de la aplicacion
     * @param message, Parámetro que recoge el mensaje que nos devuelve la SQLException
     * @param codigo, Parámetro que recoge el codigo de error que nos devuelve la SQLException
     * @param cadena, Parámetro donde describimos el error
     */
    public GlobalException(String message, int codigo, String cadena) {
        this.message = message;
        this.cadena = cadena;
        this.codigo = codigo;
    }
    
    /**
     *  Método que devuelve la cdena a escribir
     * @return 
     */
    public String getCadena() {
        return cadena;
    }

    @Override
    public String toString() {
        return "GlobalException{" + "cadena=" + cadena + ", codigo=" + codigo + ", message=" + message + '}';
    }
}
