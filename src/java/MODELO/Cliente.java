/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Angel David
 */
public class Cliente {
     private int idCliente;
    private String dni;
    private String pass;
    private String nombre;
    private String apellidos;
    private String direccion;
    private String email;
    private LocalDate fechaNac;
    private String telefono;
    
    private ArrayList<Tarjeta> array_tarjetas = new ArrayList();
   
    /**
     * Constructor
     * @param dni String  dni del cliente
     * @param pass String a contraseña del cliente
     * @param nombre String nombre del cliente
     * @param apellidos String os apellidos del cliente
     * @param direccion String a dirección del cliente
     * @param email String email del cliente
     * @param fechaNac LocalDate l fecha de nacimiento del cliente
     * @param telefono String telefono del cliente
     */
    public Cliente(String dni, String pass, String nombre, String apellidos, String direccion, String email, String telefono, LocalDate fechaNac) {
        this.dni = dni;
        this.pass = pass;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.email = email;
        this.fechaNac = fechaNac;
        this.telefono = telefono;
    }
    /**
     * Contructor
     * @param dni String dni del cliente
     * @param pass String a contraseña del cliente
     */
    public Cliente(String dni, String pass) {
        this.dni = dni;
        this.pass = pass;
    }
    /**
     * Contructor
     * @param idCliente int id que tiene el cliente dentro de la base de datos
     * @param dni String dni del cliente
     * @param pass String  contraseña del cliente
     * @param nombre String nombre del cliente
     * @param apellidos String  apellidos del cliente
     * @param direccion String  dirección del cliente
     * @param email String email del cliente
     * @param fechaNac LocalDate  fecha de nacimiento del cliente
     * @param telefono String telefono del cliente
     */
    public Cliente(int idCliente, String dni, String pass, String nombre, String apellidos, String direccion, String email, String telefono, LocalDate fechaNac) {
        this.idCliente = idCliente;
        this.dni = dni;
        this.pass = pass;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.email = email;
        this.fechaNac = fechaNac;
        this.telefono = telefono;
    }   

    public void setidCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFechaNac(LocalDate fechaNac) {
        this.fechaNac = fechaNac;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    /**
     * Metodo para agregar valor a un variable 
     * @param array_tarjetas ArrayList de objetos de la clase Tarjeta
     */
    public void setArray_tarjetas(ArrayList array_tarjetas) {
        this.array_tarjetas = array_tarjetas;
    }

    public int getidCliente() {
        return idCliente;
    }

    public String getDni() {
        return dni;
    }

    public String getPass() {
        return pass;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getEmail() {
        return email;
    }

    public LocalDate getFechaNac() {
        return fechaNac;
    }

    public String getTelefono() {
        return telefono;
    }
    
    public ArrayList<Tarjeta> getArray_tarjetas() {
        return array_tarjetas;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos + ", direccion=" + direccion + ", email=" + email + ", fechaNac=" + fechaNac + ", telefono=" + telefono + ", array_tarjetas=" + array_tarjetas + '}';
    }
}
