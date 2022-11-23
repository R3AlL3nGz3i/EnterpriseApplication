package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T21:27:22")
@StaticMetamodel(Cart.class)
public class Cart_ { 

    public static volatile SingularAttribute<Cart, Double> total_item;
    public static volatile ListAttribute<Cart, Product> product;
    public static volatile SingularAttribute<Cart, Integer> quantity;
    public static volatile SingularAttribute<Cart, Double> price;
    public static volatile SingularAttribute<Cart, String> product_id;
    public static volatile SingularAttribute<Cart, Long> id;
    public static volatile SingularAttribute<Cart, String> cus_id;

}