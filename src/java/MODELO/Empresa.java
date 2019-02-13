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
public class Empresa {
    private int id_empresa;
    private String nombre;
    private String direccion;
    private String nif;
    private String web;
    private String email;
    
    /**
     * Contructor de la clase Empresa con todos los parametros
     * @param id_empresa El parámetro id corresponde al id de la tabla datos_empresa
     * @param nombre El parámetro nombre indica el nombre de la empresa
     * @param direccion El parámetro direccion indica la direccion de la empresa
     * @param nif El parámetro nif indica el nif de la empresa
     * @param web El parámetro web indica la direccion web de la empresa
     */
    public Empresa(int id_empresa, String nombre, String direccion, String nif, String web, String email) {
        this.id_empresa = id_empresa;
        this.nombre = nombre;
        this.direccion = direccion;
        this.nif = nif;
        this.web = web;
        this.email = email;
    }
    
    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public int getId_empresa() {
        return id_empresa;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getNif() {
        return nif;
    }

    public String getWeb() {
        return web;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "Empresa{" + "id_empresa=" + id_empresa + ", nombre=" + nombre + ", direccion=" + direccion + ", nif=" + nif + ", web=" + web + '}';
    }
}
