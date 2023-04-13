<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
 <%@include file="header_patient.jsp"%>
    <body>

       
        <div class="row">
		
<%@include file="menu_patient.jsp"%>
       
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    
    <!----------------   Menu Tab   --------------->
    <div class="panel panel-default contentinside">

 <div class="panel panel-default contentinside">
							
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Change Password</div>
        <!----------------   Panel body Start   --------------->
        <div class="panel-body">
            <form class="form-horizontal" action="change_pass_validation2.jsp">
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