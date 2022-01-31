/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _controller;

import _model.Relief;
import _model.user;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
import javax.servlet.http.HttpSession;

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
            throws ServletException, IOException, ClassNotFoundException {
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
                    HttpSession session = request.getSession();
                    user thisUser = (user) session.getAttribute("currUser");
                    String query = "SELECT * FROM reliefs";
                    ArrayList<Integer> userReliefs = new ArrayList<>();
                    ArrayList<Relief> reliefs = new ArrayList<>();

                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password); 
                        Statement st = con.createStatement() ;
                        ResultSet rs = st.executeQuery(query);
                            
                        Relief _relief;
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
                        request.setAttribute("reliefs", reliefs);

                        query = "select * from user_reliefs where userid = " + thisUser.getId();
                        rs = st.executeQuery(query);
                        while (rs.next()) {
                            userReliefs.add(rs.getInt("reliefId"));
                        }
                        request.setAttribute("userReliefs", userReliefs);

                        query = "select * from reliefs";
                        rs = st.executeQuery(query);
                        ArrayList<Integer> reliefType = new ArrayList<>();
                        while(rs.next()){
                            reliefType.add(rs.getInt("id"));
                        }
                        request.setAttribute("reliefType", reliefType);

                        ArrayList<Integer> noUserReliefs = new ArrayList<>();
                        for(int i = 0; i < reliefType.size(); i++){
                            query = "select count(*) from user_reliefs where reliefId = " + reliefType.get(i);
                            System.out.println(query);
                            rs = st.executeQuery(query);
                            while (rs.next()) {
                                System.out.println(rs.getInt(1));
                                noUserReliefs.add(rs.getInt(1));
                            }
                        }
                        request.setAttribute("noUserReliefs", noUserReliefs);
                    } 
                    catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/relief.jsp");
                    rd.forward(request, response);
                }
                break;
            case "newForm": 
                {
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/create_relief.jsp");
                    rd.forward(request,response);
                }
                break;
            
            case "view": 
                {
                    String
                            id = (String) request.getParameter("id"),
                            query = "SELECT * FROM reliefs WHERE id = " + id;

                    Relief _relief = new Relief();
                    

                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password); 
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);
                            
                        while (rs.next()) {
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
                        st.close();
                        
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("relief", _relief);
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/view_relief.jsp");
                    rd.forward(request, response);
                }
                break;
            case "join": 
                {
                    HttpSession session = request.getSession();
                    user thisUser = (user) session.getAttribute("currUser");
                    
                    String
                            id = (String) request.getParameter("id"),
                            query = "insert into user_reliefs(userId, reliefId) values ('" + thisUser.getId() + "','" + id +  "')";

                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password); 
                        Statement st = con.createStatement();
                        st.executeUpdate(query);
                            
                        con.close();
                        st.close();
                        
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    response.sendRedirect("relief?request=index");
                }
                break;
            case "create":
                {
                    HttpSession session = request.getSession();
                    user thisUser = (user) session.getAttribute("currUser");
                    
                    String
                        title = (String) request.getParameter("title"),
                        userID = Integer.toString(thisUser.getId()),
                        description = (String) request.getParameter("description"),
                        location = (String) request.getParameter("location"),
                        startDate = (String) request.getParameter("startDate"),
                        endDate = (String) request.getParameter("endDate"),
                        state = (String) request.getParameter("state"),
                        values = "'" + title + "', '" + userID + "', '" + description + "','" + location + "','" + startDate + "','" + endDate + "','" + state + "'",
                        query = "INSERT INTO reliefs(name, userID, description, location, startDate, endDate, state) VALUES(" + values + ")";


                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password); 
                        Statement st = con.createStatement();
                        st.executeUpdate(query);
                        st.close();
                        con.close();
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    response.sendRedirect("relief?request=index");
                }
                break;
            case "editForm": 
                {
                    String
                            id = (String) request.getParameter("id"),
                            table = "reliefs",
                            query = "SELECT * FROM " + table + " WHERE id = " + id +";";

                    Relief _relief = new Relief();

                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password); 
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);

                        while (rs.next()) {
                            _relief.setId(rs.getInt("id"));
                            _relief.setTitle(rs.getString("name"));
                            _relief.setUser(rs.getString("userID"));
                            _relief.setDescription(rs.getString("description"));
                            _relief.setLocation(rs.getString("location"));
                            _relief.setStartDate(rs.getString("startDate"));
                            _relief.setEndDate(rs.getString("endDate"));
                            _relief.setState(rs.getString("state"));
                        }
                        st.close();
                        con.close();
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("relief", _relief);
                    RequestDispatcher rd = request.getRequestDispatcher("/views/relief/edit_relief.jsp");
                    rd.forward(request, response);
                }
                break;
            case "edit": 
                {
                    HttpSession session = request.getSession();
                    user thisUser = (user) session.getAttribute("currUser");
                    
                    String
                        query = "update reliefs set name = ?, userID = ?, description = ?, location = ?, startDate = ?, endDate = ?, state = ? where id = ?",
                        title = (String) request.getParameter("title"),
                        description = (String) request.getParameter("description"),
                        location = (String) request.getParameter("location"),
                        startDate = (String) request.getParameter("startDate"),
                        endDate = (String) request.getParameter("endDate"),
                        state = (String) request.getParameter("state"),
                        id = (String) request.getParameter("id"),
                        userId = Integer.toString(thisUser.getId());;
                                                
                    try {
                        Class.forName(driver);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    try {
                        Connection con = DriverManager.getConnection(url, username, password);
                        PreparedStatement  st = con.prepareStatement(query);
                        
                        st.setString(1,title);
                        st.setString(2,userId);
                        st.setString(3,description);
                        st.setString(4,location);
                        st.setString(5,startDate);
                        st.setString(6,endDate);
                        st.setString(7,state);
                        st.setString(8,id);
                        
                        int insertStatus = st.executeUpdate();

                        System.out.println(insertStatus + " row affected");
                        
                    } catch (SQLException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    response.sendRedirect("relief?request=index");
                }
                break;
            case "delete": 
                {
                    String
                        query = "delete from reliefs where id = ?",
                        id = (String) request.getParameter("id");
                        
                            
                    try {
                        Class.forName(driver);
                        Connection con = DriverManager.getConnection(url, username, password);
                        PreparedStatement  st = con.prepareStatement(query);
                        st.setString(1,id);
                        
                        int insertStatus = st.executeUpdate();

                        System.out.println(insertStatus + " row affected");
                        con.close();
                        st.close();
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    response.sendRedirect("relief?request=index");
                }
                break;
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(reliefController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
