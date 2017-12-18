package domain;

import java.util.Date;

public class CarOrder {
    private String id;
    private String license_plate;
    private int owner_id;
    private int tenant_id;
    private int subscription_price;
    private int oil_price;
    private String state;
    private Date update_time;

    // 一些满足其他需要的参数
    private String owner_name;
    private String tenant_name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLicense_plate() {
        return license_plate;
    }

    public void setLicense_plate(String license_plate) {
        this.license_plate = license_plate;
    }

    public int getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(int owner_id) {
        this.owner_id = owner_id;
    }

    public int getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(int tenant_id) {
        this.tenant_id = tenant_id;
    }

    public int getSubscription_price() {
        return subscription_price;
    }

    public void setSubscription_price(int subscription_price) {
        this.subscription_price = subscription_price;
    }

    public int getOil_price() {
        return oil_price;
    }

    public void setOil_price(int oil_price) {
        this.oil_price = oil_price;
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

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public String getTenant_name() {
        return tenant_name;
    }

    public void setTenant_name(String tenant_name) {
        this.tenant_name = tenant_name;
    }
}
