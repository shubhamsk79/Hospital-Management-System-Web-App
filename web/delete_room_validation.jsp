<%@page import="java.sql.*" %>


<%


        String deptId=request.getParameter("deptId");

 

        String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bedNo");

	String status=request.getParameter("status");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("delete from room_info where room_no=? and bed_no=? and status=?");
  
      	ps.setInt(1,Integer.parseInt(roomNo));
      	ps.setInt(2,Integer.parseInt(bedNo));
      	ps.setString(3,"available");

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
document.write("<h2>Room with Bed Removed Successfully</h2><br><Br>");
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
document.write("<h2>Room Not Deleted. Room Status must be Available</h2><br><Br>");
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