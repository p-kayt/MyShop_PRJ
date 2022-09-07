/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.UserDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kayt
 */
public class UserDAO {

    private static final String LOGIN       = "SELECT accId, fullName, roleId, phone FROM Accounts WHERE email=? AND password=?";
    private static final String GET_USER    = "SELECT accId, email, fullname, password, phone, roleId FROM Accounts";
    private static final String SEARCH_USER = "SELECT accId, email, fullname, password, phone, roleId FROM Accounts WHERE fullName like ?";
    private static final String DELETE_USER = "DELETE Accounts WHERE accId =?";
    private static final String UPDATE_USER = "UPDATE Accounts SET roleId=? WHERE accId=?";
    private static final String UPDATE_PROFILE = "UPDATE Accounts SET fullName=? ,phone=? WHERE accId=?";
    private static final String CHECKDUP    = "SELECT accId, fullName, roleId, phone FROM Accounts WHERE email=?";
    private static final String INSERT_USER = "INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES (?,?,?,?,?)";

    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(LOGIN);
                pst.setString(1, email);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String userId = rs.getString("accId");
                    String fullname = rs.getString("fullName");
                    String roleId = rs.getString("roleId");
                    String phone = rs.getString("phone");
                    user = new UserDTO(userId, email, fullname, password, phone, roleId);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return user;
    }
    
    public List<UserDTO> getAllUser () throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(GET_USER);
                rs = pst.executeQuery();
                while(rs.next()){
                    String userId = rs.getString("accId");
                    String email = rs.getString("email");
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String roleId = rs.getString("roleId");
                    String password = "";
                    list.add(new UserDTO(userId, email, fullName, password, phone, roleId));
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return list;
    }
    
    public List<UserDTO> searchUser (String search) throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(SEARCH_USER);
                pst.setString(1, "%"+search+"%");
                rs = pst.executeQuery();
                while(rs.next()){
                    String userId = rs.getString("accId");
                    String email = rs.getString("email");
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String roleId = rs.getString("roleId");
                    String password = "";
                    list.add(new UserDTO(userId, email, fullName, password, phone, roleId));
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return list;
    }
    
    public boolean deleteUser(String userId) throws SQLException{
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(DELETE_USER);
                pst.setString(1, userId);
                check = pst.executeUpdate()>0;
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return check;
    }
    
    public boolean updateUser(String userId, String roleId) throws SQLException{
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(UPDATE_USER);
                pst.setString(1, roleId);
                pst.setString(2, userId);
                check = pst.executeUpdate()>0;
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return check;
    }
    
    public boolean updateUser(String userId, String fullName, String phone) throws SQLException{
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(UPDATE_PROFILE);
                pst.setString(1, fullName);
                pst.setString(2, phone);
                pst.setString(3, userId);
                check = pst.executeUpdate()>0;
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return check;
    }

    //true if email existed?
    public boolean checkDupEmail(String email) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
         try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(CHECKDUP);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(pst != null) pst.close();
            if(cn != null) cn.close();
            if(rs != null) rs.close();
        }
        return check;
    }

    public boolean insertUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
         try {
            cn = DBUtils.getConnection();
            if(cn!=null){
                pst = cn.prepareStatement(INSERT_USER);
                pst.setString(1, user.getEmail());
                pst.setString(2, user.getFullName());
                pst.setString(3, user.getPassword());
                pst.setString(4, user.getPhone());
                pst.setString(5, user.getRoleId());
                check = pst.executeUpdate()> 0;
            }
        } catch (Exception e) {
             e.printStackTrace();
        } finally{
            if(pst != null) pst.close();
            if(cn != null) cn.close();
        }
        return check;
    }
}
