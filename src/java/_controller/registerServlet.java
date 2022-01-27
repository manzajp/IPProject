/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package _controller;

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
public class registerServlet extends HttpServlet {

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
        
        String uname = request.getParameter("uname");
        String pwd1 = request.getParameter("password1");
        String pwd2 = request.getParameter("password2");
        
        String 
                driver = "com.mysql.jdbc.Driver", 
                dbName = "ip", 
                url = "jdbc:mysql://localhost/" + dbName + "?",
                username = "root", 
                password = "";
        
        PreparedStatement ps;
        ResultSet rs;
        
        if (!pwd1.equals(pwd2)){
            session.setAttribute("errorRegister", "pwdDiff");
            RequestDispatcher rd = request.getRequestDispatcher("views/login/signup.jsp");
            rd.forward(request, response);
        } else {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            String query = "SELECT * FROM users";
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()){
                    String currUsername = rs.getString("username");
                    if (uname.equals(currUsername)){
                        session.setAttribute("errorRegister", "unameUnique");
                        RequestDispatcher rd = request.getRequestDispatcher("views/login/signup.jsp");
                        rd.forward(request, response);
                        break;
                    }
                }

                query = "INSERT INTO users (username, password, userType) VALUES (?,?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1, uname);
                ps.setString(2, pwd1);
                ps.setString(3, "user");
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                session.setAttribute("errorRegister", "success");
                RequestDispatcher rd = request.getRequestDispatcher("views/login/signup.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
