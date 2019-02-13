/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import java.time.LocalDate;

/**
 * Clase de herencia de Viajero, usada para añadir el numero del asiento
 * @author Angel David
 */
public class ViajeroConAsiento extends Viajero {
    private int nAsiento;
    
    /**
     * Constructor que llama al constuctor de la clase padre
     * @param dni String, dni del viajero
     * @param nombre String,  nombre del viajero
     * @param apellidos String,  apellidos del viajero
     * @param fechaNac LocalDate,  fecha de nacimiento del viajero
     * @param nAsiento int,  número de asiento del viajero
     */
    public ViajeroConAsiento(String dni, String nombre, String apellidos, LocalDate fechaNac, int nAsiento) {
        super(dni, nombre, apellidos, fechaNac);
        this.nAsiento = nAsiento;
    }
    
    /**
     * Constructor que llama al contuctor de la clase padre
     * @param objViajero Objeto de la clase Viajero, recibe y llama a la clase padre para construir todos sus parametros
     * @param nAsiento int, nos indica el número de asiento del viajero 
     */
    public ViajeroConAsiento(Viajero objViajero, int nAsiento) {
        super(objViajero.getDni(), objViajero.getNombre(), objViajero.getApellidos(), objViajero.getFechaNac());
        this.nAsiento = nAsiento;
    }
    
    /**
     * Contructor que llama al contuctor de la clase padre
     * @param idViajero int, nos indica el id que corresponde en la base de datos
     * @param nAsiento int, nos indica el número de asiento del viajero  
     */
    public ViajeroConAsiento(int idViajero, int nAsiento) {
        super(idViajero);
        this.nAsiento = nAsiento;
    }

    public void setnAsiento(int nAsiento) {
        this.nAsiento = nAsiento;
    }

    public int getnAsiento() {
        return nAsiento;
    }

    @Override
    public String toString() {
        return super.toString() + "nAsiento: "+this.nAsiento; //To change body of generated methods, choose Tools | Templates.
    }
}
