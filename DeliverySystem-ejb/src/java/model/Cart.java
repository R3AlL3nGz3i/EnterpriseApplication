/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author alext
 */
@Entity
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double price;
    private String product_id;
    private int quantity;   
    private String cus_id;
    private double total_item;

    
    @OneToMany
    private ArrayList<Product> product  = new ArrayList<Product>() ;

    
    public Cart(Long id, double price, String product_id, int quantity, String cus_id, double total_item, Product p) {
    
        this.id = id;
        this.price = price;
        this.product_id = product_id;
        this.quantity = quantity;
        this.cus_id = cus_id;
        this.total_item = total_item;
    
    }
    public Cart(Long id, double price, String product_id, int quantity, String cus_id, double total_item) {
        this.id = id;
        this.price = price;
        this.product_id = product_id;
        this.quantity = quantity;
        this.cus_id = cus_id;
        this.total_item = total_item;
    }
    
    public double getTotal_item() {
        return total_item;
    }

    public void setTotal_item(double total_item) {
        this.total_item = total_item;
    }

    
    public String getCus_id() {
        return cus_id;
    }

    public void setCus_id(String cus_id) {
        this.cus_id = cus_id;
    }

    
    public Cart(Long id, double price, String product_id, int quantity, String cus_id) {
        this.id = id;
        this.price = price;
        this.product_id = product_id;
        this.quantity = quantity;
        this.cus_id = cus_id;
    }
    
    public Cart() {
    }


    public void setPrice(double price) {
        this.price = price;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public double getPrice() {
        return price;
    }

    public String getProduct_id() {
        return product_id;
    }

    public int getQuantity() {
        return quantity;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cart)) {
            return false;
        }
        Cart other = (Cart) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Cart[ id=" + id + " ]";
    }
    
}
