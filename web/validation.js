var request;
function createRequest()
{
	try
	{
		request=new XMLHttpRequest();
	}
	catch(exc)
	{
		try
		{
			request=new ActiveXObject("MSxml2.XMLHTTP");
		}
		catch(exc)
		{
			try
			{
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(exc)
			{
				request=null;
			}
		}
	}
	return request;
}

function inputResponse(request)
{
	var beds=document.getElementById("beds");	
	if(request.readyState==4)
	{
		var response=request.responseText;
		beds.innerHTML=response;
	}
}
function retrieveBeds()
{	
	//alert("retrieving beds please wait...");
	var roomNo=document.getElementById("roomNo");
	//alert(roomNo);
	var request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var url="retrieve_beds_validation.jsp?roomNo="+roomNo.value;
	request.open("GET",url,true)
	request.onreadystatechange=function(){inputResponse(request)};
	request.send(null);
}
function inputResponse2(request,id)
{
	var beds=document.getElementById("beds"+id);	
	if(request.readyState==4)
	{
		var response=request.responseText;
		beds.innerHTML=response;
	}
}
function retrieveBeds2(id)
{	
	//alert("retrieving beds please wait...");
	var roomNo=document.getElementById("roomNo"+id);
	//alert(roomNo);
	var request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var url="retrieve_beds_validation.jsp?roomNo="+roomNo.value;
	request.open("GET",url,true)
	request.onreadystatechange=function(){inputResponse2(request,id)};
	request.send(null);
}