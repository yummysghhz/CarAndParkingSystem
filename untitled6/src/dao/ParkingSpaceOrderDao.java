package dao;

import domain.ParkingSpaceOrder;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class ParkingSpaceOrderDao {
    public List<ParkingSpaceOrder> findAll() throws SQLException {
        String sql = "select parking_space_order.*,name from parking_space_order,user " +
                "where parking_space_order.user_id=user.id order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(ParkingSpaceOrder.class));
    }

    public void delete(String id) throws SQLException {
        String sql = "delete from parking_space_order where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }

    public void changeState(String id, String state, boolean closeConn) throws SQLException {
        String sql = "update parking_space_order set state=?,update_time=? where id=?";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, state, new Date(), id);
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, state, new Date(), id);
        }
    }

    public void insert(ParkingSpaceOrder order, boolean closeConn) throws SQLException {
        String sql = "insert into parking_space_order value (?,?,?,?,?,?,?,?)";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, order.getId(), order.getSpace_id(),
                    order.getLicense_plate(), order.getUser_id(),
                    order.getState(), order.getUpdate_time(),
                    order.getDuration(), order.getPrice_in_all());
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql,
                    order.getId(), order.getSpace_id(),
                    order.getLicense_plate(), order.getUser_id(),
                    order.getState(), order.getUpdate_time(),
                    order.getDuration(), order.getPrice_in_all());
        }
    }

    public List<ParkingSpaceOrder> findByUserId(int id) throws SQLException {
        String sql = "select parking_space_order.*,name from parking_space_order,user " +
                "where parking_space_order.user_id=? and parking_space_order.user_id=user.id " +
                "order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(ParkingSpaceOrder.class), id);
    }
}
