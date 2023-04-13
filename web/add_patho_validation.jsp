<%@page import="java.sql.*" %>


<%



        String patientid=request.getParameter("patientid");

	String patientname=request.getParameter("patientname");

	String xray=request.getParameter("xray");

	String usound=request.getParameter("usound");

	String bt=request.getParameter("bt");

	String ctscan=request.getParameter("ctscan");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into pathology values(?,?,?,?,?,?)");
  
     	ps.setString(1,xray);
     	ps.setString(2,usound);
     	ps.setString(3,bt);
     	ps.setString(4,ctscan);
      	ps.setString(5,patientname);
      	ps.setInt(6,Integer.parseInt(patientid));


	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="pathology.jsp";
}
document.write("<h2>Pahology Information Added Successfully</h2><br><Br>");
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