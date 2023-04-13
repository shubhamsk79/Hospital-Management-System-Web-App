<%@page import="java.sql.*" %>


<%



        String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bedNo");

	String status=request.getParameter("status");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into room_info values(?,?,?)");
  
      	ps.setInt(1,Integer.parseInt(roomNo));
      	ps.setInt(2,Integer.parseInt(bedNo));
      	ps.setString(3,status);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:35%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="room.jsp";
}
document.write("<h2>Room with Bed Added Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
<%
	}

	ps.close();
	con.commit();	
%>