<%@page import="java.sql.*" %>


<%





        String email=request.getParameter("email");

	String name=request.getParameter("name");

	String gender=request.getParameter("gender");

	String add=request.getParameter("address");

	String phone=request.getParameter("phone");

	String desig=request.getParameter("desig");

	String pass=request.getParameter("pass");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into staffinfo values(?,?,?,?,?,?,?)");
  
      	ps.setString(1,email);
      	ps.setString(2,name);
      	ps.setString(3,gender);
     	ps.setString(4,add);
     	ps.setString(5,phone);
     	ps.setString(6,desig);
     	ps.setString(7,pass);

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
document.write("<h2>New <%=desig.toUpperCase()%> Added Successfully</h2><br><Br>");
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