package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<>();

    public static DataSource getDataSource() {
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = threadLocal.get();
        if (conn == null) {
            conn = dataSource.getConnection();
            threadLocal.set(conn);
        }
        return conn;
    }

    /**
     * todo 开启事务，手动关闭
     *
     * @throws SQLException
     */
    public static void startTransaction() throws SQLException {
        getConnection().setAutoCommit(false);
    }

    /**
     * todo (失败后)事务回滚
     *
     * @throws SQLException
     */
    public static void rollback() throws SQLException {
        getConnection().rollback();
    }

    /**
     * todo 把connection放回连接池
     *
     * @throws SQLException
     */
    public static void commitAndReleaseConnection() throws SQLException {
        getConnection().commit();
        getConnection().close();
        threadLocal.remove();
    }
}
