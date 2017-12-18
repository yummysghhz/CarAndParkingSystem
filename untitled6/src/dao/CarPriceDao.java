package dao;

import domain.CarPrice;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;

public class CarPriceDao {

    public CarPrice getCurrentCarPrice(boolean closeConn) throws SQLException {
        String sql = "select * from car_price";
        CarPrice carPrice = null;
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            carPrice = runner.query(sql, new BeanHandler<>(CarPrice.class));
        } else {
            QueryRunner runner = new QueryRunner();
            carPrice = runner.query(DataSourceUtils.getConnection(), sql, new BeanHandler<>(CarPrice.class));
        }
        return carPrice;
    }
}
