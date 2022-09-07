/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

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
public class mainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    
    private static final String LOGIN = "login";
    private static final String LOGIN_CONTROLLER = "loginController";
    private static final String REGISTER = "register";
    private static final String REGISTER_CONTROLLER = "registerController";
    private static final String LOGOUT = "logout";
    private static final String LOGOUT_CONTROLLER = "logoutController";
    
    private static final String SEARCH = "search";
    private static final String SEARCH_CONTROLLER = "searchController";
    
    private static final String SEARCH_USER = "searchUser";
    private static final String SEARCH_USER_CONTROLLER = "searchUserController";
    //CART
    private static final String ADD = "addToCart";
    private static final String ADD_CONTROLLER = "addController";
    private static final String VIEW_CART = "viewCart";
    private static final String CART_CONTROLLER = "myCart.jsp";
    private static final String REMOVE = "remove";
    private static final String REMOVE_CONTROLLER = "removeController";
    private static final String EDIT = "edit";
    private static final String EDIT_CONTROLLER = "editController";
    //checkout
    private static final String CHECKOUT = "checkout";
    private static final String CHECKOUT_CONTROLLER = "checkoutController";
    //ADMIN
    private static final String VIEW_PRODUCT = "viewProduct";
    private static final String VIEW_PRD_CONTROLLER = "viewProductController";
    private static final String VIEW_USER = "viewUser";
    private static final String VIEW_USER_CONTROLLER = "viewUserController";
    private static final String ADD_PRODUCT = "addProduct";
    private static final String ADD_PRODUCT_CONTROLLER = "addProductController";
    private static final String UPDATE_PRODUCT = "updateProduct";
    private static final String UPDATE_PRD_CONTROLLER = "updateProductController";
    private static final String DELETE_PRODUCT = "deleteProduct";
    private static final String DELETE_PRD_CONTROLLER = "deleteProductController";
    
    private static final String UPDATE_USER = "updateUser";
    private static final String UPDATE_USER_CONTROLLER = "updateUserController";
    private static final String DELETE_USER = "deleteUser";
    private static final String DELETE_USER_CONTROLLER = "deleteUserController";
    
    
    //USER
    private static final String UPDATE_PROFILE = "updateProfile";
    private static final String UPDATE_PROFILE_CONTROLLER = "updateProfileController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String url = ERROR;
            try {   
                String action = request.getParameter("action");
                
                if(LOGIN.equalsIgnoreCase(action)){
                    url = LOGIN_CONTROLLER;
                }
                if(LOGOUT.equalsIgnoreCase(action)){
                    url = LOGOUT_CONTROLLER;
                }
                if(SEARCH.equalsIgnoreCase(action)){
                    url = SEARCH_CONTROLLER;
                }
                if(ADD.equalsIgnoreCase(action)){
                    url = ADD_CONTROLLER;
                }
                if(VIEW_CART.equalsIgnoreCase(action)){
                    url = CART_CONTROLLER;
                }
                if(REMOVE.equalsIgnoreCase(action)){
                    url = REMOVE_CONTROLLER;
                }
                if(EDIT.equalsIgnoreCase(action)){
                    url = EDIT_CONTROLLER;
                }
                //admin
                if(VIEW_PRODUCT.equalsIgnoreCase(action)){
                    url = VIEW_PRD_CONTROLLER;
                }
                if(VIEW_USER.equalsIgnoreCase(action)){
                    url = VIEW_USER_CONTROLLER;
                }
                if(SEARCH_USER.equalsIgnoreCase(action)){
                    url = SEARCH_USER_CONTROLLER;
                }
                if(UPDATE_PRODUCT.equalsIgnoreCase(action)){
                    url = UPDATE_PRD_CONTROLLER;
                }
                if(UPDATE_USER.equalsIgnoreCase(action)){
                    url = UPDATE_USER_CONTROLLER;
                }
                if(DELETE_PRODUCT.equalsIgnoreCase(action)){
                    url = DELETE_PRD_CONTROLLER;
                }
                if(DELETE_USER.equalsIgnoreCase(action)){
                    url = DELETE_USER_CONTROLLER;
                }
                if(UPDATE_PROFILE.equalsIgnoreCase(action)){
                    url = UPDATE_PROFILE_CONTROLLER;
                }
                if(ADD_PRODUCT.equalsIgnoreCase(action)){
                    url = ADD_PRODUCT_CONTROLLER;
                }
                
                if(REGISTER.equalsIgnoreCase(action)){
                    url = REGISTER_CONTROLLER;
                }
                
                if(CHECKOUT.equalsIgnoreCase(action)){
                    url = CHECKOUT_CONTROLLER;
                }
                
            } catch (Exception e) {
                log("Error at MainController: " + e.toString());
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
