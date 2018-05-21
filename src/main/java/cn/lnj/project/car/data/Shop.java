package cn.lnj.project.car.data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "Shop")
public class Shop {

    @Id
    private String shopId;

    @Column(name="shop_name")
    private String shopName;

    @Column(name="shop_phone")
    private String shopPhone;

    @Column(name = "shop_email")
    private String shopEmail;

    @Column(name="shop_location")
    private String shopLocation;

    @Column(name = "jingdu")
    private double jingDu;

    @Column(name = "weidu")
    private double weidu;

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopPhone() {
        return shopPhone;
    }

    public void setShopPhone(String shopPhone) {
        this.shopPhone = shopPhone;
    }

    public String getShopEmail() {
        return shopEmail;
    }

    public void setShopEmail(String shopEmail) {
        this.shopEmail = shopEmail;
    }

    public String getShopLocation() {
        return shopLocation;
    }

    public void setShopLocation(String shopLocation) {
        this.shopLocation = shopLocation;
    }

    public double getJingDu() {
        return jingDu;
    }

    public void setJingDu(double jingDu) {
        this.jingDu = jingDu;
    }

    public double getWeidu() {
        return weidu;
    }

    public void setWeidu(double weidu) {
        this.weidu = weidu;
    }

}
