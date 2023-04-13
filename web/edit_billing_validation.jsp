<%@page import="java.sql.*" %>


<%



	String billNo=request.getParameter("billNo");


	String id=request.getParameter("patientid");

	String name=request.getParameter("patientname");

	String otherCharge=request.getParameter("otherCharge");

	String pathoCharge=request.getParameter("pathoCharge");

	String miscCharge=request.getParameter("miscCharge");

	String entryDate=request.getParameter("entryDate");

	String disDate=request.getParameter("disDate");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update billing set id_no=?,pname=?,ot_charge=?,pathology=?,misc=?,ent_date=?,dis_date=? where bill_no=?");
  
      	ps.setInt(1,Integer.parseInt(id));
     	ps.setString(2,name);
     	ps.setDouble(3,Double.parseDouble(otherCharge));
     	ps.setDouble(4,Double.parseDouble(pathoCharge));
     	ps.setDouble(5,Double.parseDouble(miscCharge));
     	ps.setString(6,entryDate);
     	ps.setString(7,disDate);
      	ps.setInt(8,Integer.parseInt(billNo));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="billing.jsp";
}
document.write("<h2>Billing Details Updated Successfully</h2><br><Br>");
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