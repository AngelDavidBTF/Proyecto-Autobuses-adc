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
public class ViajeSeleccionado {
    private Estacion estacionOrigen;
    private Estacion estacionDestino;
    private LocalDate fecha;
    private float precio;
    private int distancia;
    private int nBilletes;
    ArrayList<Viaje> Viajes;
    
    /**
     * Constructor
     * @param estacionOrigen objeto de la clase Estacion, la estación de origen
     * @param estacionDestino objeto de la clase Estacion, la estación de destino
     * @param fecha LocalDate, nos indica la fecha selecionada
     * @param precio float, nos indica el precio
     * @param distancia int, nos indica la distancia
     * @param nBilletes int, nos indica el número de billetes que ha selecionado el usuario
     * @param Viajes ArrayList de objetos de la clase Viaje
     */
    public ViajeSeleccionado(Estacion estacionOrigen, Estacion estacionDestino, LocalDate fecha, float precio, int distancia, int nBilletes, ArrayList<Viaje> Viajes) {
        this.estacionOrigen = estacionOrigen;
        this.estacionDestino = estacionDestino;
        this.fecha = fecha;
        this.precio = precio;
        this.distancia = distancia;
        this.nBilletes = nBilletes;
        this.Viajes = Viajes;
    }

    public void setEstacionOrigen(Estacion estacionOrigen) {
        this.estacionOrigen = estacionOrigen;
    }

    public void setEstacionDestino(Estacion estacionDestino) {
        this.estacionDestino = estacionDestino;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }

    public void setnBilletes(int nBilletes) {
        this.nBilletes = nBilletes;
    }

    public void setViajes(ArrayList<Viaje> Viajes) {
        this.Viajes = Viajes;
    }

    public Estacion getEstacionOrigen() {
        return estacionOrigen;
    }

    public Estacion getEstacionDestino() {
        return estacionDestino;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public float getPrecio() {
        return precio;
    }

    public int getDistancia() {
        return distancia;
    }

    public int getnBilletes() {
        return nBilletes;
    }

    public ArrayList<Viaje> getViajes() {
        return Viajes;
    }

    @Override
    public String toString() {
        return "ViajeSeleccionado{" + "estacionOrigen=" + estacionOrigen + ", estacionDestino=" + estacionDestino + ", fecha=" + fecha + ", precio=" + precio + ", distancia=" + distancia + ", nBilletes=" + nBilletes + ", Viajes=" + Viajes + '}';
    }
}
