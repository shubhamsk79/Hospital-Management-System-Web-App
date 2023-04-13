<%@page import="java.sql.*"%>
<%
	String email=(String)session.getAttribute("email");
	String opass1=request.getParameter("opass");
	String npass=request.getParameter("npass");
	String cpass=request.getParameter("cpass");
%>
<%
        Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("Select password from staffinfo where email=?" );
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	rs.next();
	String opass2=rs.getString(1);
	if(opass1.equals(opass2))
	{
		if(npass.equals(cpass))
		{
			ps=c.prepareStatement("Update staffinfo set password=? where email=?" );
			ps.setString(1,npass);
			ps.setString(2,email);
			int i=ps.executeUpdate();
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