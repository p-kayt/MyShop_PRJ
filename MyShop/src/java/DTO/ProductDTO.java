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
public class ProductDTO {
    private String productId;
    private String productName;
    private double price;
    private String imgPath;
    private int quantity;
    private String description;
    private String categoryId;

    public ProductDTO(String productId, String productName, double price, String imgPath, int quantity, String description, String categoryId) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.imgPath = imgPath;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
    }

    public ProductDTO(String productName, double price, String imgPath, int quantity, String description, String categoryId) {
        this.productId = "";
        this.productName = productName;
        this.price = price;
        this.imgPath = imgPath;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
    }

    public ProductDTO() {
        this.productId = "";
        this.productName = "";
        this.price = 0;
        this.imgPath = "";
        this.quantity = 0; //
        this.description = "";
        this.categoryId = "";
    }

    public String getProductId() {
        return productId;
    }

//    public void setProductId(String productId) {
//        this.productId = productId;
//    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productnName) {
        this.productName = productnName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    
}
