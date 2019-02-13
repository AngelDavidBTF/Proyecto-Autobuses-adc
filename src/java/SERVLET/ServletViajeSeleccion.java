package SERVLET;

import DAO.ConexionBBDD;
import DAO.Operaciones;
import MODELO.Estacion;
import MODELO.GlobalException;
import MODELO.Horario;
import MODELO.Viaje;
import MODELO.ViajeSeleccionado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
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
public class ServletViajeSeleccion extends HttpServlet {

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
            /**
             * En la vista JSP, rellenamos la card de resumen y a su vez un
             * formulario que se encuentra oculto al usuario para poder rescatar
             * los datos aqui y montar el obj correspondiente
             */

            // Recuperamos de session el obj Seleccionado y terminamos de completarlo con los datos que ha elegido el usuario
            HttpSession session = request.getSession(true);
            ViajeSeleccionado S_session = (ViajeSeleccionado) session.getAttribute("Seleccionado");

            String origen = request.getParameter("origen");
            String destino = request.getParameter("destino");
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
            float precio = Float.parseFloat(request.getParameter("precio"));
            int distancia = Integer.parseInt(request.getParameter("distancia"));
            int nBilletes = Integer.parseInt(request.getParameter("nBilletes"));

            LocalTime hSalida = LocalTime.parse(request.getParameter("hSalida"));
            LocalTime hLlegada = LocalTime.parse(request.getParameter("hLlegada"));
            int idHorario = Integer.parseInt(request.getParameter("idHorario"));
            int plazasOcupadas = Integer.parseInt(request.getParameter("plazasOcupadas"));

            // Construimos los objcorrespondientes 
            try {
                Estacion E1 = new Operaciones(Conexion).getEstacion(origen);
                Estacion E2 = new Operaciones(Conexion).getEstacion(destino);

                Horario objHorario = new Operaciones(Conexion).getHorario(idHorario);

                Viaje objViaje = new Operaciones(Conexion).getViaje(objHorario.getId(), fecha);

                ArrayList<Viaje> array_Viajes = new ArrayList();
                array_Viajes.add(objViaje);

                ViajeSeleccionado S_competo = new ViajeSeleccionado(E1, E2, fecha, precio, distancia, nBilletes, array_Viajes);
                // Subimos a session el obj selecionado

                session.setAttribute("S", S_competo);
                response.sendRedirect("DatosViajeros.jsp");
                
            } catch (GlobalException gx) {
                
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
