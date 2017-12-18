package domain;

import java.util.Date;

public class ParkingSpace {
    private int id;
    private String location;
    private String state;
    private Date update_time;

    // 一些满足其他需要的参数
    private int daily_price;
    private int monthly_price;

    public int getDaily_price() {
        return daily_price;
    }

    public void setDaily_price(int daily_price) {
        this.daily_price = daily_price;
    }

    public int getMonthly_price() {
        return monthly_price;
    }

    public void setMonthly_price(int monthly_price) {
        this.monthly_price = monthly_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
