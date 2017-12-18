package service;

import dao.DemandDao;
import domain.Demand;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public class DemandService {

    public List<Demand> findAll(User user) throws SQLException {
        DemandDao demandDao = new DemandDao();
        List<Demand> list = null;
        if ("admin".equals(user.getRole())) {
            list = demandDao.findAll();
        } else {
            list = demandDao.findByState("审核通过");
        }
        return list;
    }

    public void makeChecked(String id) throws SQLException {
        DemandDao demandDao = new DemandDao();
        demandDao.changeState(id, "审核通过", true);
    }

    public void createDemand(Demand demand) throws SQLException {
        DemandDao demandDao = new DemandDao();
        demandDao.insert(demand);
    }

    public void cancel(String id) throws SQLException {
        DemandDao demandDao = new DemandDao();
        demandDao.changeState(id, "已取消", true);
    }

    public void delete(String id) throws SQLException {
        DemandDao demandDao = new DemandDao();
        demandDao.delete(id);
    }

    public void checkCompleted(String id) throws SQLException {
        DemandDao demandDao = new DemandDao();
        demandDao.changeState(id, "需求已解决", true);
    }

    public List<Demand> findMine(User user) throws SQLException {
        DemandDao demandDao = new DemandDao();
        return demandDao.findByUserId(user.getId());
    }
}
