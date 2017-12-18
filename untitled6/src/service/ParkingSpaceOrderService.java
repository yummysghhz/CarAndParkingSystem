package service;

import dao.ParkingSpaceDao;
import dao.ParkingSpaceOrderDao;
import domain.ParkingSpaceOrder;
import domain.User;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class ParkingSpaceOrderService {
    public List<ParkingSpaceOrder> findAll(User user) throws SQLException {
        ParkingSpaceOrderDao orderDao = new ParkingSpaceOrderDao();
        List<ParkingSpaceOrder> list = null;
        if ("admin".equals(user.getRole())) {
            list = orderDao.findAll();
        } else {
            list = orderDao.findByUserId(user.getId());
        }
        return list;
    }

    public void delete(String id) throws SQLException {
        new ParkingSpaceOrderDao().delete(id);
    }

    /**
     * todo 【管理员】同意用户取消车位订单
     * 1、车位的状态：'已被预定'->'空闲'
     * 2、车位订单状态：'申请取消'->'已取消'
     *
     * @param id
     * @throws SQLException
     */
    public void cancel(String id, int spaceId) throws SQLException {
        ParkingSpaceDao spaceDao = new ParkingSpaceDao();
        ParkingSpaceOrderDao orderDao = new ParkingSpaceOrderDao();
        try {
            DataSourceUtils.startTransaction();
            spaceDao.changeState(spaceId, "空闲", false);
            orderDao.changeState(id, "已取消", false);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                DataSourceUtils.commitAndReleaseConnection();
            } catch (SQLException e) {
                throw new SQLException();
            }
        }
    }

    public void requestCancel(String id) throws SQLException {
        new ParkingSpaceOrderDao().changeState(id, "申请取消", true);
    }

    /**
     * todo 【管理员】确认车位订单已完成
     * 1、车位的状态：'使用中'->'空闲'
     * 2、车位订单状态：'车位租用中'->'完成'
     *
     * @param id
     * @throws SQLException
     */
    public void checkCompleted(String id, int spaceId) throws SQLException {
        ParkingSpaceDao spaceDao = new ParkingSpaceDao();
        ParkingSpaceOrderDao orderDao = new ParkingSpaceOrderDao();
        try {
            DataSourceUtils.startTransaction();
            spaceDao.changeState(spaceId, "空闲", false);
            orderDao.changeState(id, "完成", false);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                DataSourceUtils.commitAndReleaseConnection();
            } catch (SQLException e) {
                throw new SQLException();
            }
        }
    }

    public void createOrder(ParkingSpaceOrder order) throws SQLException {
        ParkingSpaceDao spaceDao = new ParkingSpaceDao();
        ParkingSpaceOrderDao orderDao = new ParkingSpaceOrderDao();
        try {
            DataSourceUtils.startTransaction();
            spaceDao.changeState(order.getSpace_id(), "已被预定", false);
            orderDao.insert(order, false);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e.printStackTrace();
            }
        } finally {
            try {
                DataSourceUtils.commitAndReleaseConnection();
            } catch (SQLException e) {
                throw new SQLException();
            }
        }
    }

    public void checkPaid(String id, int spaceId) throws SQLException {
        ParkingSpaceDao spaceDao = new ParkingSpaceDao();
        ParkingSpaceOrderDao orderDao = new ParkingSpaceOrderDao();
        try {
            DataSourceUtils.startTransaction();
            spaceDao.changeState(spaceId, "使用中", false);
            orderDao.changeState(id, "车位租用中", false);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                DataSourceUtils.commitAndReleaseConnection();
            } catch (SQLException e) {
                throw new SQLException();
            }
        }
    }
}
