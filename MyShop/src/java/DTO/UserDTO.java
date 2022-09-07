/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Kayt
 */
public class UserDTO {

    private String userId;
    private String email;
    private String fullName;
    private String password;
    private String phone;
    private String roleId;

    public UserDTO(String userId, String email, String fullName, String password, String phone, String roleId) {
        this.userId = userId;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.phone = phone;
        this.roleId = roleId;
    }

    public UserDTO(String email, String fullName, String password, String phone, String roleId) {
        this.userId = "";
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.phone = phone;
        this.roleId = roleId;
    }
//    
//    public UserDTO(String email, String fullName, String phone, String roleId) {
//        this.userId = "";
//        this.email = email;
//        this.fullName = fullName;
//        this.password = "";
//        this.phone = phone;
//        this.roleId = roleId;
//    }
    
    public UserDTO() {
        this.userId = "";
        this.email = "";
        this.fullName = "";
        this.password = "";
        this.phone = "";
        this.roleId = "";
    }

    public String getUserId() {
        return userId;
    }

//    public void setUserId(String userId) {
//        this.userId = userId;
//    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    
    
}
