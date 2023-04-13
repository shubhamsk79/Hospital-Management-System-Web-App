<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Billing Info?");
			}
		</script>
	</head>
 <%@include file="header_patient.jsp"%>
    <body>
      
        <div class="row">
		
<%@include file="menu_patient.jsp"%>

<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading">My Billing Information</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Billing List</a></li>
                        </ul>

    <!----------------   Display Billing Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Bill No</td>
                        <td>Patient ID</td>
                        <td>Patient Name</td>
                        <td>Pathology</td>
                        <td>Other Charge</td>
                        <td>Misc Charge</td>
                        <td>Entry Date</td>
                        <td>Discharge Date</td>
                </tr>
<%!
		int billNo,patientId;double pathoCharge,otherCharge,miscCharge;
		String patientName,entryDate,disDate;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	int id=Integer.parseInt((String)session.getAttribute("id"));
	PreparedStatement ps=c.prepareStatement("select * from billing where id_no=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ps.setInt(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>                
                    <tr>
                            <td><%=billNo%></td>
                            <td><%=patientId%></td>
                            <td><%=patientName%></td>
                            <td><%=pathoCharge%></td>
                            <td><%=otherCharge%></td>
                            <td><%=miscCharge%></td>
                            <td><%=entryDate%></td>
                            <td><%=disDate%></td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
                    </c:forEach>
        </table>
        </div>
    <!----------------   Display Billing Data List Ends  --------------->
   
    <!------ Billing Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>              
              <div class="modal fade" id="myModal<%=billNo%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Billing Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_billing_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Bill Number:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="billNo" placeholder="Bill Number" value="<%=billNo%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientid" value="<%=patientId%>" placeholder="Patient Id" >
                                </div>
                                </div>


                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientname" value="<%=patientName%>" placeholder="Name" >
                                </div>
                                </div>


                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Charge</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="otherCharge" value="<%=otherCharge%>" placeholder="Other Charge" >
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Pathology</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="pathoCharge" value="<%=pathoCharge%>" placeholder="pathology" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">misc Charge</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="miscCharge" value="<%=miscCharge%>" placeholder="Misc Charge" >
                                      </div>
                                </div>

                      <div class="form-group">
                        <label  class="col-sm-2 control-label">Entry Date</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="entryDate" value="<%=entryDate%>" placeholder="Entry" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Discharge Date</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="disDate" value="<%=disDate%>" placeholder="Discharge Date" >
                        </div>
                    </div>
              

                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Update"></button>
                                 </div>
                            </form>
                             </div>
                         </div>
                         </div>
                    </div>
                 </div>
               </div>
<%
	}
%>
<!----------------   Modal ends here  --------------->


    <!----------------   Add Billing Info Start   --------------->
                           <!----------------   Add Billing Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>