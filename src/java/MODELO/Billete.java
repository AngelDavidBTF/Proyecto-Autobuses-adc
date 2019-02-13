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
public class Billete {
    private ViajeSeleccionado objSeleccionado;
    private String localizador;
    private Cliente cliente;

    /**
     * Constructor
     * @param objSeleccionado Objeto de la clase ViajeSelecionado
     */
    public Billete(ViajeSeleccionado objSeleccionado) {
        this.objSeleccionado = objSeleccionado;
    }
     /**
      * Contructor
      * @param objSeleccionado Objeto de la clase ViajeSelecionado
      * @param localizador String  lozalizador
      * @param cliente Objeto de la clase Cliente
      */
    public Billete(ViajeSeleccionado objSeleccionado, String localizador, Cliente cliente) {
        this.objSeleccionado = objSeleccionado;
        this.localizador = localizador;
        this.cliente = cliente;
    }
    
    public void setObjSeleccionado(ViajeSeleccionado objSeleccionado) {
        this.objSeleccionado = objSeleccionado;
    }

    public void setLocalizador(String localizador) {
        this.localizador = localizador;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ViajeSeleccionado getObjSeleccionado() {
        return objSeleccionado;
    }

    public String getLocalizador() {
        return localizador;
    }

    public Cliente getCliente() {
        return cliente;
    }

    @Override
    public String toString() {
        return "Billete{" + "objSeleccionado=" + objSeleccionado + ", localizador=" + localizador + ", cliente=" + cliente + '}';
    }
}
