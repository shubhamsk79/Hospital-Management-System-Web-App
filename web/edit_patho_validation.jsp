<%@page import="java.sql.*" %>


<%





        String patientid=request.getParameter("patientid");

	String patientname=request.getParameter("patientname");

	String xray=request.getParameter("xray");

	String usound=request.getParameter("usound");

	String bt=request.getParameter("bt");

	String ctscan=request.getParameter("ctscan");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update pathology set pname=?,x_rays=?,u_sound=?,b_test=?,ct_scan=? where id=?");
  
      	ps.setString(1,patientname);
      	ps.setString(2,xray);
     	ps.setString(3,usound);
     	ps.setString(4,bt);
     	ps.setString(5,ctscan);
     	ps.setInt(6,Integer.parseInt(patientid));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="pathology.jsp";
}
document.write("<h2>Pathology Details Updated Successfully</h2><br><Br>");
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