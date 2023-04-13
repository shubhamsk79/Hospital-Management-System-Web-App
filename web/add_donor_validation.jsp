<%@page import="java.sql.*" %>


<%



        String id=request.getParameter("donorid");

	String name=request.getParameter("donorname");

	String gender=request.getParameter("gender");

	String age=request.getParameter("age");

	String email=request.getParameter("email");

	String phone=request.getParameter("phone");

	String add=request.getParameter("add");

	String bgroup=request.getParameter("bgroup");

	String ddate=request.getParameter("ddate");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into blooddonor(name,sex,age,email,phone,addr,b_group,d_date) values(?,?,?,?,?,?,?,?)");
  
      	ps.setString(1,name);
      	ps.setString(2,gender);
     	ps.setInt(3,Integer.parseInt(age));
     	ps.setString(4,email);
     	ps.setString(5,phone);
     	ps.setString(6,add);
     	ps.setString(7,bgroup);
     	ps.setString(8,ddate);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="donor.jsp";
}
document.write("<h2>Donor Information Added Successfully</h2><br><Br>");
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