package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {

    // Method to establish and return a connection
    public static Connection DBHelperConnection(String dbURL, String username, String password) throws ClassNotFoundException, SQLException {
        // Register MySQL JDBC driver for versions 8.0 and higher
        Class.forName("com.mysql.jdbc.Driver");

        // Create a connection object using the provided dbURL, username, and password
        Connection connection = DriverManager.getConnection(dbURL, username, password);

        return connection;
    }
}
