package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
public class ConnectionDao implements ServletContextListener
{
	public void contextInitialized(ServletContextEvent e)
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
			c.setHoldability(ResultSet.CLOSE_CURSORS_AT_COMMIT); 
			ServletContext ctx=e.getServletContext();
			ctx.setAttribute("connection",c);
		}	
		catch(Exception ee){ee.printStackTrace();}
	}
	public void contextDestroyed(ServletContextEvent e)
	{}
}