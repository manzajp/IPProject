/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _dao.evacCenterDAO;
import _model.EvacCentre;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */

@WebServlet(name = "evacCentre", urlPatterns = {"/new", "/insert", "/edit", "/delete", "/update" })

public class EvacCentreServlet extends HttpServlet {
    
    private evacCenterDAO ecDAO;
    
    public EvacCentreServlet(){
        this.ecDAO = new evacCenterDAO();
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
        
        String action = request.getServletPath();
        
        switch(action){
            case "/new":
                showNewForm(request, response);
                break;
            case "/insert":
            {
                try {
                    insertEC(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            case "/delete":
            {
                try {
                    deleteEC(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            case "/edit":
            {
                try {
                    showEditForm(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            case "/update":
            {
                try {
                    updateEC(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            default:
            {
                try {
                    //handle list
                    listEC(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

        }
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
       this.doGet(request, response);
    }

    private void listEC(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<EvacCentre> listEC = ecDAO.selectAllEC();
        request.setAttribute("listEC", listEC);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ec-list.jsp");
        dispatcher.forward(request, response);
    }
    
    private void deleteEC(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ecDAO.deleteEC(id);
        response.sendRedirect("list");
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        EvacCentre existingEC = ecDAO.selectEC(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ec-form.jsp");
        request.setAttribute("ec", existingEC);
        dispatcher.forward(request, response);
       
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ec-form.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateEC(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String centreName = request.getParameter("centreName");
        String centreLoc = request.getParameter("centreLoc");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        
        EvacCentre newEC = new EvacCentre(centreName, centreLoc, capacity);
        ecDAO.updateEC(newEC);
        response.sendRedirect("ec-list");
    }
    
    private void insertEC(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String centreName = request.getParameter("centreName");
        String centreLoc = request.getParameter("centreLoc");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        EvacCentre newEC = new EvacCentre(centreName, centreLoc, capacity);
        ecDAO.insertEC(newEC);
        response.sendRedirect("ec-list");
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
