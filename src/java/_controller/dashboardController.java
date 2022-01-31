/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package _controller;

import _model.EvacCentre;
import _model.Relief;
import _model.report;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
public class dashboardController extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        String 
                driver = "com.mysql.jdbc.Driver", 
                dbName = "ip", 
                url = "jdbc:mysql://localhost/" + dbName + "?",
                username = "root", 
                password = "";
        
        String action = request.getParameter("request");
        if (action.equals("start")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                
                // selecting today's reports
                ArrayList<report> todayReports = new ArrayList<>();
                java.sql.Date currDate = new java.sql.Date(System.currentTimeMillis());
                String query = "SELECT * FROM report WHERE date = ?";
                
                ps = con.prepareStatement(query);
                ps.setDate(1, currDate);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("reportID");
                    java.sql.Date date = rs.getDate("date");
                    String location = rs.getString("location");
                    String disaster_type = rs.getString("disaster_type");
                    String asst_type = rs.getString("asst_type");
                    String asst_source = rs.getString("asst_source");
                    todayReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                session.setAttribute("duration", "today");
                session.setAttribute("reports", todayReports);
                
                // Selecting all active evac centres
                ArrayList<EvacCentre> ecs = new ArrayList<>();
                query = "SELECT * FROM ecentre WHERE activity = ?";
                
                ps = con.prepareStatement(query);
                ps.setString(1, "active");
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("id");
                    String centreName = rs.getString("centreName");
                    String centreLoc = rs.getString("centreLoc");
                    int capacity = rs.getInt("capacity");
                    int maxCapacity = rs.getInt("maxCapacity");
                    String activity = rs.getString("activity");
                    ecs.add(new EvacCentre(id, centreName, centreLoc, capacity, maxCapacity, activity));
                }
                
                session.setAttribute("ecs", ecs);
                
                ArrayList<Relief> reliefs = new ArrayList<>();
                query = "SELECT * FROM reliefs WHERE state = ?";
                
                ps = con.prepareStatement(query);
                ps.setString(1, "active");
                rs = ps.executeQuery();
                
                while (rs.next()){
                    Relief rel = new Relief();
                    rel.setId(rs.getInt("id"));
                    rel.setTitle(rs.getString("name"));
                    rel.setUser(rs.getString("userID"));
                    rel.setDescription(rs.getString("description"));
                    rel.setLocation(rs.getString("location"));
                    rel.setStartDate(rs.getString("startDate"));
                    rel.setEndDate(rs.getString("endDate"));
                    rel.setState(rs.getString("state"));
                    reliefs.add(rel);
                }
                
                session.setAttribute("reliefs", reliefs);
                
                ps.close();
                con.close();
                RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/dashboard.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("report_today")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                ArrayList<report> todayReports = new ArrayList<>();
                java.sql.Date currDate = new java.sql.Date(System.currentTimeMillis());
                String query = "SELECT * FROM report WHERE date = ?";
                
                ps = con.prepareStatement(query);
                ps.setDate(1, currDate);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("reportID");
                    java.sql.Date date = rs.getDate("date");
                    String location = rs.getString("location");
                    String disaster_type = rs.getString("disaster_type");
                    String asst_type = rs.getString("asst_type");
                    String asst_source = rs.getString("asst_source");
                    todayReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("duration", "today");
                session.setAttribute("reports", todayReports);
                RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/dashboard.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("report_month")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                ArrayList<report> monthReports = new ArrayList<>();
                java.sql.Date currDate = new java.sql.Date(System.currentTimeMillis());
                Calendar cal = Calendar.getInstance();
                cal.setTime(currDate);
                String query = "SELECT * FROM report WHERE year(date) = year(?) AND month(date) = month(?)";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, cal.get(Calendar.YEAR));
                ps.setInt(2, cal.get(Calendar.MONTH));
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("reportID");
                    java.sql.Date date = rs.getDate("date");
                    String location = rs.getString("location");
                    String disaster_type = rs.getString("disaster_type");
                    String asst_type = rs.getString("asst_type");
                    String asst_source = rs.getString("asst_source");
                    monthReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("duration", "month");
                session.setAttribute("reports", monthReports);
                RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/dashboard.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("report_year")) {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                ArrayList<report> yearReports = new ArrayList<>();
                java.sql.Date currDate = new java.sql.Date(System.currentTimeMillis());
                Calendar cal = Calendar.getInstance();
                cal.setTime(currDate);
                String query = "SELECT * FROM report WHERE year(date) = year(?)";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, cal.get(Calendar.YEAR));
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("reportID");
                    java.sql.Date date = rs.getDate("date");
                    String location = rs.getString("location");
                    String disaster_type = rs.getString("disaster_type");
                    String asst_type = rs.getString("asst_type");
                    String asst_source = rs.getString("asst_source");
                    yearReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("duration", "year");
                session.setAttribute("reports", yearReports);
                RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/dashboard.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(dashboardController.class.getName()).log(Level.SEVERE, null, ex);
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
