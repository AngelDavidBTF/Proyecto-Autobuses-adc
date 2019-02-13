/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ConexionBBDD;
import DAO.Operaciones;
import MODELO.Billete;
import MODELO.GlobalException;
import MODELO.ViajeSeleccionado;
import MODELO.Viajero;
import MODELO.ViajeroConAsiento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel David
 */
public class ServletDatosViajeros extends HttpServlet {

    private Connection Conexion;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(true);
            ViajeSeleccionado S = (ViajeSeleccionado) session.getAttribute("S");

            // Construimos un ArrayList de Viajeros y luego añadimos el asiento correspondiente, ya que el array admite tanto obj_Viajero como obj_ViajeroAsiento
            ArrayList<Viajero> array_ViajerosNuevos = new ArrayList();

            for (int i = 1; i <= S.getnBilletes(); i++) {

                String dni = request.getParameter("dni" + i);
                String nombre = request.getParameter("nombre" + i);
                String apellidos = request.getParameter("apellidos" + i);
                LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac" + i));

                Viajero objViajero = new Viajero(dni, nombre, apellidos, fechaNac);
                array_ViajerosNuevos.add(objViajero);
            }
            
            // AL selecionar el viaje nos traemos los viajeros (solo id y numero de asiento) de ese viaje, y solo damos opcion de selecionar los asientos libres a los nuevos viajeros
            ArrayList<Viajero> arrayViajeros = new ArrayList();
            
            // Monstamos un array de plazas ocupadas para este viaje
            ArrayList<Integer> array_plazasOcupadas = new ArrayList();
            ArrayList<Integer> array_plazasLibres = new ArrayList();
            
            try {
                ArrayList<ViajeroConAsiento> array_ViajeroAsiento = new Operaciones(Conexion).getViajeroConAsiento(S.getViajes().get(0).getId_viaje());               
                
                // LLenamos el arrayList de viajeros del objSelecionado, con los viajeros con asiento que hemos extraido del viaje correspondiente.
                for (int i=0 ; i<array_ViajeroAsiento.size() ; i++) {
                    arrayViajeros.add(array_ViajeroAsiento.get(i));
                    
                    // Rellenamos un array de plazas ocupadas y creamos uno de plazas libres con la diferencia entre ese el total de plazas
                    array_plazasOcupadas.add(array_ViajeroAsiento.get(i).getnAsiento());
                }
                
                S.getViajes().get(0).setViajeros(arrayViajeros);
                
            } catch (GlobalException aex) {
                
            }
            
            // Montamos un raay de plazas libres
            for (int i=1 ; i<=8 ; i++) {

                if (array_plazasOcupadas.contains(i)) {
                    
                } else {
                    array_plazasLibres.add(i);
                }
            }
            
            Billete objBillete = new Billete(S);
            
            // Subimos a session, el objBillete que contiene el objSelecionado que contiene un array de Viajeros que ya se encuentran en el viaje
            // Y subimos el array de viajeros que se van a añadir al viaje y lo unicoque falta es seleccionar su asiento
            session.setAttribute("objBillete", objBillete);
            session.setAttribute("arrayViajerosNuevos", array_ViajerosNuevos);
            session.setAttribute("array_plazasLibres", array_plazasLibres);
            response.sendRedirect("SeleccionAsientos.jsp");
        }
    }

    @Override
    public void init() throws ServletException {
        //super.init(); //To change body of generated methods, choose Tools | Templates.

        /* Establecemos la conexión, si no existe */
        try {
            ConexionBBDD ConexBD = ConexionBBDD.GetConexion();
            Conexion = ConexBD.GetCon();
        } catch (ClassNotFoundException cnfe) {
        } catch (SQLException sqle) {
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
