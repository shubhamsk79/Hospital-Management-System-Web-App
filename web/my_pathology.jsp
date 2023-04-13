		<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Pathology Information?");
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
                <div class="panel-heading">MY Pathology Info</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Pathology List</a></li>
                        </ul>

    <!----------------   Display Pathology Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Patient Id</td>
                        <td>Patient Name</td>
                        <td>XRay</td>
                        <td>UltraSound</td>
                        <td>Blood Test</td>
                        <td>CTScan</td>
                </tr>
<%!
		int id;
		String name;	
		String xray,usound,bt,ctscan;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	id=Integer.parseInt((String)session.getAttribute("id"));
	PreparedStatement ps=c.prepareStatement("select * from pathology where id=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ps.setInt(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		xray=rs.getString(1);
		usound=rs.getString(2);
		bt=rs.getString(3);
		ctscan=rs.getString(4);
		name=rs.getString(5);
		id=rs.getInt(6);
		
%>                
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=xray%></td>
                            <td><%=usound%></td>
                            <td><%=bt%></td>
                            <td><%=ctscan%></td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
                    </c:forEach>
        </table>
        </div>
    <!----------------   Display Pathology Data List Ends  --------------->
   
    <!------ Pathology Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		xray=rs.getString(1);
		usound=rs.getString(2);
		bt=rs.getString(3);
		ctscan=rs.getString(4);
		name=rs.getString(5);
		id=rs.getInt(6);
		
%>              
              <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Doctor Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_patho_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="patientid" placeholder="Patient ID" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientname" value="<%=name%>" placeholder="Name" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">X-Ray</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="xray" value="<%=xray%>" placeholder="X-Ray" >
                                      </div>
                                </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">UltraSound</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="usound" value="<%=usound%>" placeholder="UltraSound" >
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Blood Test</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="bt" value="<%=bt%>" placeholder="Blood Test" >
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">CT-Scan</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="ctscan" value="<%=ctscan%>" placeholder="CT-Scan" >
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


    <!----------------   Add Pathology Info Start   --------------->
                           <!----------------   Add Pathology Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>