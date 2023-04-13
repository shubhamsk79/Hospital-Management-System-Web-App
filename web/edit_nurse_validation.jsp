<%@page import="java.sql.*" %>


<%





        String id=request.getParameter("nurseId");

	String name=request.getParameter("nurseName");

	String email=request.getParameter("email");

	String address=request.getParameter("add");

	String phone=request.getParameter("phone");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update nurse_info set name=?,email=?,address=?,phone=? where id=?");
  
      	ps.setString(1,name);
      	ps.setString(2,email);
      	ps.setString(3,address);
      	ps.setString(4,phone);
      	ps.setInt(5,Integer.parseInt(id));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="nurse.jsp";
}
document.write("<h2>Nurse Details Updated Successfully</h2><br><Br>");
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