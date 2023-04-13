<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Patient?");
			}
		</script>
		  <script src="validation.js"></script>
	</head>
<%@include file="header.jsp"%>
    <body>
       
        <div class="row">
		
<%@include file="menu.jsp"%>
				<!---- Content Ares Start  -------->
				<div class="col-md-10 maincontent" >
			<!----------------   Menu Tab   --------------->
					
							<div class="panel panel-default contentinside">
								<div class="panel-heading">Manage Patient</div>
								<!----------------   Panel body Start   --------------->
								<div class="panel-body">
									<ul class="nav nav-tabs doctor">
										<li role="presentation"><a href="#doctorlist">Patient List</a></li>
										<li role="presentation"><a href="#adddoctor">Add Patient</a></li>

									</ul>
							
						
										<!----------------   Display Patients Data List Start  --------------->
										<div id="doctorlist" class="switchgroup">
											<table class="table table-bordered table-hover">
												<tr class="active">
													<td>#</td>
													<td>Patient Name</td>
													<td>Age</td>
													<td>Sex</td>
													<td>Phone</td>
													<td>Reason Of Visit</td>
	                                                   						 <td>Blood Grp</td>
        	                                            						<td>Date Of Admit</td>
													<td>Room No</td>
													<td>Bed No</td>
													<td>Observed By</td>
													<td>Address</td>
													<td>Options</td>
													
												</tr>
<%!
		int doctId;
		String doctName;	
		int id,age,room_no,bed_no;
		String name,gender,bgroup,phone,rov,doc_name,admit_date,add,email;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString").toLowerCase();
	PreparedStatement ps=c.prepareStatement("select * from patient_info where pname like '%"+searchString+"%' or room_no like '%"+searchString+"%' or address like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		gender=rs.getString(3);
		age=rs.getInt(4);
		bgroup=rs.getString(5);
		phone=rs.getString(6);
		rov=rs.getString(7);
		room_no=rs.getInt(8);
		bed_no=rs.getInt(9);
		doc_name=rs.getString(10);
		admit_date=rs.getString(11);
		add=rs.getString(14);
	
%>          
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=age%></td>
				<td><%=gender%></td>
				<td><%=phone%></td>
                                <td><%=rov%></sup></td>
                                 <td><%=bgroup%></td>
                                 <td><%=admit_date%></td>
                                 <td><%=room_no%></td>
                                 <td><%=bed_no%></td>
                                 <td><%=doc_name%></td>
                                 <td><%=add%></td>
								<td>
								<a  href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
			                            	<a  href="delete_patient_validation.jsp?patientId=<%=id%>&roomNo=<%=room_no%>&bedNo=<%=bed_no%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>	
								</td>
			</tr>
<%
	}
	rs.first();
	rs.previous();
%>
												
											</table>
										</div>
						<!----------------   Display Patient Data List Ends  --------------->
				
					   <!------ Patient Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		gender=rs.getString(3);
		age=rs.getInt(4);
		bgroup=rs.getString(5);
		phone=rs.getString(6);
		rov=rs.getString(7);
		room_no=rs.getInt(8);
		bed_no=rs.getInt(9);
		doc_name=rs.getString(10);
		admit_date=rs.getString(11);
		email=rs.getString(12);
		add=rs.getString(14);
		
%>              
              <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Patient Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_patient_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="patientid" placeholder="Patient ID" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientname" value="<%=name%>" placeholder="Name" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" value="<%=email%>" placeholder="Email" >
                                      </div>
                                </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Address</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="add" value="<%=add%>" placeholder="Address" >
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Phone" >
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Reason Of Visit</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="rov" value="<%=rov%>" placeholder="Reason Of Visit" >
                        </div>
                    </div>
              
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Room Number</label>
                        <div class="col-sm-10">
                        <select class="form-control" name="roomNo" id="roomNo<%=id%>" onchange="retrieveBeds2('<%=id%>')">
                        <option selected="selected"><%=room_no%></option>
<%! int roomNo1,bedNo1;%>
<%
	PreparedStatement ps1=c.prepareStatement("select distinct room_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		roomNo1=rs1.getInt(1);
%>		                       
                        
                          <option value="<%=roomNo1%>"><%=roomNo1%></option>
<%
	}
	ps1.close();
	rs1.close();
%>                        
                   
                              
                        </select>
                        </div>
                    </div>  

<div class="form-group">
<label  class="col-sm-2 control-label">Bed No.</label>
<div class="col-sm-10" id="beds<%=id%>">
  <select class="form-control" name="bed_no">
<option selected="selected"><%=bed_no%></option>
	
</select>	
</div>
</div>


<div class="form-group">
<label  class="col-sm-2 control-label">Reffered To</label>
<div class="col-sm-10">
	<select class="form-control" name="doct">
	<option selected="selected"><%=doc_name%></option>
															  
<%
	PreparedStatement ps2=c.prepareStatement("select * from doctor_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs2=ps2.executeQuery();
	while(rs2.next())
	{
		doctId=rs2.getInt(1);
		doctName=rs2.getString(2);
%>		                       
                        
                          <option value="<%=doctName%>"><%=doctName%>(<%=doctId%>)</option>
<%
	}
	ps2.close();
	rs2.close();
%>
</select>
	</div>
	</div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="gender" value="<%=gender%>" placeholder="Gender" >
                        </div>
                    </div>
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Admission Date</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="admit_date" value="<%=admit_date%>" placeholder="Admission Date " >
                        </div>
                    </div>
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="age" value="<%=age%>" placeholder="Age" >
                        </div>
                    </div>
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Blood_Grpup</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="bgroup" value="<%=bgroup%>" placeholder="Blood Group" >
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
										<!----------------   Add Patient Start   --------------->
										<div id="adddoctor" class="switchgroup">
											<div class="panel panel-default">
												<div class="panel-body">
													<form class="form-horizontal" action="add_patient_validation.jsp">
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Patient Id:</label>
															 <div class="col-sm-10">
                                                                <input type="number" class="form-control" name="patientid" placeholder="unique_id auto generated" readonly>
															</div>
												        </div>
                                                                                                            
															<div class="form-group">
															<label  class="col-sm-2 control-label">Name</label>
															<div class="col-sm-10">
                                                                <input type="text" class="form-control" name="patientname" placeholder="Name">
															</div>
												            </div>
															
														  <div class="form-group">
															<label class="col-sm-2 control-label">Email</label>
															<div class="col-sm-10">
															  <input type="email" class="form-control" name="email" placeholder="Email">
															</div>
														  </div>
														  
														  <div class="form-group">
															<label class="col-sm-2 control-label">Password</label>
															<div class="col-sm-10">
															  <input type="password" class="form-control" name="pwd" placeholder="Password">
															</div>
														  </div>
														  
														  <div class="form-group">
															<label  class="col-sm-2 control-label">Address</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="add" placeholder="Address">
															</div>
															</div>
															
															 <div class="form-group">
															<label  class="col-sm-2 control-label">Phone</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="phone" placeholder="Phone No.">
															</div>
															</div>
															
															 <div class="form-group">
															<label  class="col-sm-2 control-label">Reason Of Visit</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="rov" placeholder="Reason Of Visit">
															</div>
															</div>


						 									<div class="form-group">
															<label  class="col-sm-2 control-label">Room No</label>
															<div class="col-sm-10">
															  <select class="form-control" name="roomNo" id="roomNo" onchange="retrieveBeds()">
															<option selected="selected">Select Room</option>
<% int roomNo,bedNo;%>
<%
	PreparedStatement ps3=c.prepareStatement("select distinct room_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs3=ps3.executeQuery();
	while(rs3.next())
	{
		roomNo=rs3.getInt(1);
%>		                       
                        
                          <option value="<%=roomNo%>"><%=roomNo%></option>
<%
	}
	ps3.close();
	rs3.close();
%>
															</select>
															</div>
															</div>

															 <div class="form-group">
															<label  class="col-sm-2 control-label">Bed No.</label>
															<div class="col-sm-10" id="beds">
															  <select class="form-control" name="bed_no">
															<option selected="selected">Select Bed</option>
																	
															</select>	
															</div>
															</div>

						 									<div class="form-group">
															<label  class="col-sm-2 control-label">Reffered To</label>
																<div class="col-sm-10">
															<select class="form-control" name="doct">
															<option selected="selected">Select Doctor</option>
															  
<%
	PreparedStatement ps4=c.prepareStatement("select * from doctor_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs4=ps4.executeQuery();
	while(rs4.next())
	{
		doctId=rs4.getInt(1);
		doctName=rs4.getString(2);
%>		                       
                        
                          <option value="<%=doctName%>"><%=doctName%>(<%=doctId%>)</option>
<%
	}
	ps4.close();
	rs4.close();
%>
															</select>
															</div>
															</div>
                                                            <div class="form-group">    
                                                                <label class="col-sm-2 control-label">Sex</label>
                                                                <div class="col-sm-2">
                                                            <select class="form-control" name="gender">
                                                                  <option>Male</option>
                                                                  <option>Female</option>
                                                                  </select>
                                                                    </div>
                                                            </div>
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Admission Date</label>
															<div class="col-sm-10">
															  <input type="date" class="form-control" name="joindate" placeholder="Admission date">
															</div>
															</div>
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Age</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="age" placeholder="Age">
															</div>
															</div>
                                                        <div class="form-group">    
                                                                <label class="col-sm-2 control-label">Blood Group</label>
                                                                <div class="col-sm-2">
                                                            <select class="form-control" name="bgroup">
                                                                  <option>A<sup>+</sup></option>
                                                                  <option>A<sup>-</sup></option>
                                                                <option>B<sup>+</sup></option>
                                                                <option>B<sup>-</sup></option>
                                                                <option>AB<sup>+</sup></option>
                                                                <option>AB<sup>-</sup></option>
                                                                <option>O<sup>+</sup></option>
                                                                <option>O<sup>-</sup></option>
                                                                  </select>
                                                                    </div>
                                                            </div>
										
                                                               
															
														 
														  <div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
															  <button type="submit" class="btn btn-primary">Add Patient</button>
															</div>
														  </div>
													</form>
												
												 </div>
											</div>
										</div>
										<!----------------   Add Patients Ends   --------------->
								</div>
								<!----------------   Panel body Ends   --------------->
							</div>
				</div>
			</div>
	</div>
				
				
				
		
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>