<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Donor?");
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
                <div class="panel-heading">Manage Donor</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Donor List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Donor</a></li>
                        </ul>

    <!----------------   Display Donor Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Donor ID</td>
                        <td>Donor Name</td>
                        <td>Gender</td>
                        <td>Age</td>
                        <td>Email</td>
                        <td>Phone</td>
                        <td>Address</td>
                        <td>Blood Group</td>
                        <td>Donation Date</td>
                        <td>Options</td>
                </tr>
<%!
		int donorId,age;
		String donorName;	
		String gender,email,phone,add,bgroup,donationDate;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString").toLowerCase();
	PreparedStatement ps=c.prepareStatement("select * from blooddonor where name like '%"+searchString+"%' or addr like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		donorId=rs.getInt(1);
		donorName=rs.getString(2);
		gender=rs.getString(3);
		age=rs.getInt(4);
		email=rs.getString(5);
		phone=rs.getString(6);
		add=rs.getString(7);
		bgroup=rs.getString(8);
		donationDate=rs.getString(9);
		
%>                
                    <tr>
                            <td><%=donorId%></td>
                            <td><%=donorName%></td>
                            <td><%=gender%></td>
                            <td><%=age%></td>
                            <td><%=email%></td>
                            <td><%=phone%></td>
                            <td><%=add%></td>
                            <td><%=bgroup%></td>
                            <td><%=donationDate%></td>
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=donorId%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="delete_donor_validation.jsp?donorId=<%=donorId%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
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
		donorId=rs.getInt(1);
		donorName=rs.getString(2);
		gender=rs.getString(3);
		age=rs.getInt(4);
		email=rs.getString(5);
		phone=rs.getString(6);
		add=rs.getString(7);
		bgroup=rs.getString(8);
		donationDate=rs.getString(9);
		
%>              
              <div class="modal fade" id="myModal<%=donorId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Donor Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_donor_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Donor Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="donorid" placeholder="Donor ID" value="<%=donorId%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Donor Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="donorname" value="<%=donorName%>" placeholder="Donor Name" >
                                </div>
                                </div>


                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Gender</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="gender" value="<%=gender%>" placeholder="Gender" >
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Age</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="age" value="<%=age%>" placeholder="Age" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" value="<%=email%>" placeholder="Email" >
                                      </div>
                                </div>

                      <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Phone No." >
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" value="<%=add%>" placeholder="Address" >
                        </div>
                    </div>
              
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">BloodGroup</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="bgroup">
                        <option selected="selected"><%=bgroup%></option>
                        
                        <option> B+</option>
                        <option> AB+</option>
                        <option> O-</option>
                        <option> O+</option>
                        <option> A-</option>
                        <option> A+</option>
                   
                              
                        </select>
                        </div>
                    </div>                                                        

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Donation Date</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="ddate" value="<%=donationDate%>" placeholder="Donation Date" >
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


    <!----------------   Add Donor Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_donor_validation.jsp" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Donor Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="donorid" placeholder="Donor ID Auto Generated" readonly>
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="donorname" placeholder="Name" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Gender</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="gender">
                        <option selected="selected">Male</option>                        
                        <option>Female</option>                                                
                        </select>
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Age</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="age" placeholder="Age" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Email</label>
                          <div class="col-sm-10">
                              <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                          </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Phone No." required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" placeholder="Address" required="required">
                        </div>
                    </div>
                 
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Blood Group</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="bgroup">
			 <option selected="selected">Select Blood Group</option>
                        <option> B+</option>
                        <option> B-</option>
                        <option> AB+</option>
                        <option> O-</option>
                        <option> O+</option>
                        <option> A-</option>
                        <option> A+</option>
                                                           
                        </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Donation Date</label>
                        <div class="col-sm-10">
                          <input type="date" class="form-control" name="ddate" placeholder="Donation Date" required="required">
                        </div>
                    </div>


                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Donor</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------   Add Donor Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>