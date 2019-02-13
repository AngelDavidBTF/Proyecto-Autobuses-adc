/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELO.Billete;
import MODELO.Cliente;
import MODELO.Empresa;
import MODELO.Estacion;
import MODELO.GlobalException;
import MODELO.Horario;
import MODELO.Ruta;
import MODELO.Tarjeta;
import MODELO.Viaje;
import MODELO.Viajero;
import MODELO.ViajeroConAsiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *  En esta clase se realizan todas las Operaciones con la base de datos
 * @author Angel David
 */
public class Operaciones {
     private String varEnciptacion = "AngelDavid";

    private Connection Conexion;

    /**
     * Constructor
     *
     * @param conexion Parámetro para la conexión con la base de datos
     */
    public Operaciones(Connection conexion) {
        this.Conexion = conexion;
    }
    
    /**
     * Método que genera un array de objetos Estacion con todas las
     * estaciones
     *
     * @return Array con Objetos de la clase Estación
     * @throws MODELO.GlobalException Exception propia de la aplicación
     * 
     */
    public ArrayList<Estacion> getEstaciones() throws GlobalException {

        ArrayList<Estacion> arrayEstacion = new ArrayList();
        String ordenSQL = "SELECT * FROM estacion";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            while (res.next()) {
                int id = res.getInt("id_estacion");
                String localidad = res.getString("localidad");
                String direccion = res.getString("direccion");
                String nombre = res.getString("nombre");

                Estacion E = new Estacion(id, localidad, direccion, nombre);
                arrayEstacion.add(E);
            }
        }catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al cargar las estaciones");
        }
        return arrayEstacion;
    }
    
    /**
     * Método que genera un objeto Empresa extraido de la base datos
     *
     * @return Objeto de la clase Empresa
     * @throws MODELO.GlobalException lanza una excepcion propia de la aplicación
     */
    public Empresa getDatos_empresa() throws GlobalException {

        String ordenSQL = "SELECT * FROM datos_empresa";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id_empresa = res.getInt("id_empresa");
                String nombre = res.getString("nombre");
                String direccion = res.getString("direccion");
                String nif = res.getString("nif");
                String web = res.getString("web");
                String email = res.getString("email");

                Empresa E = new Empresa(id_empresa, nombre, direccion, nif, web, email);
                return E;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al cargar los datos de la empresa");
        }
    }
    
    /**
     * Método que genera un array de objetos Estacion, que
     * contiene la estacion de destino a partir del id de una estacion de
     * origen
     *
     * @param id_estacion_origen int, que indica el id de la estación de origen
     * @return Array de objetos de la clase Estacion
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public ArrayList<Estacion> getEstaciones_destino(int id_estacion_origen) throws GlobalException {

        ArrayList<Estacion> arrayEstacion_destino = new ArrayList();

        // extraemos los id de las estaciones de destino a partir del id de estacion de origen
        String ordenSQL1 = "SELECT id_estacion_destino FROM ruta WHERE id_estacion_origen = '" + id_estacion_origen + "'";

        try {
            Statement s1 = Conexion.createStatement();
            ResultSet res1 = s1.executeQuery(ordenSQL1);

            while (res1.next()) {
                // Extraemos el id
                int id_estacion_destino = res1.getInt("id_estacion_destino");

                // Pasamos el id_destino al metodo y nos devuelve un obj_estacion  y lo añadimos al array
                arrayEstacion_destino.add(this.getEstacion(id_estacion_destino));
            }
            return arrayEstacion_destino;

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error AJAX");
        }
    }
    
    /**
     * Método que genera un objeto Estacion a partir de un id de
     * estación
     *
     * @param id_estacion int, que contiene el id de la estación
     * @return Objeto de la claseEstación
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Estacion getEstacion(int id_estacion) throws GlobalException {

        String ordenSQL = "SELECT * FROM estacion WHERE id_estacion='" + id_estacion + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                String localidad = res.getString("localidad");
                String direccion = res.getString("direccion");
                String nombre = res.getString("nombre");

                Estacion E = new Estacion(id_estacion, localidad, direccion, nombre);
                return E;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error AJAX id estacion");
        }
    }
    
    /**
     * Método que genera un objeto Ruta a parir de un id, estacion de
     * origen y de destino
     *
     * @param id_estacion_origen Int, que contiene el id de la estacion de
     * origen
     * @param id_estacion_destino Int, que contiene el id de la estacion de
     * destino
     * @return Objeto de la clase Ruta
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Ruta getRuta(int id_estacion_origen, int id_estacion_destino) throws GlobalException {

        String ordenSQL = "SELECT * FROM ruta WHERE id_estacion_origen='" + id_estacion_origen + "' AND id_estacion_destino='" + id_estacion_destino + "'";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id_ruta = res.getInt("id_ruta");
                int distancia = res.getInt("distancia");
                int precio = res.getInt("precio");

                Ruta R = new Ruta(id_ruta, id_estacion_origen, id_estacion_destino, distancia, precio);
                return R;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error en la obtencion de ruta");
        }
    }
    
    /**
     * Método que devuelve un ArrayList de objetos de la clase horario a partir
     * de un Objeto de la clase Ruta
     *
     * @param R Parametro Objeto de la clase Ruta
     * @return ArrayList ArrayList con objetos de la clase Horario
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public ArrayList<Horario> getHorarios(Ruta R) throws GlobalException {

        ArrayList<Horario> arrayHorarios = new ArrayList();
        String ordenSQL = "SELECT * FROM horario WHERE id_ruta = '" + R.getId() + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            while (res.next()) {

                int id_horario = res.getInt("id_horario");
                int id_ruta = res.getInt("id_ruta");
                LocalTime hora_salida = res.getTime("hora_salida").toLocalTime();
                LocalTime hora_llegada = res.getTime("hora_llegada").toLocalTime();
                String dia = res.getString("dia");

                Horario H = new Horario(id_horario, id_ruta, hora_salida, hora_llegada, dia);
                arrayHorarios.add(H);
            }
            return arrayHorarios;

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error en la obtencion de horarios");
        }
    }
    
    /**
     * Método que devuelve los viajes a los que corresponden los horarios y la
     * fecha proporcinada
     *
     * @param arrayHorarios ArrayList de Objetos de la clase Horario
     * @param fecha LocalDate, fecha a partir de la cual se buscan los viajes
     * @param nBilletes int, numero de billetes que quiere el usuario y filtran los viajes
     * @return ArrayList de Objetos de la clase Viaje
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public ArrayList<Viaje> getViajes(ArrayList<Horario> arrayHorarios, LocalDate fecha, int nBilletes) throws GlobalException {

        ArrayList<Viaje> arrayViajes = new ArrayList();

        for (int i = 0; i < arrayHorarios.size(); i++) {

            String ordenSQL = "SELECT * FROM viaje WHERE id_horario='" + arrayHorarios.get(i).getId() + "' AND fecha='" + fecha + "' AND (8 - plazas_ocupadas) >= '" + nBilletes + "';";

            try {
                Statement s = Conexion.createStatement();
                ResultSet res = s.executeQuery(ordenSQL);

                while (res.next()) {

                    int id_viaje = res.getInt("id_viaje");
                    int plazas_ocupadas = res.getInt("plazas_ocupadas");

                    Viaje V = new Viaje(id_viaje, arrayHorarios.get(i), fecha, plazas_ocupadas);
                    arrayViajes.add(V);
                }

            } catch (SQLException sqle) {
                String msjerror = sqle.getMessage();
                int codigo = sqle.getErrorCode();
                throw new GlobalException(msjerror, codigo, "Error al obtener el viaje");
            }
        }
    // Si el array de viajes esta vacio sacamos la Exception
        if (arrayViajes.size() > 0) {
            return arrayViajes;
        } else {
            throw new GlobalException("", 0, "No se ha encontrado ningun viaje para esas fechas.");
        }
    }
    
    /**
     * Método que genera un objeto Estacion a partir de una localidad
     *
     * @param localidad String, que contiene la lozalidad
     * @return Objeto de la clase Estación
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Estacion getEstacion(String localidad) throws GlobalException {

        String ordenSQL = "SELECT * FROM estacion WHERE localidad='" + localidad + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id_estacion = Integer.parseInt(res.getString("id_estacion"));
                String direccion = res.getString("direccion");
                String nombre = res.getString("nombre");

                Estacion E = new Estacion(id_estacion, localidad, direccion, nombre);
                return E;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al recoger la estacion");
        }
    }
    
    /**
     *  Método que devulve un Horario a partir de su id
     * @param idHorario int, nos indica el id correspondiente en la base de datos
     * @return Objeto de la clase Horario completo
     * @throws MODELO.GlobalException Exception propia de la aplicación 
     */
    public Horario getHorario(int idHorario) throws GlobalException {

        String ordenSQL = "SELECT * FROM horario WHERE id_horario = '" + idHorario + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id_horario = res.getInt("id_horario");
                int id_ruta = res.getInt("id_ruta");
                LocalTime hora_salida = res.getTime("hora_salida").toLocalTime();
                LocalTime hora_llegada = res.getTime("hora_llegada").toLocalTime();
                String dia = res.getString("dia");

                Horario objHorario = new Horario(id_horario, id_ruta, hora_salida, hora_llegada, dia);
                return objHorario;
            } else {
                return null;
            }
        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el horario");
        }
    }
    
    /**
     * Funcion que devuelve un Viaje apartir de un idHorario
     * 
     * @param idHorario int, nos indica el id
     * @param fecha LocalDate, nos indcia la fecha para extraer el Viaje
     * @return Objeto de la clase Viaje
     @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Viaje getViaje(int idHorario, LocalDate fecha) throws GlobalException {

        Horario objHorario = this.getHorario(idHorario);
        String ordenSQL = "SELECT * FROM viaje WHERE id_horario = '" + idHorario + "' AND fecha = '" + fecha + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id_viaje = res.getInt("id_viaje");
                //LocalDate fecha = LocalDate.parse(res.getString(("fecha")));
                int plazas_ocupadas = res.getInt("plazas_ocupadas");

                Viaje objViaje = new Viaje(id_viaje, objHorario, fecha, plazas_ocupadas);

                return objViaje;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el viaje");
        }
    }
    
    /**
     * Funcion que devuelve un Array con un objeto llamado objViajeroAsiento que contiene solo idViajero y
     * nAsiento en funcion de un idViaje
     *
     * @param idViaje int, nos indica el id correspondiente en la base de datos
     * @return ArrayList de Objetos de la clase ViajeroAsiento
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public ArrayList<ViajeroConAsiento> getViajeroConAsiento(int idViaje) throws GlobalException {

        String ordenSQL = "SELECT * FROM ocupacion WHERE id_reserva IN (SELECT id_reserva FROM reserva WHERE id_viaje = '" + idViaje + "');";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            ArrayList<ViajeroConAsiento> arrayViajeroAsiento = new ArrayList();

            while (res.next()) {

                int id_viajero = res.getInt("id_viajero");
                int num_asiento = res.getInt("num_asiento");

                ViajeroConAsiento objViajeroAsiento = new ViajeroConAsiento(id_viajero, num_asiento);
                arrayViajeroAsiento.add(objViajeroAsiento);
            }

            return arrayViajeroAsiento;

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el viajero con el asiento");
        }
    }
    
    /**
     * Funcion que devuelve el id del cliente que corresponde con el dni especifico
     * 
     * @param dni String, dni del cliente
     * @return int id que corresponde al id en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación 
     */
    public int getId_cliente(String dni) throws GlobalException {

        String ordenSQL = "SELECT id_cliente FROM cliente WHERE dni='" + dni + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id = res.getInt("id_cliente");
                return id;
            } else {
                return -1;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el id cliente");
        }
    }
    
    /**
     * Funcion que nos devuelve un Cliente en función de su id
     * 
     * @param idCliente int, nos indica el id del cliente que corresponde en al base de datos
     * @return Objeto de la clase Cliente
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Cliente getCliente(int idCliente) throws GlobalException {

        String ordenSQL = "SELECT * FROM cliente WHERE id_cliente = '" + idCliente + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                String dni = res.getString("dni");
                String pass = res.getString("pass");
                String nombre = res.getString("nombre");
                String apellidos = res.getString("apellidos");
                String direccion = res.getString("direccion");
                String email = res.getString("email");
                String telefono = res.getString("telefono");
                LocalDate fechaNac = LocalDate.parse(res.getString("fecha_nac"));

                Cliente objCliente = new Cliente(idCliente, dni, pass, nombre, apellidos, direccion, email, telefono, fechaNac);

                return objCliente;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el cliente");
        }
    }
    
    /**
     * Función que nos indica si los datos de login de un cliente son correctos o no
     * 
     * @param objCliente Objeto de clase Cliente
     * @return boolean, nos indica si los datos son correctos o no
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean loginCliente(Cliente objCliente) throws GlobalException {

        String dni = objCliente.getDni();
        String pass = objCliente.getPass();

        try {

            Statement s = Conexion.createStatement();
            String ordenSQL = "SELECT * FROM cliente WHERE dni='" + dni + "' AND pass = (SELECT AES_ENCRYPT('" + pass + "','AngelDavid'));";
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                return true;
            } else {
                return false;
            }

        } catch (SQLException sqle) {

            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error en el login");
        }
    }
    
    /**
     * Función que nos devulve las tarjetas de un cliente
     * 
     * @param objCliente Objeto de la clase Cliente
     * @return ArrayList con Objetos de la clase Tarjeta
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public ArrayList<Tarjeta> getTarjetas(Cliente objCliente) throws GlobalException {

        int idCliente = objCliente.getidCliente();

        String ordenSQL = "SELECT *, AES_DECRYPT(numero,'AngelDavid') AS numero_des FROM tarjeta WHERE id_cliente = '" + idCliente + "';";

        ArrayList<Tarjeta> arrayTarjetas = new ArrayList();
        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            while (res.next()) {

                int idTarjeta = res.getInt("id_tarjeta");
                String numero = res.getString("numero_des");
                LocalDate fecha_cad = LocalDate.parse(res.getString(("fecha_cad")));
                String cvv = res.getString("cvv");

                Tarjeta objTarjeta = new Tarjeta(idTarjeta, numero, fecha_cad, cvv);

                arrayTarjetas.add(objTarjeta);
            }

            return arrayTarjetas;

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener las tarjetas");
        }
    }
    
    /**
     * Función que nos indica el id de la tarjeta en funcion de su numero
     * 
     * @param numeroEncrip String, nos indica el número de la tarjeta
     * @return int, nos indica el id del viaje correspondiente en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación 
     */
    public int getId_tarjeta(String numeroEncrip) throws GlobalException {

        String ordenSQL = "SELECT id_tarjeta FROM tarjeta WHERE numero = (SELECT AES_ENCRYPT('" + numeroEncrip + "','" + varEnciptacion + "'));";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id = res.getInt("id_tarjeta");
                return id;
            } else {
                return -1;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el id de la tarjeta");
        }
    }
    
    /**
     * Función de devuelve una Tarjeta en funcion del id
     * 
     * @param idTarjeta int, nos indica el id correspondiente en la base de datos
     * @return Objeto de la clase Tarjeta
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public Tarjeta getTarjeta(int idTarjeta) throws GlobalException {

        String ordenSQL = "SELECT (SELECT AES_DECRYPT(numero,'" + varEnciptacion + "')) AS numero, fecha_cad, cvv FROM tarjeta WHERE id_tarjeta = '" + idTarjeta + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                String numero = res.getString("numero");
                LocalDate fecha_cad = LocalDate.parse(res.getString(("fecha_cad")));
                String cvv = res.getString("cvv");

                Tarjeta objTarjeta = new Tarjeta(idTarjeta, numero, fecha_cad, cvv);

                return objTarjeta;
            } else {
                return null;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener la tarjeta");
        }
    }
    
    /**
     * Función para generar aleatoriamente un localizador para la reserva
     * 
     * @return Sttrin, nos indica el localizador
     */
    public String addLocalizador() {
        String[] abecedario = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

        String cadena = "";
        for (int i = 0; i < 4; i++) {

            int numRandon = (int) Math.round(Math.random() * 26);

            cadena = cadena + abecedario[numRandon];
        }

        return cadena;
    }
    
    /**
     * Función que se engarga de guardar el Billete
     * 
     * @param objBillete Objeto de la clase Billete, que contiene todos los datos que debemos guardar
     * @return boolean, nos indica si se ha realizado correctamente el guardo de los datos del Objeto Billete
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean guardarBillete(Billete objBillete) throws GlobalException {

        try {

            Conexion.setAutoCommit(false);
            Statement s = Conexion.createStatement();

            // Guardamos los Viajeros
            ArrayList<Viajero> arrayViajeros = objBillete.getObjSeleccionado().getViajes().get(0).getViajeros();

            boolean resViajero = false;

            for (int i = 0; i < arrayViajeros.size(); i++) {

                resViajero = this.insertViajero(arrayViajeros.get(i));
            }

            // Guardamos cliente    
            Cliente objCliente = objBillete.getCliente();
            boolean resCliente = this.insertarCliente(objCliente);

            // Guardamos la tarjeta del cliente
            Tarjeta objTarjeta = objCliente.getArray_tarjetas().get(0);
            boolean resTarjeta = this.insertarTarjeta(objTarjeta, objCliente);

            // Guardamos los datos de la reserva
            String localizador = objBillete.getLocalizador();
            Viaje objViaje = objBillete.getObjSeleccionado().getViajes().get(0);
            boolean resReserva = this.insertarReserva(objViaje, objTarjeta, localizador);

            // Guardamos los datos de Ocupacion
            boolean resOcupacion = false;
            boolean resAumentarPlazas = false;
            for (int i = 0; i < arrayViajeros.size(); i++) {

                ViajeroConAsiento objViajeroAsiento = (ViajeroConAsiento) arrayViajeros.get(i);
                resOcupacion = this.setOcupacion(objViajeroAsiento, objBillete);
                resAumentarPlazas = this.aumentarPlazaOcupadaViaje(objViaje.getId_viaje());
            }

            if (resViajero && resCliente && resTarjeta && resReserva && resOcupacion && resAumentarPlazas) {
                Conexion.commit();
                return true;
            } else {
                Conexion.rollback();
                return false;
            }
            
        } catch (GlobalException aex) {

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error insertar viajero");
        }

        return false;
    }
    
    /**
     * Función que inserta un Viajero en la base de datos
     * 
     * @param objViajero Objeto de la clase Viajero
     * @return boolean, nos indica si se ha realizado bien la inserción en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean insertViajero(Viajero objViajero) throws GlobalException {

        String dni = objViajero.getDni();
        String nombre = objViajero.getNombre();
        String apellidos = objViajero.getApellidos();
        LocalDate fechaNac = objViajero.getFechaNac();

        String ordenSQL1 = "SELECT * FROM viajero WHERE nif = '" + dni + "';";

        try {
            Statement s1 = Conexion.createStatement();
            ResultSet res1 = s1.executeQuery(ordenSQL1);

            if (!res1.next()) {

                String ordenSQL = "INSERT INTO viajero VALUES(null,?,?,?,?)";

                try {
                    PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

                    sentencia.setString(1, dni);
                    sentencia.setString(2, nombre);
                    sentencia.setString(3, apellidos);
                    sentencia.setDate(4, java.sql.Date.valueOf(fechaNac));

                    int res = sentencia.executeUpdate();

                    if (res == 0) {
                        return false;
                    } else {
                        return true;
                    }

                } catch (SQLException sqle) {
                    String msjerror = sqle.getMessage();
                    int codigo = sqle.getErrorCode();
                    throw new GlobalException(msjerror, codigo, "Error al agregar viajero");
                }
            } else {
                return true;
            }

        } catch (SQLException sqle1) {
            String msjerror = sqle1.getMessage();
            int codigo = sqle1.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error comprobar si existe el viaje");
        }
    }
    
    /**
     * Función que inserta un Cliente en la base de datos
     * 
     * @param objCliente Objeto de la clase Cliente
     * @return boolean, nos indica si se ha realizado bien la inserción en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean insertarCliente(Cliente objCliente) throws GlobalException {

        String dni = objCliente.getDni();
        String pass = objCliente.getPass();
        String nombre = objCliente.getNombre();
        String apellidos = objCliente.getApellidos();
        String direccion = objCliente.getDireccion();
        String email = objCliente.getEmail();
        String telefono = objCliente.getTelefono();
        LocalDate fechaNac = objCliente.getFechaNac();

        String ordenSQL1 = "SELECT * FROM cliente WHERE dni='" + dni + "';";

        try {
            Statement s1 = Conexion.createStatement();
            ResultSet res1 = s1.executeQuery(ordenSQL1);

            if (!res1.next()) {

                String ordenSQL = "INSERT INTO cliente VALUES(null,?,AES_ENCRYPT(?,'" + varEnciptacion + "'),?,?,?,?,?,?)";

                try {
                    PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

                    sentencia.setString(1, dni);
                    sentencia.setString(2, pass);
                    sentencia.setString(3, nombre);
                    sentencia.setString(4, apellidos);
                    sentencia.setString(5, direccion);
                    sentencia.setString(6, email);
                    sentencia.setString(7, telefono);
                    sentencia.setDate(8, java.sql.Date.valueOf(fechaNac));

                    int res = sentencia.executeUpdate();

                    if (res == 0) {
                        return false;
                    } else {
                        return true;
                    }

                } catch (SQLException sqle) {
                    String msjerror = sqle.getMessage();
                    int codigo = sqle.getErrorCode();
                    throw new GlobalException(msjerror, codigo, "Error al insertar cliente");
                }

            } else {
                return true;
            }

        } catch (SQLException sqle1) {
            String msjerror = sqle1.getMessage();
            int codigo = sqle1.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error comprobar si existe el cliente");
        }
    }
    
    /**
     * Funcion que inserta una Tarjeta en la base de datos
     * 
     * @param objTarjeta Objeto de la clase Tarjeta
     * @param objCliente Objeto de la clase Cliente, nos indica al Cliente que pertenece la tarjeta
     * @return boolean, nos indica si la inserción se ha realizado correctamente
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean insertarTarjeta(Tarjeta objTarjeta, Cliente objCliente) throws GlobalException {

        String numero = objTarjeta.getNumero();
        LocalDate fechaCad = objTarjeta.getFecha_cad();
        String cvv = objTarjeta.getCvv();

        int idCliente = this.getId_cliente(objCliente.getDni());

        // Extraemos el id del cliente
        if (idCliente == -1) {
            return false;
        } else {

            String ordenSQL1 = "SELECT id_tarjeta FROM tarjeta WHERE numero = (SELECT AES_ENCRYPT('" + numero + "','" + varEnciptacion + "'));";

            try {
                Statement s1 = Conexion.createStatement();
                ResultSet res1 = s1.executeQuery(ordenSQL1);

                if (!res1.next()) {

                    String ordenSQL = "INSERT INTO tarjeta VALUES(null,AES_ENCRYPT(?,'" + varEnciptacion + "'),?,?,?)";

                    try {
                        PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

                        sentencia.setString(1, numero);
                        sentencia.setDate(2, java.sql.Date.valueOf(fechaCad));
                        sentencia.setInt(3, idCliente);
                        sentencia.setString(4, cvv);

                        int res = sentencia.executeUpdate();

                        if (res == 0) {
                            return false;
                        } else {
                            return true;
                        }

                    } catch (SQLException sqle) {
                        String msjerror = sqle.getMessage();
                        int codigo = sqle.getErrorCode();
                        throw new GlobalException(msjerror, codigo, "Error al insertar tarjeta");
                    }
                } else {
                    return true;
                }

            } catch (SQLException sqle) {
                String msjerror = sqle.getMessage();
                int codigo = sqle.getErrorCode();
                throw new GlobalException(msjerror, codigo, "Error comprobar si existe Tarjeta");
            }
        }
    }
    
    /**
     * Función que se encarga de realizar la inserción de la reserva en la base de datos
     * 
     * @param objViaje Objeto de la clase Viaje
     * @param objTarjeta Objeto de la clase Tarjeta
     * @param localizador String, nos indica el localizador de la reserva
     * @return boolean, nos indica si se ha realizado correctamente la inserción
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean insertarReserva(Viaje objViaje, Tarjeta objTarjeta, String localizador) throws GlobalException {

        //int idViaje = this.getId_Viaje(objViaje.getHorario().getId());
        int idTarjeta = this.getId_tarjeta(objTarjeta.getNumero());

        String ordenSQL = "INSERT INTO reserva VALUES(null,?,?,?)";

        try {
            PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

            sentencia.setInt(1, objViaje.getId_viaje());
            sentencia.setInt(2, idTarjeta);
            sentencia.setString(3, localizador);

            int res = sentencia.executeUpdate();

            if (res == 0) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al insertar reserva");
        }
    }
    
    /**
     * Función que se encarga de realizar la inserción de ocupación en la base de datos
     * 
     * @param objViajeroAsiento Objeto de la clase ViajerAsiento
     * @param objBillete Objeto de la clase Billete
     * @return boolean, nos indica si se ha realizado correctamente la inserción en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación 
     */
    public boolean insertarOcupacion(ViajeroConAsiento objViajeroAsiento, Billete objBillete) throws GlobalException {

        int idReserva = this.getId_reserva(objBillete.getLocalizador());

        int idViajero = this.get_idViajero(objViajeroAsiento.getDni());

        String ordenSQL = "INSERT INTO ocupacion VALUES(null,?,?,?)";

        try {
            PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

            sentencia.setInt(1, idViajero);
            sentencia.setInt(2, objViajeroAsiento.getnAsiento());
            sentencia.setInt(3, idReserva);

            int res = sentencia.executeUpdate();

            if (res == 0) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al insertar ocupacion");
        }
    }
    /**
     * Funcino que devuelve el id de la reserva en funcion del localizador de la misma
     * 
     * @param localizador String, nos indica el localizador del viaje
     * @return int, nos indica el id correspondiente en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public int getId_reserva(String localizador) throws GlobalException {

        String ordenSQL = "SELECT id_reserva FROM reserva WHERE localizador = '" + localizador + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id = res.getInt("id_reserva");
                return id;
            } else {
                return -1;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el id de la reserva");
        }
    }
    
    /**
     *  Método que devuele el id de viajero que corresponde con el dni recibido
     * 
     * @param dni, String dni del viajero que a partir de el se saca el id
     * @return int; nos indica el id del viajero correspondiente en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public int get_idViajero(String dni) throws GlobalException {
        String ordenSQL = "SELECT id_viajero FROM viajero WHERE nif='" + dni + "';";

        try {
            Statement s = Conexion.createStatement();
            ResultSet res = s.executeQuery(ordenSQL);

            if (res.next()) {

                int id = res.getInt("id_viajero");
                return id;
            } else {
                return -1;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obtener el id viajero");
        }
    }
    
    /**
     * Función que se encarga de realizar la inserción de ocupación en la base de datos
     * 
     * @param objViajeroAsiento Objeto de la clase ViajerAsiento
     * @param objBillete Objeto de la clase Billete
     * @return boolean, nos indica si se ha realizado correctamente la inserción en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación 
     */
    public boolean setOcupacion(ViajeroConAsiento objViajeroAsiento, Billete objBillete) throws GlobalException {

        int idReserva = this.getId_reserva(objBillete.getLocalizador());

        int idViajero = this.get_idViajero(objViajeroAsiento.getDni());

        String ordenSQL = "INSERT INTO ocupacion VALUES(null,?,?,?)";

        try {
            PreparedStatement sentencia = Conexion.prepareStatement(ordenSQL);

            sentencia.setInt(1, idViajero);
            sentencia.setInt(2, objViajeroAsiento.getnAsiento());
            sentencia.setInt(3, idReserva);

            int res = sentencia.executeUpdate();

            if (res == 0) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error al obetener la ocupacion");
        }
    }
    
    /**
     * Función que se encarga de aumentar las plazas cuando se realiza la reserva de un viaje
     * 
     * @param idViaje int, nos indica el id del viaje que corresponde en la base dedatos
     * @return boolean, nos indica si se ha relizado correctamente la actualización en la base de datos
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean aumentarPlazaOcupadaViaje(int idViaje) throws GlobalException {

        String ordenSQL = "UPDATE viaje set plazas_ocupadas = plazas_ocupadas + 1 WHERE id_viaje = '" + idViaje + "';";

        try {
            Statement s = Conexion.createStatement();
            boolean res = s.execute(ordenSQL);

            if (res) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error en insertar plaza viaje");
        }
    }
    
    /**
     * Función para hacer backUp Vije a la estación
     * 
     * @param idViaje int, nos indica el id del viaje correspondiente en la base de datos
     * @return boolean, nos indica si se ha realizado correctamente la eliminacion del viaje
     * @throws MODELO.GlobalException Excepcion propia de la aplicación
     */
    public boolean backUp(int idViaje) throws GlobalException {

        String ordenSQL = "DELETE FROM viaje WHERE id_viaje = '" + idViaje + "'";

        try {
            Statement s = Conexion.createStatement();
            int res = s.executeUpdate(ordenSQL);

            if (res == 0) {
                return false;
            } else {
                return true;
            }

        } catch (SQLException sqle) {
            String msjerror = sqle.getMessage();
            int codigo = sqle.getErrorCode();
            throw new GlobalException(msjerror, codigo, "Error en el BackUP");
        }
    }
    
}
