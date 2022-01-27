/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _dao;

import _model.report;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class reportDAO {
    private String driver = "com.mysql.jdbc.Driver";
    private String dbName = "ip";
    private String url = "jdbc:mysql://localhost/" + dbName + "?";
    private String userName = "root";
    private String password = "";
    
    private static final String INSERT_REPORT_SQL = "INSERT INTO report" 
            + "(location, disaster_type, asst_type, asst_source) VALUES " + " (?, ?, ?, ?);";
    
    private static final String SELECT_REPORT_BY_ID = "select location, disaster_type, asst_type, asst_source from report where id =?;";
    private static final String SELECT_ALL_REPORTS = "select * from report";
    private static final String DELETE_REPORT_SQL = "delete from report where id = ?;";
    private static final String UPDATE_REPORT_SQL = "update report set location = ?. disaster_type = ?, asst_type = ?, asst_source = ? where id = ?;";
    
    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName(driver);
            connection = DriverManager.getConnection(url, userName, password);
        }
        catch (SQLException e){
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (ClassNotFoundException e){
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }   
    
    //Create or insert EC
    public void insertReport(report rep) throws SQLException{
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REPORT_SQL)){
            preparedStatement.setString(1, rep.getLocation());
            preparedStatement.setString(2, rep.getDisaster_type());
            preparedStatement.setString(3, rep.getAsst_type());
            preparedStatement.setString(4, rep.getAsst_source());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //Update EC
    public boolean updateReport(report rep) throws SQLException{
        boolean rowUpdated;
        try(Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_REPORT_SQL)){
            statement.setString(1, rep.getLocation());
            statement.setString(2, rep.getDisaster_type());
            statement.setString(3, rep.getAsst_type());
            statement.setString(4, rep.getAsst_source());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    //Select EC by id
    public report selectReport(int id){
        report rep = null;
        
        //1.Establish connection
        try(Connection connection = getConnection();
                //2. Create statement using connection obj
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORT_BY_ID);){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            
            //3. Execute query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //4. Process the ResultSet object
            while(rs.next()){
                String location = rs.getString("location");
                String disaster_type = rs.getString("disaster_type");
                String asst_type = rs.getString("asst_type");
                String asst_source = rs.getString("asst_source");
                rep = new report(id, location, disaster_type, asst_type, asst_source);
            }     
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rep;
    }
    
    //Select ECs
    public List<report> selectAllReport(){
        
        List<report> reps = new ArrayList<>();
        
        //1.Establish connection
        try(Connection connection = getConnection();
                //2. Create statement using connection obj
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORT_BY_ID);){
            System.out.println(preparedStatement);
            
            //3. Execute query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //4. Process the ResultSet object
            while(rs.next()){
                int id = rs.getInt("id");
                String location = rs.getString("location");
                String disaster_type = rs.getString("disaster_type");
                String asst_type = rs.getString("asst_type");
                String asst_source = rs.getString("asst_source");
                reps.add(new report(id, location, disaster_type, asst_type, asst_source));
            }     
        }catch (SQLException e){
            e.printStackTrace();
        }
        return reps;
    }
    
    //Delete EC
    public boolean deleteReport(int id) throws SQLException {
        boolean rowDeleted;
        
        try(Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_REPORT_SQL);){
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }    
        return rowDeleted;   
            
    }
}
