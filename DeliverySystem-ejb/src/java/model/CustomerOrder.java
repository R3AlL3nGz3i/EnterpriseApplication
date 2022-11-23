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
public class CustomerOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String cus_ID;
    private String address;
    private Double price;
    private String delivery_status;
    private String order_date;
    private String delivery_id;
    private String feedback;

  
    
    public CustomerOrder() {
    }

    public CustomerOrder(Integer id, String cus_ID, String address, Double price, String delivery_status, String order_date, String delivery_id, String feedback) {
        this.id = id;
        this.cus_ID = cus_ID;
        this.address = address;
        this.price = price;
        this.delivery_status = delivery_status;
        this.order_date = order_date;
        this.delivery_id = delivery_id;
        this.feedback = feedback;
    }

    public CustomerOrder(String cus_ID, String address, Double price, String delivery_status, String order_date, String delivery_id, String feedback) {
        this.cus_ID = cus_ID;
        this.address = address;
        this.price = price;
        this.delivery_status = delivery_status;
        this.order_date = order_date;
        this.delivery_id = delivery_id;
        this.feedback = feedback;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getCus_ID() {
        return cus_ID;
    }

    public String getAddress() {
        return address;
    }

    public Double getPrice() {
        return price;
    }

    public String getDelivery_status() {
        return delivery_status;
    }

    public String getOrder_date() {
        return order_date;
    }

    public String getDelivery_id() {
        return delivery_id;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setCus_ID(String cus_ID) {
        this.cus_ID = cus_ID;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setDelivery_status(String delivery_status) {
        this.delivery_status = delivery_status;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public void setDelivery_id(String delivery_id) {
        this.delivery_id = delivery_id;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
        if (!(object instanceof CustomerOrder)) {
            return false;
        }
        CustomerOrder other = (CustomerOrder) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CustomerOrder[ id=" + id + " ]";
    }
    
}
