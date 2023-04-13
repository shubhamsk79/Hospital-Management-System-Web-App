<%@page import="java.sql.*" %>


<%



 

        String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bedNo");

	String status=request.getParameter("status");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update room_info set status=? where room_no=? and bed_no=?");
  
      	ps.setString(1,status);
      	ps.setInt(2,Integer.parseInt(roomNo));
      	ps.setInt(3,Integer.parseInt(bedNo));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="room.jsp";
}
document.write("<h2>Room with Bed Updated Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
<%
	}
	else
	{
%>
<div style="text-align:center;margin-top:25%">
<font color="red">
<script type="text/javascript">
function Redirect()
{
    window.location="room.jsp";
}
document.write("<h2>Room Not Updated. Room Status must be Available</h2><br><Br>");
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