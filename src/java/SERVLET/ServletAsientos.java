/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ConexionBBDD;
import MODELO.Billete;
import MODELO.Viajero;
import MODELO.ViajeroConAsiento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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
public class ServletAsientos extends HttpServlet {

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

            // Sacamos de session el objBillete y el array con los datos de los nuevos viajeros
            HttpSession session = request.getSession(true);
            Billete objBillete = (Billete) session.getAttribute("objBillete");
            ArrayList<Viajero> arrayViajerosNuevos = (ArrayList<Viajero>) session.getAttribute("arrayViajerosNuevos");

            // Obtenemos el numero de asiento de cada pasajero, extraemos el objViajero y añadimos un ViajeroConAsiento
            ArrayList<Viajero> array_ViajeroAsiento = new ArrayList();
            
            for (int i = 0; i < arrayViajerosNuevos.size(); i++) {

                int asiento = Integer.parseInt(request.getParameter("asiento" + i ));
                ViajeroConAsiento objViajeroAsiento = new ViajeroConAsiento(arrayViajerosNuevos.get(i), asiento);
                array_ViajeroAsiento.add(objViajeroAsiento);
            }
            
            objBillete.getObjSeleccionado().getViajes().get(0).setViajeros(array_ViajeroAsiento);

            session.setAttribute("objBillete", objBillete);
            response.sendRedirect("Resumen.jsp");

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
