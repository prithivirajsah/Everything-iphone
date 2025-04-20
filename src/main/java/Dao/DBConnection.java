package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import everything.view.SqlQueryView;

public class DBConnection {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName(SqlQueryView.DRIVER_NAME);
		return DriverManager.getConnection(SqlQueryView.LOCALHOST_URL, SqlQueryView.LOCALHOST_USERNAME,
				SqlQueryView.LOCALHOST_PASSWORD);
	}
}