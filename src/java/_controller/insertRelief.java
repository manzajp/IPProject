/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class insertRelief extends HttpServlet {

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
        
        
        
        String 
                driver = "com.mysql.jdbc.Driver", 
                dbName = "ip", 
                url = "jdbc:mysql://localhost/" + dbName + "?",
                username = "root", 
                password = "";
        
        String
                reliefTitle = (String) request.getParameter("reliefTitle"),
                tablecol = "reliefs(name)",
                values = "'" + reliefTitle + "'",
                query = "INSERT INTO " + tablecol + " " + " VALUES(" + values + ")";
        
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertRelief.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Connection con = DriverManager.getConnection(url, username, password);
            Statement st = con.createStatement();
            st.executeUpdate(query);
            
            int insertStatus = 0;
        
            System.out.println(insertStatus + " row affected");
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(insertRelief.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("reliefTitle", reliefTitle);
        RequestDispatcher rd = request.getRequestDispatcher("/views/relief/view_relief.jsp");
        rd.forward(request,response);
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
