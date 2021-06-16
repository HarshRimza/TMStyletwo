<%@taglib uri='/WEB-INF/tlds/mytags.tld' prefix='tm' %>
<jsp:useBean id='messageBean' scope='request' class='com.thinking.machines.school.beans.MessageBean' />
<jsp:useBean id='studentNameBean' scope='request' class='com.thinking.machines.school.beans.StudentNameBean' />
<script src="/styletwo/js/jquery.slim.min.js"></script>
<script src="/styletwo/js/bootstrap.min.js"></script>
<script>
function City()
{ 
this.code=0;
this.name='';
}
function Student()
{ 
this.rollNumber=0;
this.name='';
this.address='';
this.city=null;
this.gender='';
this.indian=false;
this.dateOfBirth='';
}
function ViewModel()
{ 
this.cities=[];
}
var viewModel=new ViewModel();

<tm:TableIterator table='city' name='city' orderBy='name'>
c=new City();
c.code=${city.code};
c.name='${city.name}';
viewModel.cities[${index}]=c;
</tm:TableIterator>


var studentName="<jsp:getProperty name='studentNameBean' property='studentName' />";
var student=' ';
function getStudent()
{
var url='/styletwo/getStudent?name='+studentName;
var xmlHttpRequest=new XMLHttpRequest();
xmlHttpRequest.onreadystatechange=function()
{
if(this.readyState==4 && this.status==200)
{
var responseString=xmlHttpRequest.responseText;
var responseJSON=JSON.parse(responseString);
if(responseJSON.success)
{
student=responseJSON.response;
viewDetail();
}
else
{
alert("Some problem : "+responseJSON.exception);
}
}
}
xmlHttpRequest.open("GET",url,true);
xmlHttpRequest.send();
}



function showViewDetailDivision()
{
var studentViewDetailDivision=document.getElementById('studentViewDetailDivision');
var studentEditFormDivision=document.getElementById('studentEditFormDivision');
var studentWhateverForm=document.getElementById("studentEditForm");
studentViewDetailDivision.style.display='';
studentEditFormDivision.style.display='none';
studentWhateverForm.rollNumber.value='';
studentWhateverForm.name.value='';
studentWhateverForm.cityCode.value='-1';
studentWhateverForm.address.value='';
studentWhateverForm.gender[1].checked=false;
studentWhateverForm.gender[0].checked=false;
studentWhateverForm.indian.checked=false;
studentWhateverForm.dateOfBirth.value='';
}

function showEditForm()
{
var studentViewDetailDivision=document.getElementById('studentViewDetailDivision');
var studentEditFormDivision=document.getElementById('studentEditFormDivision');
studentViewDetailDivision.style.display='none';
studentEditFormDivision.style.display='';
editStudent();
}

function editStudent()
{
var rollNumber=student.rollNumber;
var name=student.name;
var gender=student.gender;
var address=student.address;
var indian=student.indian;
var dateOfBirth=student.dateOfBirth;

var studentViewDetailDivision=document.getElementById('studentViewDetailDivision');
var studentEditFormDivision=document.getElementById('studentEditFormDivision');
var studentEditForm=document.getElementById('studentEditForm');

studentEditForm.rollNumber.value=rollNumber;
studentEditForm.realName.value=name;
studentEditForm.name.value=name;
studentEditForm.address.value=address;
if(gender=='M')
{
studentEditForm.gender[0].checked=true;
}
else
{
studentEditForm.gender[1].checked=true;
}
var editFormCityCode=document.getElementById('editFormCityCode');
editFormCityCode.value=student.city.code;
if(indian)
{
studentEditForm.indian.checked=true;
}
else
{
studentEditForm.indian.checked=false;
}
studentEditForm.dateOfBirth.value=dateOfBirth;
studentEditFormDivision.style.display='';
studentViewDetailDivision.style.display='none';
}


function viewDetail()
{
var studentViewDetailForm=document.getElementById('studentViewDetailForm');
var rollNumber=student.rollNumber;
var name=student.name;
var gender=student.gender;
var city_code=student.city.code;
var city_name=student.city.name;
var address=student.address;
var indian=student.indian;
var dateOfBirth=student.dateOfBirth;

studentViewDetailForm.rollNumber.value=rollNumber;
studentViewDetailForm.name.value=name;
studentViewDetailForm.address.value=address;
if(gender=='M')
{
studentViewDetailForm.gender.value='Male';
}
else
{
studentViewDetailForm.gender.value='Female';
}
var viewDetailCityCode=document.getElementById('viewDetailCityCode');
viewDetailCityCode.value=city_name;
if(indian)
{
studentViewDetailForm.indian.checked=true;
}
else
{
studentViewDetailForm.indian.checked=false;
}
studentViewDetailForm.dateOfBirth.value=dateOfBirth;
}


function validateForm(frm,cityErrorSection,genderErrorSection)
{
var whateverForm=document.getElementById(whateverForm);
var rollNumber=0;
rollNumber=frm.rollNumber.value;
if(rollNumber==0)
{
alert("Roll Number Required");
frm.rollNumber.focus();
return false;
}
var name=frm.name.value.trim();
if(name.length==0)
{
alert("Name Required");
frm.name.focus();
return false;
}
var vv='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz .';
var i=0;
while(i<name.length)
{
if(vv.indexOf(name.charAt(i))==-1)
{
alert('Invalid name');
frm.name.focus();
return false;
}
i++;
}
var address=frm.address.value.trim();
if(address.length==0)
{
alert('Address Required');
frm.address.focus();
return false;
}

cityErrorSection=document.getElementById(cityErrorSection);
var cityCode=frm.cityCode.value;
if(cityCode==-1)
{
cityErrorSection.innerHTML='Required';
frm.cityCode.focus();
return false;
}
else
{
cityErrorSection.innerHTML='';
}

genderErrorSection=document.getElementById(genderErrorSection);
if(frm.gender[0].checked==false && frm.gender[1].checked==false)
{
genderErrorSection.innerHTML='Required';
return false;
}
else
{
genderErrorSection.innerHTML='';
}

var dateOfBirth=frm.dateOfBirth.value.trim();
if(dateOfBirth.length==0 || dateOfBirth.length<8 || dateOfBirth.length>10)
{
alert("Date of birth Required");
frm.dateOfBirth.focus();
return false;
}

var minus=0;
vv='0123456789';
for(i=0;i<7;i++)
{
if(vv.indexOf(dateOfBirth.charAt(i))==-1 && i!=4 && i!=6)
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
if(i==4 && dateOfBirth.charAt(4)!='-')
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}

if(i==6)
{
if(dateOfBirth.charAt(6)=='-')
{
minus=2;
break;
}
if(vv.indexOf(dateOfBirth.charAt(6))==-1)
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
}
}

if(minus==2)
{
if(vv.indexOf(dateOfBirth.charAt(7))==-1)
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
if(vv.indexOf(dateOfBirth.charAt(8))==-1 || dateOfBirth.length==10)
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
}
else
{
if(dateOfBirth.charAt(7)!='-')
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
if(vv.indexOf(dateOfBirth.charAt(8))==-1 || vv.indexOf(dateOfBirth.charAt(9))==-1)
{
alert('Invalid date of birth');
frm.dateOfBirth.focus();
return false;
}
}
return true;
}

function showError()
{
var message= "<jsp:getProperty name='messageBean' property='message' />";
if(message.length!=0)
{
var a="<div class='alert alert-primary alert-dismissible fade show' role='alert'>";
a=a+"<strong>Message : </strong><jsp:getProperty name='messageBean' property='message' />";
a=a+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
a=a+"<span aria-hidden='true'>&times;</span>";
a=a+"</button>";
a=a+"</div>";
document.getElementById("errorMessage").innerHTML=a;
}
}

function initializeView()
{
var editFormCityCode=document.getElementById('editFormCityCode');
y=0;
var option;
while(y<viewModel.cities.length)
{
option=document.createElement('option');
option.text=viewModel.cities[y].name;
option.value=viewModel.cities[y].code;
editFormCityCode.options[y+1]=option;
y++;
}
}
window.addEventListener('load',initializeView);
window.addEventListener('load',showError);
window.addEventListener('load',getStudent);
</script>
