package everything.view;

public class SqlQueryView {
	public static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	public static final String LOCALHOST_URL = "jdbc:mysql://localhost:3306/Everything Iphone";
	public static final String LOCALHOST_USERNAME = "root";
	public static final String LOCALHOST_PASSWORD = "";
	
	
	
	
	public static final String INSERT_USER = "INSERT INTO User"+"(userName, fullName, email, password, city, state, gender, phoneNumber )" +"VALUES (?, ?, ?, ?, ?, ?,?)";
	
	
	}
