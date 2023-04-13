<%@page import="java.sql.*" %>


<%





        String email=request.getParameter("email");

	String name=request.getParameter("name");

	String gender=request.getParameter("gender");

	String add=request.getParameter("address");

	String phone=request.getParameter("phone");

	String desig=request.getParameter("desig");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update staffinfo set name=?,sex=?,address=?,phno=? where email=? and desig=?");
  
      	ps.setString(1,name);
      	ps.setString(2,gender);
     	ps.setString(3,add);
     	ps.setString(4,phone);
     	ps.setString(5,email);
     	ps.setString(6,desig);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="profile.jsp";
}
document.write("<h2><%=desig.toUpperCase()%> Details Updated Successfully</h2><br><Br>");
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