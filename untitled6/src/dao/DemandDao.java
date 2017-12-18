package dao;

import domain.Demand;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class DemandDao {
    public List<Demand> findAll() throws SQLException {
        String sql = "select demand_list.*,name from demand_list,user where demand_list.user_id=user.id order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(Demand.class));
    }

    public void insert(Demand demand) throws SQLException {
        String sql = "insert into demand_list value (?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, demand.getId(), demand.getUser_id(), demand.getDescription(), demand.getState(), demand.getUpdate_time());
    }

    public void changeState(String id, String state, boolean closeConn) throws SQLException {
        String sql = "update demand_list set state=?,update_time=? where id=?";
        if (closeConn) {
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            runner.update(sql, state, new Date(), id);
        } else {
            QueryRunner runner = new QueryRunner();
            runner.update(DataSourceUtils.getConnection(), sql, state, new Date(), id);
        }
    }

    public void delete(String id) throws SQLException {
        String sql = "delete from demand_list where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }

    public List<Demand> findByState(String state) throws SQLException {
        String sql = "select demand_list.*,name from demand_list,user " +
                "where demand_list.state=? and demand_list.user_id=user.id order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(Demand.class), state);
    }

    public List<Demand> findByUserId(int id) throws SQLException {
        String sql = "select demand_list.*,name from demand_list,user where user_id=? and demand_list.user_id=user.id order by update_time desc";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<>(Demand.class), id);
    }
}
