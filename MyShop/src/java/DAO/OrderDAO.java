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

/**
 *
 * @author Kayt
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT INTO Orders(ordDate, accId, total) VALUES (?,?,?)";
    private static final String GET_NEW_ORDER_ID = "SELECT top 1 orderId from Orders order by orderId desc";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO OrderDetails (orderId, pId, quantity, price) VALUES (?,?,?,?)";

    public boolean addOrder(String userId, Cart cart) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String orderId = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(INSERT_ORDER);
                java.sql.Date d = new java.sql.Date(System.currentTimeMillis());
                pst.setDate(1, d);
                pst.setString(2, userId);
                double total = 0;
                for (ProductDTO o : cart.getCart().values()) {
                    total += (o.getPrice() * o.getQuantity());
                }
                pst.setDouble(3, total);
                check = pst.executeUpdate() > 0;
                if (check) {
                    pst = cn.prepareStatement(GET_NEW_ORDER_ID);
                    rs = pst.executeQuery();
                    if (rs != null && rs.next()) {
                        orderId = rs.getString("orderId");
                    }
                    for (ProductDTO o : cart.getCart().values()) {
                        pst = cn.prepareStatement(INSERT_ORDER_DETAIL);
                        pst.setString(1, orderId);
                        pst.setString(2, o.getProductId());
                        pst.setInt(3, o.getQuantity());
                        pst.setDouble(4, o.getPrice());
                        check = pst.executeUpdate() > 0;
                    }
                }
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
