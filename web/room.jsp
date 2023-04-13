<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Room?");
			}
		</script>
	</head>
<%@include file="header.jsp"%>
    <body>

       
        <div class="row">
    
<%@include file="menu.jsp"%>
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Room</div>

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation"><a href="#doctorlist">Room List</a></li>
                    <li role="presentation"><a href="#adddoctor">Add Room</a></li>
            </ul>

            <!----------------   Display Room Data List start   --------------->
           
               <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           <td>Room Number</td>
                           <td>Bed No</td>
                           <td>Availability Status</td>
                           <td>Options</td>
                   </tr>
<%!
		int roomNo;
		int bedNo;
		String status;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from room_info order by room_no,bed_no asc",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		roomNo=rs.getInt(1);
		bedNo=rs.getInt(2);
		status=rs.getString(3);
		
%>
                   <tr>
                           <td><%=roomNo%></td>
                           <td><%=bedNo%></td>
                           <td><%=status%></td>
                           <td>
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=roomNo%><%=bedNo%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a href="delete_room_validation.jsp?roomNo=<%=roomNo%>&bedNo=<%=bedNo%>" class="btn btn-danger" onclick="return confirmDelete()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                           
						   </td>
                   </tr>
<%
	}
	rs.first();
	rs.previous();
%>
           
                  </table>
               </div>  
              <!----------------   Display Room Data List ends   --------------->
              
              <!------ Edit Room Modal Start ---------->
                            
<%
	while(rs.next())
	{
		roomNo=rs.getInt(1);
		bedNo=rs.getInt(2);
		status=rs.getString(3);
		
%>   
              <div class="modal fade" id="myModal<%=roomNo%><%=bedNo%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Room Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_room_validation.jsp">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Room No</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="roomNo" value="<%=roomNo%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Bed No</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" name="bedNo" value="<%=bedNo%>" readonly>
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Status</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="status" value="<%=status%>">
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

        
              
              
              <!----------------   Add Room Start   --------------->
               <div id="adddoctor" class="switchgroup">
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form class="form-horizontal" action="add_room_validation.jsp">
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Room No</label>
                                <div class="col-sm-4">
                                  <input type="number" class="form-control" name="roomNo" placeholder="Room Number" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Bed No</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" name="bedNo" placeholder="Bed No" required>
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Availability Status</label>
                                <div class="col-sm-4">
                                   <input type="text" class="form-control" name="status" placeholder="Available" value="available" required readonly>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Add Room Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                   <!----------------   Add Room Ends   --------------->
        </div>
        <!----------------   Panel Body Ends   --------------->
    </div>
    <!-----------  Content Menu Tab Ends   ------------>
</div>
<!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>