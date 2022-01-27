/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package _controller;

import _model.user;
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
 * @author Admin
 */
public class usersController extends HttpServlet {

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
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                user userToView = new user("", "", "", id);
                String query = "SELECT * FROM users WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    userToView.setUsername(rs.getString("username"));
                    userToView.setPassword(rs.getString("password"));
                    userToView.setUserType(rs.getString("userType"));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("userToView", userToView);
                RequestDispatcher rd = request.getRequestDispatcher("/views/users/view_user.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("index")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                ArrayList<user> users = new ArrayList<user>();
                String query = "SELECT * FROM users";
                
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("id");
                    String uname = rs.getString("username");
                    String pwd = rs.getString("password");
                    String type = rs.getString("userType");
                    users.add(new user(uname, pwd, type, id));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/views/users/users.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("addForm")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/users/admin/create_user.jsp");
            rd.forward(request, response);
        } else if (action.equals("add")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                String uname = request.getParameter("uname");
                String pword = request.getParameter("pword");
                String utype = request.getParameter("userType");
                String query = "INSERT INTO users (username, password, userType) VALUES (?,?,?)";
                
                ps = con.prepareStatement(query);
                ps.setString(1, uname);
                ps.setString(2, pword);
                ps.setString(3, utype);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("usersController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("editForm")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/users/admin/edit_user.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                String uname = request.getParameter("uname");
                String utype = request.getParameter("userType");
                String query = "UPDATE users SET username = ?, userType = ? WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setString(1,uname);
                ps.setString(2, utype);
                ps.setInt(3,id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("usersController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("delete")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                String query = "DELETE FROM users WHERE id = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1,id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("usersController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(usersController.class.getName()).log(Level.SEVERE, null, ex);
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
