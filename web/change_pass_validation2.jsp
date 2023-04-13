<%@page import="java.sql.*"%>
<%
	int id=Integer.parseInt((String)session.getAttribute("id"));
	String opass1=request.getParameter("opass");
	String npass=request.getParameter("npass");
	String cpass=request.getParameter("cpass");
%>
<%
        Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("Select password from patient_info where id=?" );
	ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	rs.next();
	String opass2=rs.getString(1);
	if(opass1.equals(opass2))
	{
		if(npass.equals(cpass))
		{
			ps=c.prepareStatement("Update patient_info set password=? where id=?" );
			ps.setString(1,npass);
			ps.setInt(2,id);
			int i=ps.executeUpdate();
			if(i>0)
			{
%>
			<div style="text-align:center;margin-top:25%">
			<font color="blue">
				<script type="text/javascript">
			function Redirect()
			{	
			    window.location="profile_patient.jsp";
			}
			document.write("<h2>Password Updated Successfully</h2><br><Br>");
			document.write("<h3>Redirecting you to home page....</h3>");
			setTimeout('Redirect()', 3000);
			</script>
			</font>
			</div>
<%
		}
		}
		else
		{
%>
		<div style="text-align:center;margin-top:25%">
		<font color="red">
		<script type="text/javascript">
		function Redirect()
		{	
		    history.back();
		}
		document.write("<h2>New Password And Confirm Password Must Be same</h2><br><Br>");
		document.write("<h3>Redirecting you to Back page....</h3>");
		setTimeout('Redirect()', 3000);
		</script>
		</font>
		</div>
<%
		}
	}
	else
	{
%>
	<div style="text-align:center;margin-top:25%">
	<font color="red">
	<script type="text/javascript">
	function Redirect()
	{	
	    history.back();
	}
	document.write("<h2>Wrong Current Password</h2><br><Br>");
	document.write("<h3>Redirecting you to Back page....</h3>");
	setTimeout('Redirect()', 3000);
	</script>
	</font>
	</div>
<%
		}
	rs.close();	
	ps.close();
%>