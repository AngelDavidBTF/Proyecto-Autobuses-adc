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
public class Estacion {
     private int id;
    private String localidad;
    private String direccion;
    private String nombre;
    
    /**
     * Constructor de la clase Estacion con todos los parametos de la tabla Estacion
     * @param id El parámetro id corresponde al id de la tabla estacion
     * @param localidad String, indica el nombre de la localidad de la estación
     * @param direccion String indica la dirección donde se encuentra la estacion
     * @param nombre String, indica el nombre de la estacion 
     */
    public Estacion(int id, String localidad, String direccion, String nombre) {
        this.id = id;
        this.localidad = localidad;
        this.direccion = direccion;
        this.nombre = nombre;
    }
    /**
     * Constructor de la clase Estacion sin el id
     * @param localidad String, indica el nombre de la localidad de la estación
     * @param direccion String indica la dirección donde se encuentra la estacion
     * @param nombre String, indica el nombre de la estacion 
     */
    public Estacion(String localidad, String direccion, String nombre) {
        this.localidad = localidad;
        this.direccion = direccion;
        this.nombre = nombre;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "Estacion{" + "id=" + id + ", localidad=" + localidad + ", direccion=" + direccion + ", nombre=" + nombre + '}';
    }
}
