/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Cart;
import DTO.ProductDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author Kayt
 */
public class ProductDAO {

    private static final String GET_PRODUCT = "SELECT pId, pName, price, imgPath, quantity, description, cateId FROM Products";
    private static final String SEARCH_PRODUCT = "SELECT pId, pName, price, imgPath, quantity, description, cateId FROM Products WHERE pName like ?";
    private static final String DELETE_PRODUCT = "DELETE Products WHERE pId =?";
    private static final String UPDATE_PRODUCT = "UPDATE Products SET price=?, quantity=? WHERE pId=?";
    private static final String INSERT_PRODUCT = "INSERT INTO Products(pName, price, imgPath, quantity, description, cateId) VALUES (?,?,?,?,?,?)";

   

    public List<ProductDTO> getAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(GET_PRODUCT);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productId = rs.getString("pId");
                    String productName = rs.getString("pName");
                    double price = rs.getDouble("price");
                    String imgPath = rs.getString("imgPath");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("cateId");
                    list.add(new ProductDTO(productId, productName, price, imgPath, quantity, description, categoryId));
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
        return list;
    }

    public List<ProductDTO> searchProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(SEARCH_PRODUCT);
                pst.setString(1, "%" + search + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productId = rs.getString("pId");
                    String productName = rs.getString("pName");
                    double price = rs.getDouble("price");
                    String imgPath = rs.getString("imgPath");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("cateId");
                    list.add(new ProductDTO(productId, productName, price, imgPath, quantity, description, categoryId));
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
        return list;
    }

    public boolean deleteProduct(String productId) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(DELETE_PRODUCT);
                pst.setString(1, productId);
                check = pst.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public boolean updateProduct(String pId, double price, int quantity) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(UPDATE_PRODUCT);
                pst.setDouble(1, price);
                pst.setInt(2, quantity);
                pst.setString(3, pId);
                check = pst.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public boolean insertProduct(ProductDTO prd) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(INSERT_PRODUCT);
                pst.setString(1, prd.getProductName());
                pst.setDouble(2, prd.getPrice());
                pst.setString(3, prd.getImgPath());
                pst.setInt(4, prd.getQuantity());
                pst.setString(5, prd.getDescription());
                pst.setString(6, prd.getCategoryId());
                check = pst.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    

}
