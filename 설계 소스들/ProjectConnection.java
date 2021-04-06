package examples;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ProjectConnection {
	public static Connection getCon() throws SQLException{
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; //?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			con=DriverManager.getConnection(url, "projectuser", "projectuser123!");
			return con;
		}catch(ClassNotFoundException ce){
			System.out.println(ce.getMessage());
			return null;
		}
	}
}