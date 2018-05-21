package cn.lnj.project.car.data;


import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="car")
public class Car {

    @Id
    private String carId;

    @Column(name = "car_brand")
    private String carBrand;

    @Column(name="car_name")
    private String carName;

    @Column(name="car_type")
    private String carType;

    @Column(name="car_image")
    private String carImage;

    @Column(name="car_price")
    private double carPrice;

    @Column(name="car_amount")
    private int carAmount;

    @Column(name="car_people")
    private int carPeople;

    @Column(name="car_good")
    private double carGood;

    @Column(name="car_info")
    private String carInfo;

    @Column(name="rent_count")
    private int rentCount;

    @Column(name="shop_id")
    private String shopId;

    @Column(name="car_milage")
    private double carMilage;

    @Column(name="car_time")
    private String carTime;

    @Column(name = "user_id")
    private String userId;

    public String getCarBrand() {
        return carBrand;
    }

    public void setCarBrand(String carBrand) {
        this.carBrand = carBrand;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getCarImage() {
        return carImage;
    }

    public void setCarImage(String carImage) {
        this.carImage = carImage;
    }

    public double getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(double carPrice) {
        this.carPrice = carPrice;
    }

    public int getCarAmount() {
        return carAmount;
    }

    public void setCarAmount(int carAmount) {
        this.carAmount = carAmount;
    }

    public int getCarPeople() {
        return carPeople;
    }

    public void setCarPeople(int carPeople) {
        this.carPeople = carPeople;
    }

    public double getCarGood() {
        return carGood;
    }

    public void setCarGood(double carGood) {
        this.carGood = carGood;
    }

    public String getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(String carInfo) {
        this.carInfo = carInfo;
    }

    public int getRentCount() {
        return rentCount;
    }

    public void setRentCount(int rentCount) {
        this.rentCount = rentCount;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public double getCarMilage() {
        return carMilage;
    }

    public void setCarMilage(double carMilage) {
        this.carMilage = carMilage;
    }

    public String getCarTime() {
        return carTime;
    }

    public void setCarTime(String carTime) {
        this.carTime = carTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
