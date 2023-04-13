<%@page import="java.sql.*" %>


<%


        String doctId=request.getParameter("doctId");

 
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("delete from doctor_info where id=?");
  
      	ps.setString(1,doctId);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="red">
<script type="text/javascript">
function Redirect()
{
    window.location="doctor.jsp";
}
document.write("<h2>Doctor Removed Successfully</h2><br><Br>");
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