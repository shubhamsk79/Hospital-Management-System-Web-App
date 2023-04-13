<%@page import="java.sql.*"%>
<%	
	String roomNo=request.getParameter("roomNo");
%>		
<%
         Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select bed_no,status from room_info where room_no=?");
	ps.setString(1,roomNo);
	ResultSet rs=ps.executeQuery();
%>
<select class="form-control" name="bed_no">
<option selected="selected">Select Bed</option>
<%
	while(rs.next())
	{
		int bedNo=rs.getInt(1);
		String status=rs.getString(2);
		if(status.equals("available"))
		{
%>
		<option value="<%=bedNo%>"><%=bedNo%></option>
<%
		}
	}
%>
	</select>
<%
	rs.close();
	ps.close();
%>