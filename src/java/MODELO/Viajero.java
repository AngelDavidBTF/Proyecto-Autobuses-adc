/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import java.time.LocalDate;

/**
 *
 * @author Angel David
 */
public class Viajero {
    private int idViajero;
    private String dni;
    private String nombre;
    private String apellidos;
    private LocalDate fechaNac;
    
    /**
     * Constructor
     * @param dni String, nos indica el dni del viajero
     * @param nombre String, nos indica el nombre 
     * @param apellidos String, nos indica los apellidos
     * @param fechaNac LocalDate, nos indica la fecha de nacimiento
     */
    public Viajero(String dni, String nombre, String apellidos, LocalDate fechaNac) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fechaNac = fechaNac;
    }
    
    /**
     * Constructor
     * @param idViajero int, nos indica el id que corresponde en la base de datos
     * @param dni String, nos indica el dni del viajero
     * @param nombre String, nos indica el nombre del viajero
     * @param apellidos String, nos indica los apellidos del viajero
     * @param fechaNac LocalDate, nos indica la fecha de nacimiento del viajero
     */
    public Viajero(int idViajero, String dni, String nombre, String apellidos, LocalDate fechaNac) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fechaNac = fechaNac;
    }
    
    public Viajero(int idViajero) {
        this.idViajero = idViajero;
    }

    public void setIdViajero(int idViajero) {
        this.idViajero = idViajero;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setFechaNac(LocalDate fechaNac) {
        this.fechaNac = fechaNac;
    }

    public int getIdViajero() {
        return idViajero;
    }

    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public LocalDate getFechaNac() {
        return fechaNac;
    }

    @Override
    public String toString() {
        return "Viajero{" + "idViajero=" + idViajero + ", dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNac=" + fechaNac + '}';
    }
}
