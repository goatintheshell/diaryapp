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
import java.util.ArrayList;

/**
 *
 * @author Hilary
 */
public class User {
    private int _id;
    private String userName;
    private String _password;
    private ArrayList<Entry> entries;
    private boolean loggedIn = false;

    public User() {
    }

    public User(int _id, String userName, String _password) {
        this._id = _id;
        this.userName = userName;
        this._password = _password;
    }
    
    public void removeEntry(int index) {
        entries.remove(index);
    }
    
    public void setEntry(Entry entry) {
        entries.add(entry);
    }
    
    public Entry getEntry(int index) {
        return entries.get(index);
    } 

    public ArrayList<Entry> getEntries() {
        return entries;
    }

    public void setEntries(ArrayList<Entry> entries) {
        this.entries = entries;
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
         
          PreparedStatement prep = conn.prepareStatement("SELECT u.userNAME, u._id, p.password FROM User u JOIN Password p ON u._id = p.name_id WHERE u.userNAME=? AND p.password=?");  
          prep.setString(1,name);
          prep.setString(2,password);
          
          ResultSet rs  = prep.executeQuery();
          if(rs.next())
          {
           userName = rs.getString(1);
           _password = rs.getString(3);
           _id = rs.getInt(2);
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
              _id = rs.getInt(1);
          } rs.close();
          
          PreparedStatement passwordPrep = conn.prepareStatement("INSERT INTO Password (password, name_id) VALUES (?,?)");  
          passwordPrep.setString(1,password);
          passwordPrep.setInt(2,name_id);
          passwordPrep.execute();
          
          userName = name;
          _password = password;
          
          userPrep.close();
          passwordPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }       
    }
    
    public void changeUsername(String name) {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement userPrep = conn.prepareStatement("UPDATE User SET userNAME = ? WHERE _id = ?");  
          userPrep.setString(1,name);
          userPrep.setInt(2,_id);
          userPrep.execute();
          
          userPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }       
    }
    
    public void changePassword(String password) {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement userPrep = conn.prepareStatement("UPDATE Password SET password = ? WHERE name_id = ?");  
          userPrep.setString(1, password);
          userPrep.setInt(2,_id);
          userPrep.execute();
          
          userPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
    
    public void deleteUser() {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement passwordPrep = conn.prepareStatement("DELETE FROM Password WHERE name_id = ?");  
          passwordPrep.setInt(1,_id);
          passwordPrep.execute();
          
          PreparedStatement userPrep = conn.prepareStatement("DELETE FROM User WHERE _id = ?");  
          userPrep.setInt(1,_id);
          userPrep.execute();
          
          passwordPrep.close();
          userPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
   
    public void setEntriesFromDB() {
        entries = new ArrayList<Entry>();
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement getEntry = conn.prepareStatement("SELECT * FROM Entry WHERE user_id = ?");  
          getEntry.setInt(1,_id);
          
          ResultSet rs = getEntry.executeQuery();
          while (rs.next()) {
              Entry entry = new Entry(rs.getInt(1), rs.getInt(4), rs.getTimestamp(2), rs.getString(3), rs.getString(5));
              entries.add(entry);
          } rs.close();
          
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
