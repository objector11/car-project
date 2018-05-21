package cn.lnj.project.car.data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="admin")
public class Admin {

    @Id
    private String id;
    @Column(name = "user_id")
    private String userId;
    @Column(name = "shop_id")
    private String shopId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }
}
