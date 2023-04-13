<%@page import="java.sql.*" %>


<%



        String id=request.getParameter("id");

	String name=request.getParameter("name");

	String email=request.getParameter("email");

	String password=request.getParameter("password");

	String address=request.getParameter("address");

	String phone=request.getParameter("phone");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into nurse_info(name,email,password,address,phone) values(?,?,?,?,?)");
  
      	ps.setString(1,name);
      	ps.setString(2,email);
      	ps.setString(3,password);
      	ps.setString(4,address);
      	ps.setString(5,phone);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:30%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="nurse.jsp";
}
document.write("<h2>Nurse Information Added Successfully</h2><br><Br>");
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