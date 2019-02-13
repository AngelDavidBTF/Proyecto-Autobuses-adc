/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ConexionBBDD;
import MODELO.Billete;
import MODELO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel David
 */
public class ServletRegistro extends HttpServlet {

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
            Billete objBillete = (Billete) session.getAttribute("objBillete");
            
            String dni = request.getParameter("dni");
            String pass = request.getParameter("pass");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            LocalDate fecha_nac = LocalDate.parse(request.getParameter("fecha_nac"));
            String telefono = request.getParameter("telefono");
            
            Cliente objCliente = new Cliente(dni, pass,  nombre, apellidos, direccion, email, telefono, fecha_nac);
                  
            objBillete.setCliente(objCliente);
            
            session.setAttribute("objBillete", objBillete);
            response.sendRedirect("SeleccionTarjeta.jsp");
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
