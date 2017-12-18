package service;

import dao.CarOrderDao;
import dao.CarPriceDao;
import domain.CarOrder;
import domain.CarPrice;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class CarOrderService {

    public List<CarOrder> findAll() throws SQLException {
        CarOrderDao orderDao = new CarOrderDao();
        List<CarOrder> list = null;
        list = orderDao.findAll();
        return list;
    }

    public void createRentingMsg(CarOrder order) throws SQLException {
        CarPriceDao priceDao = new CarPriceDao();
        CarOrderDao orderDao = new CarOrderDao();

        try {
            DataSourceUtils.startTransaction();
            CarPrice carPrice = priceDao.getCurrentCarPrice(false);

            order.setSubscription_price(carPrice.getSubscription_price());
            order.setOil_price(carPrice.getOil_price());

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

    public void makeChecked(String id) throws SQLException {
        CarOrderDao orderDao = new CarOrderDao();
        orderDao.changeState(id, "审核通过", true);
    }

    public void checkPaid(String id) throws SQLException {
        CarOrderDao orderDao = new CarOrderDao();
        orderDao.changeState(id, "待确认", true);
    }

    public void applyOrder(String id, int userId) throws SQLException {
        CarOrderDao orderDao = new CarOrderDao();
        orderDao.applyOrder(id, "待付款", userId, true);
    }

    public void checkCompleted(String id) throws SQLException {
        CarOrderDao orderDao = new CarOrderDao();
        orderDao.changeState(id, "完成", true);
    }
}
