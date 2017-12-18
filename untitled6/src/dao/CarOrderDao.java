package dao;

import domain.CarOrder;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class CarOrderDao {

    public List<CarOrder> findAll() throws SQLException {
        String sql = "select a.*,user.name 'tenant_name' from " +
                "( select car_order.*,user.name 'owner_name' from car_order,user where car_order.owner_id=user.id) " +
                "a, user where a.tenant_id=user.id order by a.update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(CarOrder.class));
    }

    public void insert(CarOrder order, boolean closeConn) throws SQLException {
        String sql = "insert into car_order value (?,?,?,?,?,?,?,?)";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, order.getId(), order.getLicense_plate(), order.getOwner_id(), order.getTenant_id(),
                    order.getSubscription_price(), order.getOil_price(), order.getState(), order.getUpdate_time());
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, order.getId(), order.getLicense_plate(),
                    order.getOwner_id(), order.getTenant_id(), order.getSubscription_price(),
                    order.getOil_price(), order.getState(), order.getUpdate_time());
        }
    }

    public void changeState(String id, String state, boolean closeConn) throws SQLException {
        String sql = "update car_order set state=?,update_time=? where id=?";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, state, new Date(), id);
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, state, new Date(), id);
        }
    }

    public void applyOrder(String id, String state, int userId, boolean closeConn) throws SQLException {
        String sql = "update car_order set state=?,update_time=?,tenant_id=? where id=?";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, state, new Date(), userId, id);
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, state, new Date(), userId, id);
        }
    }
}
