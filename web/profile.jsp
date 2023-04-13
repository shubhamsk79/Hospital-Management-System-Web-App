<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
 <%@include file="header.jsp"%>
    <body>

       
        <div class="row">
		
<%@include file="menu.jsp"%>
       
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    
    <!----------------   Menu Tab   --------------->
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Update Profile</div>
        <!----------------   Panel body Start   --------------->
<%
	String email=(String)session.getAttribute("email");
	String role=(String)session.getAttribute("role");
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from staffinfo where email=? and desig=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ps.setString(1,email);
	ps.setString(2,role);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String name=rs.getString(2);
		String gender=rs.getString(3);
		String add=rs.getString(4);
		String phone=rs.getString(5);
		String desig=rs.getString(6);
		
%> 
            <div class="panel-body">
                <form class="form-horizontal" action="edit_staff_validation.jsp">

                    <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                              <input type="email" class="form-control" name="email" value="<%=email%>" readonly placeholder="Email">
                            </div>
                     </div>

                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" value="<%=name%>" placeholder="Name">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                              <select name="gender" class="form-control">
					<option selected><%=gender%></option>
					<option>Male</option>
					<option>Female</option>
				</select>
                            </div>
                     </div>

                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="address" value="<%=add%>" placeholder="Address">
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Phone No.">
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Designation</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="desig" value="<%=desig%>" placeholder="Designation" readonly>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Update Profile</button>
                            </div>
                    </div>
                </form>															
            </div>
<%
	}
	rs.close();
	ps.close();	
%>
                        <!----------------   Panel body Ends   --------------->
    </div>
 <div class="panel panel-default contentinside">
        <div class="panel-heading">Add New Admin</div>
        <!----------------   Panel body Start   --------------->
            <div class="panel-body">
                <form class="form-horizontal" action="add_staff_validation.jsp">
                    <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                              <input type="email" class="form-control" name="email" placeholder="Email">
                            </div>
                     </div>

                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="Name">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                              <select name="gender" class="form-control">
					<option>Male</option>
					<option>Female</option>
				</select>
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
                            <label  class="col-sm-2 control-label">Designation</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="desig" value="admin" readonly placeholder="Designation">
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control" name="pass" placeholder="Password">
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Add New Admin Profile</button>
                            </div>
                    </div>
                </form>															
            </div>
                        <!----------------   Panel body Ends   --------------->
    </div>							
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Change Password</div>
        <!----------------   Panel body Start   --------------->
        <div class="panel-body">
            <form class="form-horizontal" action="change_pass_validation.jsp">
                <div class="form-group">
                       <label class="col-sm-2 control-label">Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="opass" placeholder="Current Password">
                       </div>
                </div>
                <div class="form-group">
                       <label class="col-sm-2 control-label">New Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="npass" placeholder="Enter New Password">
                       </div>
                </div>
                <div class="form-group">
                       <label class="col-sm-2 control-label">Confirm New Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="cpass" placeholder="Confirm New Password">
                       </div>
                </div>
                <div class="form-group">
                       <div class="col-sm-offset-2 col-sm-10">
                       <button type="submit" class="btn btn-primary">Update Password</button>
                       </div>
               </div>
            </form>
        </div>
        <!----------------   Panel body Ends   --------------->
    </div>
    </div>
            
    </div>
</div>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>