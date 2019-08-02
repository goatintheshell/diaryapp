/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hilarysturges;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Hilary
 */
public class User {
    private int _id;
    private String userName;
    private String _password;
    private boolean loggedIn = false;

    public User() {
    }

    public User(int _id, String userName, String _password) {
        this._id = _id;
        this.userName = userName;
        this._password = _password;
    }
    
    
        
    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getName() {
        return userName;
    }

    public void setName(String name) {
        this.userName = name;
    }

    public String getPassword() {
        return _password;
    }

    public void setPassword(String password) {
        this._password = password;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(boolean login) {
        this.loggedIn = login;
    }
    
    public boolean login(String name, String password)
   {             
        try{
            
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement prep = conn.prepareStatement("SELECT u.userNAME FROM User u JOIN Password p ON u._id = p.name_id WHERE u.userNAME=? AND p.password=?");  
          prep.setString(1,name);
          prep.setString(2,password);
          
          ResultSet rs  = prep.executeQuery();
          if(rs.next())
          {
           //userName = rs.getString(1);
           loggedIn = true;
          }
          else
            loggedIn = false;
          prep.close();
          conn.close();
          
         }
        catch(Exception e)
        {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
          loggedIn = false;  
        }  
        
        return loggedIn;
   }
    
    public boolean checkForUser(String name) {
        boolean ifExists = false;
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement userCheck = conn.prepareStatement("SELECT * FROM User where userNAME = ?");  
          userCheck.setString(1,name);
          
          ResultSet rs = userCheck.executeQuery();
          while (rs.next()) {
              ifExists = true;
          } rs.close();
          
        } catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }
        return ifExists;
    }
    
    public void createUser(String name, String password) {
        int name_id = 0;
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement userPrep = conn.prepareStatement("INSERT INTO User (userNAME) VALUES (?)");  
          userPrep.setString(1,name);
          userPrep.execute();
          
          PreparedStatement getNameId = conn.prepareStatement("SELECT * FROM User ORDER BY _id DESC LIMIT 1");
          
          ResultSet rs = getNameId.executeQuery();
          while (rs.next()) {
              name_id = rs.getInt(1);
          } rs.close();
          
          PreparedStatement passwordPrep = conn.prepareStatement("INSERT INTO Password (password, name_id) VALUES (?,?)");  
          passwordPrep.setString(1,password);
          passwordPrep.setInt(2,name_id);
          passwordPrep.execute();
          
          userPrep.close();
          passwordPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }       
    }
   
   public void logOut()
   {
     loggedIn = false;
   }
}
