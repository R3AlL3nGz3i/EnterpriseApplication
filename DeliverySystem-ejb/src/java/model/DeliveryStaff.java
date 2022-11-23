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
public class DeliveryStaff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private String password;
    private String name;
    private String position;
    private String gender;
    private int phone;
    private String address;
    private String IC;
    private String email;
    private String status;


    
    
    public DeliveryStaff() {
    }

    public DeliveryStaff(String id, String password, String name, String position, String gender, int phone, String address, String IC, String email, String status) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.position = position;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.IC = IC;
        this.email = email;
        this.status = status;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setIC(String IC) {
        this.IC = IC;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getPosition() {
        return position;
    }

    public String getGender() {
        return gender;
    }

    public int getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getIC() {
        return IC;
    }

    public String getEmail() {
        return email;
    }

    public String getStatus() {
        return status;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
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
        if (!(object instanceof DeliveryStaff)) {
            return false;
        }
        DeliveryStaff other = (DeliveryStaff) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.DeliveryStaff[ id=" + id + " ]";
    }
    
}
