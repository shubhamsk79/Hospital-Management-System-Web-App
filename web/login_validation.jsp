<%@page import="java.sql.*"%>
<%
PreparedStatement ps=null;
ResultSet rs=null;
%>
<%	
	String role=request.getParameter("userrole");
	String email=request.getParameter("email");
        String password=request.getParameter("password");
%>		
<%
        Connection c=(Connection)application.getAttribute("connection");
	if(role.equals("admin"))
	{
		ps=c.prepareStatement("select * from staffinfo where email=? and password=? and desig=?");
		ps.setString(1,email);
		ps.setString(2,password);
		ps.setString(3,role);
		rs=ps.executeQuery();
		if(rs.next())
		{
			String name=rs.getString(2);
			session.setAttribute("email",email);
			session.setAttribute("role",role);
			session.setAttribute("name",name);
                        response.sendRedirect("admin.jsp");
		}
		else
			response.sendRedirect("login_failed.jsp");
	}
	else
	{
		ps=c.prepareStatement("select * from patient_info where email=? and password=?");
		ps.setString(1,email);
		ps.setString(2,password);
		rs=ps.executeQuery();
		if(rs.next())
		{
			String id=rs.getString(1);
			String name=rs.getString(2);
			String doc=rs.getString(10);
			session.setAttribute("id",id);
			session.setAttribute("email",email);
			session.setAttribute("role",role);
			session.setAttribute("name",name);
			session.setAttribute("doc",doc);
                        response.sendRedirect("patient_page.jsp");
		}
		else
			response.sendRedirect("login_failed.jsp");
	}
	rs.close();
	ps.close();
%>