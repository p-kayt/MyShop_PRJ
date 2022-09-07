/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import DTO.UserDTO;
import DTO.UserError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kayt
 */
public class registerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR="register.jsp";
    private static final String SUCCESS="login.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            UserDAO dao = new UserDAO();
            UserError userError = new UserError();
            try {
                String email = request.getParameter("email");
                String fullName = request.getParameter("fullName");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String confirmPws = request.getParameter("confirmPws");
                String roleId = "US";         
                
                boolean checkVal = true;
//                if(userId.length() > 10 || userId.length() < 2){
//                    userError.setUserId("UserID bet 3 and 10");
//                    checkVal = false;
//                }
                if(!userError.validate(email)){
                    userError.setEmail("Email invalidate!");
                    checkVal = false;
                }

                if(dao.checkDupEmail(email)){
                    userError.setEmail("This email has been registered!");
                    checkVal = false;
                }
                
                if(fullName.length() > 50 || fullName.length() < 5){
                    userError.setFullName("Name must be between 5 and 50 character");
                    checkVal = false;
                }
                
                if(phone.length() > 11 || fullName.length() < 0){
                    userError.setPhone("Phone number is invalid!");
                    checkVal = false;
                }
                
                if(!password.equals(confirmPws)){
                    userError.setConfirmPws("Not match");
                    checkVal = false;
                }
                
                if(checkVal){
                    UserDTO user = new UserDTO(email, fullName, password, phone, roleId);
                    if(dao.insertUser(user)){
                        url = SUCCESS;
                    }
                }else{
                    request.setAttribute("USER_ERROR", userError);
                }
                
            } catch (Exception e) {
               log("Error at Create controller" + e.toString());
               if(e.toString().contains("duplicate")){
                   userError.setError("Can not register, please try again later!");
               }
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
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
