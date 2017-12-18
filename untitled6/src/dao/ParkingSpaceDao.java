package dao;

import domain.ParkingSpace;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class ParkingSpaceDao {

    public void changeState(int spaceId, String state, boolean closeConn) throws SQLException {
        String sql = "update parking_space set state=?,update_time=? where id=?";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, state, new Date(), spaceId);
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, state, new Date(), spaceId);
        }
    }

    public List<ParkingSpace> findAll() throws SQLException {
        String sql = "select parking_space.*,daily_price,monthly_price from parking_space,parking_space_price order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(ParkingSpace.class));
    }

    public List<ParkingSpace> findByState(String state) throws SQLException {
        String sql = "select parking_space.*,daily_price,monthly_price from parking_space,parking_space_price where parking_space.state=? order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(ParkingSpace.class), state);
    }
}
