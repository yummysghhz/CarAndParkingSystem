package service;

import dao.ParkingSpaceDao;
import domain.ParkingSpace;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public class ParkingSpaceService {
    public List<ParkingSpace> findAll(User user) throws SQLException {
        ParkingSpaceDao spaceDao = new ParkingSpaceDao();
        List<ParkingSpace> list = null;
        if ("admin".equals(user.getRole())) {
            list = spaceDao.findAll();
        } else {
            list = spaceDao.findByState("空闲");
        }
        return list;
    }
}
