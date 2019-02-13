/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ConexionBBDD;
import DAO.Operaciones;
import MODELO.Billete;
import MODELO.Cliente;
import MODELO.GlobalException;
import MODELO.Tarjeta;
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
public class ServletLogin extends HttpServlet {

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

            String dni = request.getParameter("dni_login");
            String pass = request.getParameter("pass_login");

            Cliente objClienteLogin = new Cliente(dni, pass);

            try {
                boolean resLogin = new Operaciones(Conexion).loginCliente(objClienteLogin);
                
                if (resLogin) {
                    
                    int idCliente = new Operaciones(Conexion).getId_cliente(dni);
                    Cliente objCliente = new Operaciones(Conexion).getCliente(idCliente);
                    ArrayList<Tarjeta> arrayTarjetas = new Operaciones(Conexion).getTarjetas(objCliente);
                    
                    objCliente.setArray_tarjetas(arrayTarjetas);
                    objBillete.setCliente(objCliente);
                    
                    session.setAttribute("objBillete", objBillete);
                    String msj = "Login Correcto";
                    String ruta = "SeleccionTarjeta.jsp";
                    
                    session.setAttribute("msj", msj);
                    session.setAttribute("ruta", ruta);
                    response.sendRedirect("MensajeCorrecto.jsp");
                    
                } else {
                    
                    String msj = "¡Datos Incorrectos!";
                    String ruta = "RegistroLogin.jsp";
                    
                    session.setAttribute("msj", msj);
                    session.setAttribute("ruta", ruta);
                    response.sendRedirect("MensajeCorrecto.jsp");
                }
                
            } catch (GlobalException aex) {

                session.setAttribute("aex", aex);

                response.sendRedirect("vista_error.jsp");
            }
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
