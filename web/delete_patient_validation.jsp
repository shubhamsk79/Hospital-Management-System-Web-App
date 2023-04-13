<%@page import="java.sql.*" %>


<%


        String patientId=request.getParameter("patientId");

 
        String roomNo=request.getParameter("roomNo");

 
        String bedNo=request.getParameter("bedNo");

 
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("delete from patient_info where id=?");
  
      	ps.setString(1,patientId);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
		ps=con.prepareStatement("update room_info set status=? where room_no=? and bed_no=?");
		ps.setString(1,"available");
      		ps.setInt(2,Integer.parseInt(roomNo));
	      	ps.setInt(3,Integer.parseInt(bedNo)); 
		ps.executeUpdate();
%>
<div style="text-align:center;margin-top:25%">
<font color="red">
<script type="text/javascript">
function Redirect()
{
    window.location="patients.jsp";
}
document.write("<h2>Patient Removed Successfully</h2><br><Br>");
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