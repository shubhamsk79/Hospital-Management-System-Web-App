<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Doctor?");
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
                <div class="panel-heading">Manage Doctor</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Doctor List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Doctor</a></li>
                        </ul>

    <!----------------   Display Doctor Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Doctor ID</td>
                        <td>Doctor Name</td>
                        <td>Email</td>
                        <td>Address</td>
                        <td>Phone No.</td>
                        <td>Department</td>
                        <td>Options</td>
                </tr>
<%!
		int deptId;
		String deptName;	
		int id;
		String name,email,pwd,add,phone,dept;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString").toLowerCase();
	PreparedStatement ps=c.prepareStatement("select * from doctor_info where name like '%"+searchString+"%' or deptname like '%"+searchString+"%' or address like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(5);
		phone=rs.getString(6);
		dept=rs.getString(7);
		
%>                
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td><%=dept%></td>
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="delete_doct_validation.jsp?doctId=<%=id%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
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
    <!----------------   Display Doctor Data List Ends  --------------->
   
    <!------ Doctor Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		email=rs.getString(3);
		pwd=rs.getString(4);
		add=rs.getString(5);
		phone=rs.getString(6);
		dept=rs.getString(7);
		
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
                             <form class="form-horizontal" action="edit_doct_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Doctor Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="doctid" placeholder="Doctor ID" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="doctname" value="<%=name%>" placeholder="Name" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" value="<%=email%>" placeholder="Email" >
                                      </div>
                                </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-10">
                            <input type="password" class="form-control" name="pwd" value="<%=pwd%>" placeholder="Password" >
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" value="<%=add%>" placeholder="Address" >
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Phone No." >
                        </div>
                    </div>
              
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="dept">
                        <option selected="selected"><%=dept%></option>
                        
                        <option> Neurology</option>
                   
                              
                        </select>
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


    <!----------------   Add Doctor Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_doctor_validation.jsp" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Doctor Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="doctid" placeholder="Doctor ID Auto Generated" readonly>
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="doctname" placeholder="Name" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Email</label>
                          <div class="col-sm-10">
                              <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                          </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-10">
                            <input type="password" class="form-control" name="pwd" placeholder="Password" required="required">
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" placeholder="Address" required="required">
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Phone No." required="required">
                        </div>
                    </div>
                 
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="dept">
 <option selected="selected">Select Department</option>
<%
	ps=c.prepareStatement("select * from department",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		deptId=rs.getInt(1);
		deptName=rs.getString(2);
%>		                       
                        
                          <option value="<%=deptName%>"><%=deptName%>(<%=deptId%>)</option>
<%
	}
%>
                                                           
                        </select>
                        </div>
                    </div>


                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Doctor</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------   Add Doctor Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>