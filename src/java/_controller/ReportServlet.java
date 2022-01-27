/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _dao.reportDAO;
import _model.report;
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

@WebServlet(name = "reportServlet", urlPatterns = {"/new", "/insert", "/edit", "/delete", "/update" })

public class reportServlet extends HttpServlet {
    
    private reportDAO repDAO;
    
    public report(){
        this.repDAO = new reportDAO();
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
                    insertRep(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            case "/delete":
            {
                try {
                    deleteReport(request, response);
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
                    updateRep(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(EvacCentreServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            default:
            {
                try {
                    //handle list
                    listReport(request, response);
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

    private void listReport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<report> listReport = repDAO.selectAllReport();
        request.setAttribute("listReport", listReport);
        RequestDispatcher dispatcher = request.getRequestDispatcher("rep-list.jsp");
        dispatcher.forward(request, response);
    }
    
    private void deleteReport(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        repDAO.deleteReport(id);
        response.sendRedirect("list");
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        report existingRep = repDAO.selectReport(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("rep-form.jsp");
        request.setAttribute("rep", existingRep);
        dispatcher.forward(request, response);
       
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("rep-form.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateRep(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String location = request.getParameter("location");
        String disaster_type = request.getParameter("disaster_type");
        String asst_type = request.getParameter("asst_type");
        String asst_source = request.getParameter("asst_source");
        
        report newRep = new report(location, disaster_type, asst_type, asst_source);
        repDAO.updateReport(newRep);
        response.sendRedirect("rep-list");
    }
    
    private void insertRep(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String location = request.getParameter("location");
        String disaster_type = request.getParameter("disaster_type");
        String asst_type = request.getParameter("asst_type");
        String asst_source = request.getParameter("asst_source");
        report newReport = new report(location, disaster_type, asst_type, asst_source);
        repDAO.insertReport(newReport);
        response.sendRedirect("rep-list");
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