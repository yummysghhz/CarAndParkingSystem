package domain;

import java.util.Date;

public class CarPrice {
    private int oil_price;
    private int subscription_price;
    private Date update_time;

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public int getOil_price() {
        return oil_price;
    }

    public void setOil_price(int oil_price) {
        this.oil_price = oil_price;
    }

    public int getSubscription_price() {
        return subscription_price;
    }

    public void setSubscription_price(int subscription_price) {
        this.subscription_price = subscription_price;
    }

}
