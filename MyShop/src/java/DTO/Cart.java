/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Kayt
 */
public class Cart {

    private Map<String, ProductDTO> cart;
    
    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    
    public  boolean add (ProductDTO product){
        boolean check = false;
        if(this.cart==null){
            this.cart= new HashMap<>();
        }
        if(this.cart.containsKey(product.getProductId())){
            int curQty = this.cart.get(product.getProductId()).getQuantity();
            product.setQuantity(curQty+ product.getQuantity());
        }
        this.cart.put(product.getProductId(), product);
        check = true;
        return check;
    }
    
    public boolean remove (String id){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }
    
    public boolean update (String id, ProductDTO product){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, product);
                check = true;
            }
        }
        return check;
    }
}
