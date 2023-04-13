<%@page import="java.sql.*" %>


<%



        String deptName=request.getParameter("deptName");

	String deptDesc=request.getParameter("deptDesc");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into department(name,description) values(?,?)");
  
      	ps.setString(1,deptName);
      	ps.setString(2,deptDesc);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:35%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="department.jsp";
}
document.write("<h2>Department Added Successfully</h2><br><Br>");
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