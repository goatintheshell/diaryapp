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
import java.sql.Timestamp;

/**
 *
 * @author Hilary
 */
public class Entry {
    private int _id;
    private int user_id;
    private String name;
    private Timestamp dateAdded;
    private String words;

    public Entry() {
    }

    public Entry(int _id, int user_id, Timestamp dateAdded, String words, String name) {
        this._id = _id;
        this.user_id = user_id;
        this.dateAdded = dateAdded;
        this.words = words;
        this.name = name;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Timestamp dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public void setDateAndId() {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement entryPrep = conn.prepareStatement("SELECT * FROM Entry ORDER BY _id DESC LIMIT 1");  
          
          ResultSet rs = entryPrep.executeQuery();
          while (rs.next()) {
              _id = rs.getInt(1);
              dateAdded = rs.getTimestamp(2);
          } rs.close();
          
          entryPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
    
    public void addEntry(int id) {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement entryPrep = conn.prepareStatement("INSERT INTO Entry (words, user_id, name) VALUES (?,?,?)");  
          entryPrep.setInt(2, id);
          entryPrep.setString(1, words);
          entryPrep.setString(3, name);
          entryPrep.execute();

          
          entryPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
    
    public void removeFromDB() {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement entryPrep = conn.prepareStatement("DELETE FROM Entry WHERE _id = ?");  
          entryPrep.setInt(1, _id);
          entryPrep.execute();

          
          entryPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
    
    public void updateInDB() {
        try { 
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://secretkeeperapp.cbk5oil2vwgg.us-east-1.rds.amazonaws.com:3306/secretKeeper", "hilarysaurus", "eSJdRDSsvpnh0ay3OYvB");
         
          PreparedStatement entryPrep = conn.prepareStatement("UPDATE Entry SET words = ? WHERE _id = ?");  
          entryPrep.setString(1, words);
          entryPrep.setInt(2, _id);
          entryPrep.execute();

          
          entryPrep.close();
          conn.close();
        }
        catch (Exception e) {
            System.out.println("Database error" + e.getMessage());
            e.printStackTrace();
        }    
    }
    
}
