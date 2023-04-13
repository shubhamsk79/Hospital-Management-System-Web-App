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
 <%@include file="header.jsp"%>
    <body>
      
        <div class="row">
		
<%@include file="menu.jsp"%>

<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading">Manage Billing Information</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Billing List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Billing Info</a></li>
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
                        <td>Options</td>
                </tr>
<%!
		int billNo,patientId;double pathoCharge,otherCharge,miscCharge;
		String patientName,entryDate,disDate;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString").toLowerCase();
	PreparedStatement ps=c.prepareStatement("select * from billing where pname like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
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
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=billNo%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="delete_billing_validation.jsp?billNo=<%=billNo%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
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
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_billing_validation.jsp" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Billing No:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="billNo" placeholder="Bill Number Auto Generated" readonly>
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">patient Id</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="patientid" placeholder="Patient ID">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">PatientName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="patientname" placeholder="Name" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Pathology Charge</label>
                    <div class="col-sm-10">
                              <input type="text" class="form-control" name="pathoCharge" placeholder="Pathology Charge" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">otherCharge</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="otherCharge" placeholder="Charge" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Misc Charge</label>
                          <div class="col-sm-10">
                              <input type="text" class="form-control" name="miscCharge" placeholder="Misc Charge" required="required">
                          </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Entry Date</label>
                        <div class="col-sm-10">
                          <input type="date" class="form-control" name="entryDate" placeholder="" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Discharge Date</label>
                        <div class="col-sm-10">
                          <input type="date" class="form-control" name="disDate" placeholder="Address" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Billing Info</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
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