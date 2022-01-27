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
public class editProfileServlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        
        PrintWriter out = response.getWriter();
        
        user currUser = (user) session.getAttribute("currUser");
        String newUname = request.getParameter("username");
        String newPwd = request.getParameter("password");
        
        boolean changeUname = false;
        boolean changePwd = false;
        
        if (!newUname.equals("")){
            changeUname = true;
        }
        if (!newPwd.equals("")){
            changePwd = true;
        }
        
        String 
            driver = "com.mysql.jdbc.Driver", 
            dbName = "ip", 
            url = "jdbc:mysql://localhost/" + dbName + "?",
            username = "root", 
            password = "";

        PreparedStatement ps;
        ResultSet rs;
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Connection con = DriverManager.getConnection(url, username, password);
            
            if (changeUname){
                String query = "UPDATE users SET username = ? where id = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, newUname);
                ps.setInt(2, currUser.getId());
                ps.executeUpdate();
                ps.close();
                
                currUser.setUsername(newUname);
                session.setAttribute("currUser", currUser);
            }
            
            if (changePwd){
                String query = "UPDATE users SET password = ? where id = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, newPwd);
                ps.setInt(2, currUser.getId());
                ps.executeUpdate();
                ps.close();
                
                currUser.setPassword(newPwd);
                session.setAttribute("currUser", currUser);
            }
            
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(editProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        if (!changeUname && !changePwd){
            session.setAttribute("change","none");
        } else if (changeUname && !changePwd){
            session.setAttribute("change","uname");
        } else if (!changeUname && changePwd){
            session.setAttribute("change","pwd");
        } else {
            session.setAttribute("change","both");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("views/profile/editProfile.jsp");
        rd.forward(request, response);
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
