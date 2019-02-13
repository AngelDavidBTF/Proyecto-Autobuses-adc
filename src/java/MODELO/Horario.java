/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELO;

import java.time.LocalTime;

/**
 *
 * @author Angel David
 */
public class Horario {
    private int id;
    private int id_ruta;
    private LocalTime hora_salida;
    private LocalTime hora_llegada;
    private String dia;

    /**
     * Constructor de la clase Horario con todos los parametros
     * @param id  int, es el id_horario que se encuentra en la base de datos
     * @param id_ruta int, hace referencia de id de la ruta a la que corresponde el horario
     * @param hora_salida LocalTime,  nos idica la hora de salida
     * @param hora_llegada LocalTime, nos idica la hora de llegada
     * @param dia String, nos indica si el dia el Normal ('L') o Fin de semana ('S')
     */
    public Horario(int id, int id_ruta, LocalTime hora_salida, LocalTime hora_llegada, String dia) {
        this.id = id;
        this.id_ruta = id_ruta;
        this.hora_salida = hora_salida;
        this.hora_llegada = hora_llegada;
        this.dia = dia;
    }
 
    /**
     * Contructor
     * @param id int, hace refecencia al id_horario
     */
    public Horario(int id) {
        this.id = id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public void setHora_salida(LocalTime hora_salida) {
        this.hora_salida = hora_salida;
    }

    public void setHora_llegada(LocalTime hora_llegada) {
        this.hora_llegada = hora_llegada;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getId() {
        return id;
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public LocalTime getHora_salida() {
        return hora_salida;
    }

    public LocalTime getHora_llegada() {
        return hora_llegada;
    }

    public String getDia() {
        return dia;
    }

    @Override
    public String toString() {
        return "Horario{" + "id=" + id + ", id_ruta=" + id_ruta + ", hora_salida=" + hora_salida + ", hora_llegada=" + hora_llegada + ", dia=" + dia + '}';
    }
}
