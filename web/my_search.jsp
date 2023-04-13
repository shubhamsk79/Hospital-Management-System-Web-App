<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
<style>
input
{
border-radius:10px;border:none;padding:0.5%;color:red;border: 2px solid #8AC007;
}
button
{
color:#fff;background-color:#337ab7;border-color:#2e6da4;padding:0.5%;;
}
</style>
 <%@include file="header_patient.jsp"%>
    <body>

       
        <div class="row">
		
<%@include file="menu_patient.jsp"%>
       
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
	    
    <!----------------   Menu Tab   --------------->
    <div class="panel panel-default contentinside">

 <div class="panel panel-default contentinside">
        <div class="panel-heading"><b>Search Module</b></div>
        <!----------------   Panel body Start   --------------->
            <div class="panel-body" style="margin-left:15%">

                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_department.jsp">
				<label style="margin:0 -1.5% 0 0">Search Department</label>
				&nbsp;<input type="text" name="dept" style="margin:2% 2%;" value="Department" readonly> <input type="text" name="searchString" placeholder="Name" required>
                                    <button type="submit" style="color:#fff;margin:0 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_doctor.jsp">
				<label style="margin:0 3% 0 0">Search Doctor</label>
				&nbsp;<input type="text" name="doctor" style="margin:2% 2%;" value="Doctor" readonly> <input type="text" name="searchString" placeholder="Name/Department/Address" required>
                                    <button type="submit" style="color:#fff;margin:0 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_patients.jsp">
				<label style="margin:0 3% 0 0">Search Patient</label>
   <input type="text" name="patient" style="margin:0 2%;" value="Patient" readonly> <input type="text" name="searchString" placeholder="Name/Room/Address" required>
                                    <button type="submit" style="color:#fff;margin:2% 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_nurse.jsp">
                            <label style="margin:0 3% 0 0">Search Nurse</label>
					&nbsp; <input type="text" name="nurse" style="margin:2% 2%;" value="Nurse" readonly> <input type="text" name="searchString" placeholder="Name/Address" required>
                                    <button type="submit" style="color:#fff;margin:1% 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_pathology.jsp">
    <label >Search Pathology</label>
 <input type="text" name="nurse" style="margin:0 2%;" value="Pathology" readonly> <input type="text" name="searchString" placeholder="Search By name" required>
                                    <button type="submit" style="color:#fff;margin:2% 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>			
                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_donor.jsp">
                            <label style="margin:0 4% 0 0">Search Donor</label>
 					<input type="text" name="donor" style="margin:0 2%;" value="Blood Donor" readonly> <input type="text" name="searchString" placeholder="Name/Address" required>
                                    <button type="submit" style="color:#fff;margin:2% 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>


                    <div class="form-group">
                            <div class="col-sm-10" style="color:red">
                          <form action="search_billing.jsp">
                            <label style="margin:0 4% 0 0"	>Search Billing</label>
 <input type="text" name="nurse" style="margin:0 2%;" value="Billing" readonly> <input type="text" name="searchString" placeholder="Name" required>
                                    <button type="submit" style="color:#fff;margin:2% 3%"><b>Search</b></button>
				</form>
                            </div>
                    </div>
													
            </div>										
            </div>
                        <!----------------   Panel body Ends   --------------->
    </div>							

    </div>
            
    </div>
</div>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>