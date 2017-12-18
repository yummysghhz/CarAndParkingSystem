package service;

import dao.UserDao;
import domain.User;

import java.sql.SQLException;

public class UserService {
    public User login(String name, String password) throws SQLException {
        UserDao userDao = new UserDao();
        return userDao.findUser(name,password);
    }
}
