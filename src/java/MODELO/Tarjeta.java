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
public class Tarjeta {
    private int idTarjeta;
    private String numero;
    private LocalDate fecha_cad;
    private String cvv;

    /**
     * Contructor
     * @param idTarjeta int, nos indica el id que tiene la tarjeta dentro de la base de datos
     * @param numero int, nos indica el número de la tarjeta
     * @param fecha_cad LocalDate, nos indica la fecha de caducidad
     * @param cvv String, nos indica el cvv de la tarjeta
     */
    public Tarjeta(int idTarjeta, String numero, LocalDate fecha_cad, String cvv) {
        this.idTarjeta = idTarjeta;
        this.numero = numero;
        this.fecha_cad = fecha_cad;
        this.cvv = cvv;
    }
    
    /**
     * Constructor
     * @param numero int, nos indica el número de la tarjeta
     * @param fecha_cad LocalDate, nos indica la fecha de caducidad
     * @param cvv String, nos indica el cvv de la tarjeta
     */
    public Tarjeta(String numero, LocalDate fecha_cad, String cvv) {
        this.numero = numero;
        this.fecha_cad = fecha_cad;
        this.cvv = cvv;
    }
    
    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setFecha_cad(LocalDate fecha_cad) {
        this.fecha_cad = fecha_cad;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public int getIdTarjeta() {
        return idTarjeta;
    }

    public String getNumero() {
        return numero;
    }

    public LocalDate getFecha_cad() {
        return fecha_cad;
    }

    public String getCvv() {
        return cvv;
    }

    @Override
    public String toString() {
        return "Tarjeta{" + "idTarjeta=" + idTarjeta + ", numero=" + numero + ", fecha_cad=" + fecha_cad + ", cvv=" + cvv + '}';
    }
}
