<%@taglib uri='/WEB-INF/tlds/mytags.tld' prefix='tm' %>
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
this.students=[];
this.cities=[];
this.selectedRow=null;
this.selectedIndex=-1;
}

var viewModel=new ViewModel();
var student;

<tm:TableIterator table='student_view' name='student' orderBy='name'>
student=new Student();
student.rollNumber=${student.rollNumber};
student.name='${student.name}';
student.address='${student.address}';
student.city=new City();
student.city.code=${student.city.code};
student.city.name='${student.city.name}';
student.gender='${student.gender}';
student.indian=${student.indian};
student.dateOfBirth='${student.dateOfBirth}';
viewModel.students[${index}]=student;
</tm:TableIterator>

<tm:TableIterator table='city' name='city' orderBy='name'>
c=new City();
c.code=${city.code};
c.name='${city.name}';
viewModel.cities[${index}]=c;
</tm:TableIterator>


// sort it
var oend=viewModel.students.length-2;
var iend=viewModel.students.length-1;
var m;
for(var e=0;e<=oend;e++)
{
for(var f=e+1;f<=iend;f++)
{
if(viewModel.students[f].name.toUpperCase().localeCompare(viewModel.students[e].name.toUpperCase())<0)
{
m=viewModel.students[e];
viewModel.students[e]=viewModel.students[f];
viewModel.students[f]=m;
}
}
}

function showDeleteDetailViewContainer(division,form)
{
var studentWhateverFormDivision=document.getElementById(division);
var studentWhateverForm=document.getElementById(form);
var viewContainer=document.getElementById('viewContainer');
studentWhateverFormDivision.style.display='none';
viewContainer.style.display='';
studentWhateverForm.rollNumber.value='';
studentWhateverForm.name.value='';
studentWhateverForm.cityCode.value='-1';
studentWhateverForm.address.value='';
studentWhateverForm.gender.value='';
studentWhateverForm.indian.checked=false;
studentWhateverForm.dateOfBirth.value='';
}


function showViewContainer(division,form)
{
var studentWhateverFormDivision=document.getElementById(division);
var studentWhateverForm=document.getElementById(form);
var viewContainer=document.getElementById('viewContainer');
studentWhateverFormDivision.style.display='none';
viewContainer.style.display='';
studentWhateverForm.rollNumber.value='';
studentWhateverForm.name.value='';
studentWhateverForm.cityCode.value='-1';
studentWhateverForm.address.value='';
studentWhateverForm.gender[1].checked=false;
studentWhateverForm.gender[0].checked=false;
studentWhateverForm.indian.checked=false;
studentWhateverForm.dateOfBirth.value='';
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



function selectStudent(rollNumber)
{
for(var i=0;i<viewModel.students.length;i++)
{
if(rollNumber==viewModel.students[i].rollNumber)
{
break;
}
}
var table=document.getElementById('viewContainer');
var row=document.getElementById('xixi'+rollNumber);
selectRow(row,i);
row.scrollIntoView(true);
}

function selectRow(r,i)
{
if(r==viewModel.selectedRow) return;
if(viewModel.selectedRow!=null)
{
viewModel.selectedRow.style.background='#FFFFFF';
viewModel.selectedRow.style.color='#000000';
}
viewModel.selectedRow=r;
viewModel.selectedIndex=i;
r.style.background='#CECECE';
r.style.color='#000000';
}

function searchStudent(t)
{
t.style.color='black';
if(t.value.length==0)
{
viewModel.selectedRow.style.background='#FFFFFF';
viewModel.selectedRow.style.color='#000000';
return;
}
var i;
for(i=0;i<viewModel.students.length;i++)
{
if(viewModel.students[i].name.toUpperCase().startsWith(t.value.toUpperCase()))
{
break;
}
}
if(i==viewModel.students.length)
{
t.style.color='red';
}
else
{
var rollNo=viewModel.students[i].rollNumber;
var table=document.getElementById('viewContainer');
var row=document.getElementById('xixi'+rollNo);
selectStudent(rollNo);
row.scrollIntoView(true);
}
}


function createEditStudentHandler(i)
{
return function()
{
editStudent(i);
};
}
function createDeleteStudentHandler(i)
{
return function(){
deleteStudent(i);
};
}
function createDetailsViewHandler(i)
{
return function(){
viewDetail(i);
};
}
function createRowClickedHandler(r,i)
{
return function(){
selectRow(r,i);
};
}

function editStudent(i)
{
var rollNumber=viewModel.students[i].rollNumber;
var name=viewModel.students[i].name;
var gender=viewModel.students[i].gender;
var address=viewModel.students[i].address;
var indian=viewModel.students[i].indian;
var dateOfBirth=viewModel.students[i].dateOfBirth;
var viewContainer=document.getElementById('viewContainer');
var studentEditFormDivision=document.getElementById('studentEditFormDivision');
var studentEditForm=document.getElementById('studentEditForm');
studentEditForm.rollNumber.value=rollNumber;
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
editFormCityCode.value=viewModel.students[i].city.code;
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
viewContainer.style.display='none';
}

function deleteStudent(i)
{
var viewContainer=document.getElementById('viewContainer');
var studentDeleteFormDivision=document.getElementById('studentDeleteFormDivision');
var studentDeleteForm=document.getElementById('studentDeleteForm');
var rollNumber=viewModel.students[i].rollNumber;

var name=viewModel.students[i].name;
var gender=viewModel.students[i].gender;
var city_code=viewModel.students[i].city.code;
var city_name=viewModel.students[i].city.name;
var address=viewModel.students[i].address;
var indian=viewModel.students[i].indian;
var dateOfBirth=viewModel.students[i].dateOfBirth;
studentDeleteForm.rollNumber.value=rollNumber;
studentDeleteForm.name.value=name;
studentDeleteForm.address.value=address;
if(gender=='M')
{
studentDeleteForm.gender.value="Male";
}
else
{
studentDeleteForm.gender.value="Female";
}
var deleteFormCityCode=document.getElementById('deleteFormCityCode');
deleteFormCityCode.value=viewModel.students[i].city.name;
if(indian)
{
studentDeleteForm.indian.checked=true;
}
else
{
studentDeleteForm.indian.checked=false;
}
studentDeleteForm.dateOfBirth.value=dateOfBirth;
studentDeleteFormDivision.style.display='';
viewContainer.style.display='none';
}

function viewDetail(i)
{
var viewContainer=document.getElementById('viewContainer');
var studentViewDetailDivision=document.getElementById('studentViewDetailDivision');
var studentViewDetailForm=document.getElementById('studentViewDetailForm');

var rollNumber=viewModel.students[i].rollNumber;
var name=viewModel.students[i].name;
var gender=viewModel.students[i].gender;
var city_code=viewModel.students[i].city.code;
var city_name=viewModel.students[i].city.name;
var address=viewModel.students[i].address;
var indian=viewModel.students[i].indian;
var dateOfBirth=viewModel.students[i].dateOfBirth;

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
studentViewDetailDivision.style.display='';
viewContainer.style.display='none';
}

function addStudent()
{
showViewContainer('studentAddFormDivision','studentAddForm');
var viewContainer=document.getElementById('viewContainer');
var studentAddFormDivision=document.getElementById('studentAddFormDivision');
var studentEditFormDivision=document.getElementById('studentEditFormDivision');
var studentDeleteFormDivision=document.getElementById('studentDeleteFormDivision');
var studentViewDetailDivision=document.getElementById('studentViewDetailDivision');
studentAddFormDivision.style.display='';
studentEditFormDivision.style.display='none';
studentDeleteFormDivision.style.display='none';
studentViewDetailDivision.style.display='none';
viewContainer.style.display='none';
}

function initializeView()
{
var tableBody=document.getElementById('studentViewGrid');
var i=0;
var row,cell,textNode,img;
while(i<viewModel.students.length)
{
row=document.createElement('tr');
row.id='xixi'+viewModel.students[i].rollNumber;

cell=document.createElement('td');
cell.innerHTML=(i+1)+'.';
cell.style.textAlign='right';
row.appendChild(cell);

cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].rollNumber);
cell.appendChild(textNode);
cell.style.textAlign='right';
row.appendChild(cell);

cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].name);
cell.appendChild(textNode);
row.appendChild(cell);

cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].city.name);
cell.appendChild(textNode);
row.appendChild(cell);

cell=document.createElement('td');
img=document.createElement('img');
if(viewModel.students[i].gender=='M')
{
img.src='/styleone/images/male_icon.png';
} 
else
{
img.src='/styleone/images/female_icon.png';
} 
cell.style.textAlign='center';
cell.appendChild(img);
row.appendChild(cell);

cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].dateOfBirth);
cell.appendChild(textNode);
row.appendChild(cell);

cell=document.createElement('td');
img=document.createElement("img");
img.src="/styleone/images/edit_icon.png";
img.onclick=createEditStudentHandler(i);
cell.appendChild(img);
row.appendChild(cell);

cell=document.createElement('td');
img=document.createElement("img");
img.src="/styleone/images/delete_icon.png";
img.onclick=createDeleteStudentHandler(i);
cell.appendChild(img);
row.appendChild(cell);

cell=document.createElement('td');
img=document.createElement("img");
img.src="/styleone/images/icon.png";
img.onclick=createDetailsViewHandler(i);
cell.appendChild(img);
row.appendChild(cell);

row.style.cursor="pointer";
row.onclick=createRowClickedHandler(row,i);
tableBody.appendChild(row);
i++;
}

var addFormCityCode=document.getElementById('addFormCityCode');
var y=0;
var option;
while(y<viewModel.cities.length)
{
option=document.createElement('option');
option.text=viewModel.cities[y].name;
option.value=viewModel.cities[y].code;
addFormCityCode.options[y+1]=option;
y++;
}

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

<tm:Equals name='scenario' value='updated'>
selectStudent(${studentBean.rollNumber});
</tm:Equals>

<tm:Equals name='scenario' value='added'>
selectStudent(${studentBean.rollNumber});
</tm:Equals>
}
window.addEventListener('load',initializeView);
</script>