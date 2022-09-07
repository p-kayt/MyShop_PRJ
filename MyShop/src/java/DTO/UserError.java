/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.regex.Pattern;

/**
 *
 * @author Kayt
 */
public class UserError {

    private String email;
    private String fullName;
    private String phone;
    private String password;
    private String confirmPws;
    private String roleId;
    private String error;
    private static final String REGEX_PATTERN = "^(.+)@(\\S+)$";

    public UserError(String email, String fullName, String phone, String password, String confirmPws, String roleId, String error) {
        this.email = email;
        this.fullName = fullName;
        this.phone = phone;
        this.password = password;
        this.confirmPws = confirmPws;
        this.roleId = roleId;
        this.error = error;
    }

    public UserError() {
        this.email = "";
        this.fullName = "";
        this.phone = "";
        this.password = "";
        this.confirmPws = "";
        this.roleId = "";
        this.error = "";
    }

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

    public String getConfirmPws() {
        return confirmPws;
    }

    public void setConfirmPws(String confirmPws) {
        this.confirmPws = confirmPws;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public static boolean validate(String emailAddress) {
        return Pattern.compile(REGEX_PATTERN)
                .matcher(emailAddress)
                .matches();
    }
}
