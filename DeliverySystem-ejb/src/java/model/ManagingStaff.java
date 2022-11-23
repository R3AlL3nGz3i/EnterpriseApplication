/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author alext
 */
@Entity
public class ManagingStaff implements Serializable {

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
        
    public ManagingStaff() {
    }

    public ManagingStaff(String id, String password, String name, String position, String gender, int phone, String address, String IC, String email) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.position = position;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.IC = IC;
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public String getIC() {
        return IC;
    }

    public String getEmail() {
        return email;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setIC(String IC) {
        this.IC = IC;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPosition(String position) {
        this.position = position;
    }


    public void setPhone(int phone) {
        this.phone = phone;
    }



    public void setName(String name) {
        this.name = name;
    }


    public void setAddress(String address) {
        this.address = address;
    }


    public String getPosition() {
        return position;
    }


    public int getPhone() {
        return phone;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getName() {
        return name;
    }


    public String getAddress() {
        return address;
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
        if (!(object instanceof ManagingStaff)) {
            return false;
        }
        ManagingStaff other = (ManagingStaff) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.managingStaff[ id=" + id + " ]";
    }
    
}
