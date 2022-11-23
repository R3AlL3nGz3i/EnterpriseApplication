package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.CustomerOrder;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T21:27:22")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, String> gender;
    public static volatile ListAttribute<Customer, CustomerOrder> cusOrder;
    public static volatile SingularAttribute<Customer, Integer> phone;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile SingularAttribute<Customer, String> IC;
    public static volatile SingularAttribute<Customer, String> id;
    public static volatile SingularAttribute<Customer, String> email;

}