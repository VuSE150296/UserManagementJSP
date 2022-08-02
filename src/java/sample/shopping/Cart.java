/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class Cart {
    private Map<String, Tea> cart;

    public Cart() {
    }

    public Cart(Map<String, Tea> cart) {
        this.cart = cart;
    }

    public Map<String, Tea> getCart() {
        return cart;
    }

    public void setCart(Map<String, Tea> cart) {
        this.cart = cart;
    }
    
    public boolean add(Tea tea){
        boolean check = false;
        //cart này chưa có thì tạo mới
        if(this.cart==null){
            this.cart = new HashMap<>();
        }
        //Trường hợp cái cart đã có chứa cái trà này rồi sẽ nhật lại quantity theo cấu trúc mình viết trước
        if(this.cart.containsKey(tea.getId())){
            //this.cart.get(tea.getId()).getQuantity() -> là cái quantity hiện tại của sản phẩm đang  có trong giỏ hàng
            int currentQuantity = this.cart.get(tea.getId()).getQuantity();
            //sau đó cập nhật lại giỏ hàng
            tea.setQuantity(currentQuantity+ tea.getQuantity());
        }
        this.cart.put(tea.getId(), tea);
        check=true;
        return check;
    }
    public boolean remove(String id){
        boolean check = false;
        if(this.cart!=null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
            }
        }
        return check;
    }
    public boolean edit(String id, Tea tea){
        boolean check = false;
        if(this.cart!=null) {
            if(this.cart.containsKey(id)){
                this.cart.replace(id, tea);
                check = true;
            }
        }
        return check;
    }
}
