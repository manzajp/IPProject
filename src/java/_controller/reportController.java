/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _model.report;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
public class reportController extends HttpServlet {

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
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                report reportToView = new report(id, "", "", "", "", "");
                String query = "SELECT * FROM report WHERE reportID = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    reportToView.setDate(rs.getString("date"));
                    reportToView.setLocation(rs.getString("location"));
                    reportToView.setDisaster_type(rs.getString("disaster_type"));
                    reportToView.setAsst_type(rs.getString("asst_type"));
                    reportToView.setAsst_source(rs.getString("asst_source"));
                }
                
                ps.close();
                con.close();
                
                session.setAttribute("reportToView", reportToView);
                RequestDispatcher rd = request.getRequestDispatcher("/views/report/view_report.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("index")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps, ps2;
                ResultSet rs, rs2;
                ArrayList<report> todayReports = new ArrayList<report>();
                ArrayList<report> pastReports = new ArrayList<report>();
                String currDate = java.time.LocalDate.now().toString();
                String query = "SELECT * FROM report WHERE date = ?";
                String query2 = "SELECT * FROM report WHERE date < ?";

                ps = con.prepareStatement(query);
                ps.setString(1, currDate);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    int id = rs.getInt("reportID");
                    String date = rs.getString("date");
                    String location = rs.getString("location");
                    String disaster_type = rs.getString("disaster_type");
                    String asst_type = rs.getString("asst_type");
                    String asst_source = rs.getString("asst_source");
                    todayReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                ps.close();
                
                ps2 = con.prepareStatement(query2);
                ps2.setString(1, currDate);
                rs2 = ps.executeQuery();
                
                while (rs2.next()){
                    int id = rs2.getInt("reportID");
                    String date = rs2.getString("date");
                    String location = rs2.getString("location");
                    String disaster_type = rs2.getString("disaster_type");
                    String asst_type = rs2.getString("asst_type");
                    String asst_source = rs2.getString("asst_source");
                    pastReports.add(new report(id, date, location, disaster_type, asst_type, asst_source));
                }
                
                ps2.close();
                con.close();
                
                session.setAttribute("todayReports", todayReports);
                session.setAttribute("pastReports", pastReports);
                RequestDispatcher rd = request.getRequestDispatcher("/views/report/report.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("addForm")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/report/create_report.jsp");
            rd.forward(request, response);
        } else if (action.equals("add")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                String date = request.getParameter("date");
                String location = request.getParameter("location");
                String disaster_type = request.getParameter("disaster_type");
                String asst_type = request.getParameter("asst_type");
                String asst_source = request.getParameter("asst_source");
                String query = "INSERT INTO report (date, location, disaster_type, asst_type, asst_source) VALUES (?,?,?,?,?)";
                
                ps = con.prepareStatement(query);
                ps.setString(1, date);
                ps.setString(2, location);
                ps.setString(3, disaster_type);
                ps.setString(4, asst_type);
                ps.setString(5, asst_source);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("reportController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("editForm")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/report/edit_report.jsp");
            rd.forward(request, response);
        } else if (action.equals("editForm_agency")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/report/agency/edit_report_agency.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit_user")){    
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                String asst_type = request.getParameter("asst_type");
                String asst_source = request.getParameter("asst_source");
                String query = "UPDATE report SET  asst_type = ?, asst_source = ? WHERE reportID = ?";
                
                ps = con.prepareStatement(query);
                ps.setString(1, asst_type);
                ps.setString(2, asst_source);
                ps.setInt(3, id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("reportController?request=index");
            } catch (SQLException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }  else if (action.equals("delete")){
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(reportController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                Connection con = DriverManager.getConnection(url, username, password);
                
                PreparedStatement ps;
                ResultSet rs;
                int id = Integer.parseInt(request.getParameter("id"));
                String query = "DELETE FROM report WHERE reportID = ?";
                
                ps = con.prepareStatement(query);
                ps.setInt(1,id);
                ps.executeUpdate();
                
                ps.close();
                con.close();
                
                response.sendRedirect("reportController?request=index");
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
