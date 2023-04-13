<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete nurse record?");
			}
		</script>
	</head>
<%@include file="header.jsp"%>
    <body>

            

       
        <div class="row">
		
<%@include file="menu.jsp"%>		
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
<!----------------   Menu Tab Start   --------------->
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Nurse</div>
        <!----------------   Panel body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation"><a href="#doctorlist">Nurse List</a></li>
                    <li role="presentation"><a href="#adddoctor">Add Nurse</a></li>
            </ul>

        <!----------------   Display Nurse Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
            <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Nurse ID</td>
                        <td>Nurse Name</td>
                        <td>Email</td>
                        <td>Address</td>
                        <td>Phone No.</td>
                        <td>Options</td>
                </tr>

<%!
		int nurseId;
		String nurseName,email,add,phone;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString").toLowerCase();
	PreparedStatement ps=c.prepareStatement("select * from nurse_info where name like '%"+searchString+"%' or address like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		nurseId=rs.getInt(1);
		nurseName=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(5);
		phone=rs.getString(6);
		
%>                  
                    <tr>
                            <td><%=nurseId%></td>
                            <td><%=nurseName%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=nurseId%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a  href="delete_nurse_validation.jsp?nurseId=<%=nurseId%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
<%
	}
	rs.first();
	rs.previous();
%>                    
            </table>
        </div>
        <!----------------   Display Nurse Data List Ends  --------------->

              <!------ Edit Nurse Modal Start ---------->
                            
<%
	while(rs.next())
	{
		nurseId=rs.getInt(1);
		nurseName=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(5);
		phone=rs.getString(6);
		
%>   
              <div class="modal fade" id="myModal<%=nurseId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Nurse Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_nurse_validation.jsp">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Nurse Id</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="nurseId" value="<%=nurseId%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Name</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" name="nurseName" value="<%=nurseName%>">
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Email</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="email" value="<%=email%>">
                                       </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Address</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="add" value="<%=add%>">
                                       </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Phone</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="phone" value="<%=phone%>">
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
	ps.close();
	rs.close();
%>
<!----------------   Modal ends here  --------------->
        <!----------------   Add Nurse Start   --------------->
        <div id="adddoctor" class="switchgroup">
            <div class="panel panel-default">
                <div class="panel-body">
                <form class="form-horizontal" action="add_nurse_validation.jsp">
                    
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Nurse Id:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="id" placeholder="Nurse ID auto generated" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                             <input type="text" class="form-control" name="name" placeholder="Name">
                        </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                          <input type="Email" class="form-control" name="email" placeholder="Email">
                      </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="address" placeholder="Address">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Phone No.">
                        </div>
                   </div>

                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Nurse</button>
                          </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
        <!----------------   Add Nurse Ends   --------------->
        </div>
        <!----------------   Panel body Ends   --------------->
    </div>
<!----------------   Menu Tab Ends   --------------->
    </div>
<!---- Content Ares Ends  -------->
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>