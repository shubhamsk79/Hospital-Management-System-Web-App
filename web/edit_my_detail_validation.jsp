<%@page import="java.sql.*" %>


<%





        String pid=request.getParameter("patientid");

	String pname=request.getParameter("patientname");

	String email=request.getParameter("email");

	String add=request.getParameter("add");

	String phone=request.getParameter("phone");

	String rov=request.getParameter("rov");

	String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bed_no");

	String doct=request.getParameter("doct");

	String gender=request.getParameter("gender");

	String joindate=request.getParameter("admit_date");

	String age=request.getParameter("age");

	String bgroup=request.getParameter("bgroup");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update patient_info set pname=?,gender=?,age=?,bgroup=?,phone=?,rea_of_visit=?,room_no=?,bed_no=?,doc_name=?,date_ad=?,email=?,address=? where id=?");
  
      	ps.setString(1,pname);
      	ps.setString(2,gender);
     	ps.setInt(3,Integer.parseInt(age));
     	ps.setString(4,bgroup);
     	ps.setString(5,phone);
     	ps.setString(6,rov);
      	ps.setInt(7,Integer.parseInt(roomNo));
      	ps.setInt(8,Integer.parseInt(bedNo));
      	ps.setString(9,doct);
      	ps.setString(10,joindate);
      	ps.setString(11,email);
      	ps.setString(12,add);
      	ps.setInt(13,Integer.parseInt(pid));
	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="patient_page.jsp";
}
document.write("<h2>Details Updated Successfully</h2><br><Br>");
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