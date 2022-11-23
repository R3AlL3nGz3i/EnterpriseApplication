package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T21:27:22")
@StaticMetamodel(CustomerOrder.class)
public class CustomerOrder_ { 

    public static volatile SingularAttribute<CustomerOrder, String> feedback;
    public static volatile SingularAttribute<CustomerOrder, String> order_date;
    public static volatile SingularAttribute<CustomerOrder, String> address;
    public static volatile SingularAttribute<CustomerOrder, Double> price;
    public static volatile SingularAttribute<CustomerOrder, String> delivery_id;
    public static volatile SingularAttribute<CustomerOrder, Integer> id;
    public static volatile SingularAttribute<CustomerOrder, String> delivery_status;
    public static volatile SingularAttribute<CustomerOrder, String> cus_ID;

}