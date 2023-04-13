<%@page import="java.sql.*" %>


<%




        String deptId=request.getParameter("deptId");

 
        String deptName=request.getParameter("deptName");

	String deptDesc=request.getParameter("deptDesc");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update department set name=?,description=? where id=?");
  
      	ps.setString(1,deptName);
      	ps.setString(2,deptDesc);
      	ps.setString(3,deptId);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="department.jsp";
}
document.write("<h2>Department Details Updated Successfully</h2><br><Br>");
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