/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _model.EvacCentre;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class evacController extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        
        String 
                driver = "com.mysql.jdbc.Driver", 
                dbName = "ip", 
                url = "jdbc:mysql://localhost/" + dbName + "?",
                username = "root", 
                password = "";
        
        String action = request.getParameter("request");
        if (action.equals("view")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                int capacity = 0;
                int maxCapacity = 0;
                EvacCentre ecentreToView = new EvacCentre(id, "", "", capacity, maxCapacity, "");
                String query = "SELECT * FROM ecentre WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    ecentreToView.setCentreName(rs.getString("centreName"));
                    ecentreToView.setCentreLoc(rs.getString("centreLoc"));
                    ecentreToView.setCapacity(rs.getInt("capacity"));
                    ecentreToView.setMaxCapacity(rs.getInt("maxCapacity"));
                    ecentreToView.setActivity(rs.getString("activity"));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("ecentreToView", ecentreToView);
                RequestDispatcher rd = request.getRequestDispatcher("/views/ec/view_ec.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("index")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                ArrayList<EvacCentre> ecentres = new ArrayList<EvacCentre>();
                String query = "SELECT * FROM ecentre";
                
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("id");
                    String centreName = rs.getString("centreName");
                    String centreLoc = rs.getString("centreLoc");
                    int capacity = rs.getInt("capacity");
                    int maxCapacity = rs.getInt("maxCapacity");
                    String activity = rs.getString("activity");
                    ecentres.add(new EvacCentre(id, centreName, centreLoc, capacity, maxCapacity, activity));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("ecentres", ecentres);
                RequestDispatcher rd = request.getRequestDispatcher("/views/ec/ec.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("addForm")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/ec/admin/create_ec.jsp");
            rd.forward(request, response);
        } else if (action.equals("add")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                String centreName = request.getParameter("centreName");
                String centreLoc = request.getParameter("centreLoc");
                int maxCapacity =  Integer.parseInt(request.getParameter("maxCapacity"));
                String activity = request.getParameter("activity");
                String query = "INSERT INTO ecentre (centreName, centreLoc, capacity, maxCapacity, activity) VALUES (?,?,?,?,?)";
                
                ps = con.prepareStatement(query);
                ps.setString(1, centreName);
                ps.setString(2, centreLoc);
                ps.setInt(3, 0);
                ps.setInt(4, maxCapacity);
                ps.setString(5, activity);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("evacController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("editForm_admin")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/ec/admin/edit_ec_admin.jsp");
            rd.forward(request, response);
        } else if (action.equals("editForm_agency")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/ec/agency/edit_ec_agency.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit_admin")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                String centreName = request.getParameter("centreName");
                String centreLoc = request.getParameter("centreLoc");
                int maxCapacity =  Integer.parseInt(request.getParameter("maxCapacity"));
                String activity = request.getParameter("activity");
                String query = "UPDATE ecentre SET centreName = ?, centreLoc = ?, maxCapacity = ?, activity = ? WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setString(1, centreName);
                ps.setString(2, centreLoc);
                ps.setInt(3, maxCapacity);
                ps.setString(4, activity);
                ps.setInt(5, id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("evacController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("edit_agency")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                int capacity =  Integer.parseInt(request.getParameter("capacity"));
                String activity = request.getParameter("activity");
                String query = "UPDATE ecentre SET capacity = ?, activity = ? WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, capacity);
                ps.setString(2, activity);
                ps.setInt(3, id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("evacController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("delete")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                String query = "DELETE FROM ecentre WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1,id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("evacController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(evacController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
