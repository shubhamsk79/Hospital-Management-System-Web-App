<%@page import="java.sql.*" %>


<%





        String doctid=request.getParameter("doctid");

	String doctname=request.getParameter("doctname");

	String email=request.getParameter("email");

	String pwd=request.getParameter("pwd");

	String add=request.getParameter("add");

	String phone=request.getParameter("phone");

	String dept=request.getParameter("dept");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update doctor_info set name=?,email=?,password=?,address=?,phone=?,deptname=? where id=?");
  
      	ps.setString(1,doctname);
      	ps.setString(2,email);
     	ps.setString(3,pwd);
     	ps.setString(4,add);
     	ps.setString(5,phone);
     	ps.setString(6,dept);
     	ps.setString(7,doctid);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="doctor.jsp";
}
document.write("<h2>Doctor Details Updated Successfully</h2><br><Br>");
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