/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _model.Relief;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
public class reliefController extends HttpServlet {

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
        
        // Database prereqs
        String driver = "com.mysql.jdbc.Driver",
                        dbName = "ip",
                        url = "jdbc:mysql://localhost/" + dbName + "?",
                        username = "root",
                        password = "";

        // Page redirects
        String reqType = request.getParameter("request");
        switch (reqType) {
            case "index": 
                {
                    String
                            tablecol = "reliefs",
                            query = "SELECT * FROM " + tablecol;

                    ArrayList<Relief> reliefs = new ArrayList<>();
                    Relief _relief;

                    try {
                        Class.forName(driver);
                        try (Connection con = DriverManager.getConnection(url, username, password); Statement st = con.createStatement()) {
                            ResultSet rs = st.executeQuery(query);
                            
                            while (rs.next()) {
                                _relief = new Relief();
                                _relief.setId(rs.getInt("id"));
                                _relief.setTitle(rs.getString("name"));
                                _relief.setUser(rs.getString("userID"));
                                _relief.setDescription(rs.getString("description"));
                                _relief.setLocation(rs.getString("location"));
                                _relief.setStartDate(rs.getString("startDate"));
                                _relief.setEndDate(rs.getString("endDate"));
                                _relief.setState(rs.getString("state"));
                                reliefs.add(_relief);
                            }
                            
                        }
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("reliefs", reliefs);
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/admin/relief.jsp");
                    rd.forward(request, response);
                }
                break;
            case "newForm": 
                {
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/admin/create_relief.jsp");
                    rd.forward(request,response);
                }
                break;
            
            case "view": 
                {
                    String
                            id = (String) request.getParameter("id"),
                            table = "reliefs",
                            query = "SELECT * FROM " + table + " WHERE id = " + id +";";

                    Relief _relief = new Relief();

                    try {
                        Class.forName(driver);
                        try (Connection con = DriverManager.getConnection(url, username, password); Statement st = con.createStatement()) {
                            ResultSet rs = st.executeQuery(query);
                            
                            while (rs.next()) {
                                _relief = new Relief();
                                _relief.setId(rs.getInt("id"));
                                _relief.setTitle(rs.getString("name"));
                                _relief.setUser(rs.getString("userID"));
                                _relief.setDescription(rs.getString("description"));
                                _relief.setLocation(rs.getString("location"));
                                _relief.setStartDate(rs.getString("startDate"));
                                _relief.setEndDate(rs.getString("endDate"));
                                _relief.setState(rs.getString("state"));
                            }
                            con.close();
                        }
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("relief", _relief);
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/admin/view_relief.jsp");
                    rd.forward(request, response);
                }
                break;
            case "create":
                {
                    String
                        title = (String) request.getParameter("title"),
                        description = (String) request.getParameter("description"),
                        location = (String) request.getParameter("location"),
                        startDate = (String) request.getParameter("startDate"),
                        endDate = (String) request.getParameter("endDate"),
                        state = (String) request.getParameter("state"),
                        tablecol = "reliefs(name, userID, description, location, startDate, endDate, state)",
                        values = "'" + title + "', '1', '" + description + "','" + location + "','" + startDate + "','" + endDate + "','" + state + "'",
                        query = "INSERT INTO " + tablecol + " " + " VALUES(" + values + ")";


                    try {
                        Class.forName(driver);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    try {
                        try (Connection con = DriverManager.getConnection(url, username, password); Statement st = con.createStatement()) {
                            st.executeUpdate(query);
                            
                            int insertStatus = 0;
                            
                            System.out.println(insertStatus + " row affected");
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    response.sendRedirect("relief?request=index");
                }
                break;
            case "editForm": {
                RequestDispatcher rd = request.getRequestDispatcher("/views/relief/admin/edit_relief.jsp");
                rd.forward(request, response);
            }
            break;
            case "delete":
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
        
        // Database prereqs
        String driver = "com.mysql.jdbc.Driver",
                        dbName = "ipproject",
                        url = "jdbc:mysql://localhost/" + dbName + "?",
                        username = "root",
                        password = "";

        // Page redirects
//        String reqType = request.getParameter("request");
//        switch (reqType) {
//            case "create": 
//                {
//                    String
//                        title = (String) request.getParameter("title"),
//                        desc = (String) request.getParameter("desc"),
//                        location = (String) request.getParameter("location"),
//                        state = (String) request.getParameter("state"),
//                        query = "INSERT INTO reliefs(name) " + "VALUES('" + title + "')";
//
//                    RequestDispatcher rd = request.getRequestDispatcher("relief?request=index");
//                    rd.forward(request,response);
//                }
//                break;
//        }
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
