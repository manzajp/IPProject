/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package _dao;

import _model.EvacCentre;
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
public class evacCenterDAO {
    private String driver = "com.mysql.jdbc.Driver";
    private String dbName = "ip";
    private String url = "jdbc:mysql://localhost/" + dbName + "?";
    private String userName = "root";
    private String password = "";
    
    private static final String INSERT_EC_SQL = "INSERT INTO ecentre" 
            + "(centreName, centreLoc, capacity) VALUES " + " (?, ?, ?);";
    
    private static final String SELECT_EC_BY_ID = "select id, centreName, centreLoc, capacity from ecentre where id =?;";
    private static final String SELECT_ALL_ECS = "select * from ecentre";
    private static final String DELETE_EC_SQL = "delete from ecentre where id = ?;";
    private static final String UPDATE_EC_SQL = "update ecentre set centreName = ?. centreLoc = ?, capacity = ? where id = ?;";
    
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
    public void insertEC(EvacCentre ec) throws SQLException{
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EC_SQL)){
            preparedStatement.setString(1, ec.getCentreName());
            preparedStatement.setString(2, ec.getCentreLoc());
            preparedStatement.setInt(3, ec.getCapacity());
            preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //Update EC
    public boolean updateEC(EvacCentre ec) throws SQLException{
        boolean rowUpdated;
        try(Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_EC_SQL)){
            statement.setString(1, ec.getCentreName());
            statement.setString(2, ec.getCentreLoc());
            statement.setInt(3, ec.getCapacity());
            statement.setInt(4,ec.getId());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    //Select EC by id
    public EvacCentre selectEC(int id){
        EvacCentre ec = null;
        
        //1.Establish connection
        try(Connection connection = getConnection();
                //2. Create statement using connection obj
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EC_BY_ID);){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            
            //3. Execute query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //4. Process the ResultSet object
            while(rs.next()){
                String centreName = rs.getString("centreName");
                String centreLoc = rs.getString("centreLoc");
                int capacity = rs.getInt("capacity");
                ec = new EvacCentre(id, centreName, centreLoc, capacity);
            }     
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ec;
    }
    
    //Select ECs
    public List<EvacCentre> selectAllEC(){
        
        List<EvacCentre> ecs = new ArrayList<>();
        
        //1.Establish connection
        try(Connection connection = getConnection();
                //2. Create statement using connection obj
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EC_BY_ID);){
            System.out.println(preparedStatement);
            
            //3. Execute query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //4. Process the ResultSet object
            while(rs.next()){
                int id = rs.getInt("id");
                String centreName = rs.getString("centreName");
                String centreLoc = rs.getString("centreLoc");
                int capacity = rs.getInt("capacity");
                ecs.add(new EvacCentre(id, centreName, centreLoc, capacity));
            }     
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ecs;
    }
    
    //Delete EC
    public boolean deleteEC(int id) throws SQLException {
        boolean rowDeleted;
        
        try(Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_EC_SQL);){
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }    
        return rowDeleted;   
            
    }
}
    

