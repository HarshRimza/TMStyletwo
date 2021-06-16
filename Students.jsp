<jsp:include page='/MasterPageTopSection.jsp' />
<jsp:useBean id='messageBean' scope='request' class='com.thinking.machines.school.beans.MessageBean' />
<jsp:include page='/StudentsJS.jsp' />



<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>Students</h4></p>
</nav>

<nav class='navbar navbar-expand navbar-light ' style='background-color:#e3f2fd;'>
<p class="navbar-brand" style='margin:10px'>Search Student</p>
<input type='search'  class="form-control mr-md-5" id='searchText' placeHolder='Search' aria-label="Search" oninput='searchStudent(this)'>
<img  class=" my-2 my-sm-10" src='/styletwo/images/add_icon.png' onclick='addStudent()'>
</nav>

<div class='alert alert-primary alert-dismissible fade show' role='alert'>
<strong>Message &nbsp;&nbsp;&nbsp;</strong><jsp:getProperty name='messageBean' property='message' />
<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
<span aria-hidden='true'>&times;</span>
</button>
</div>


<div class='overflow-auto'>
<div id='viewContainer' class='table-responsive' style='height:300px;'>
<table id='studentViewGrid' class='table'>
<thead class='thead-dark'>
<tr>
<th>S.No.</th>
<th>Roll Number</th>
<th>Name</th>
<th>City</th>
<th>Gender</th>
<th>D.O.B.</th>
<th>Edit</th>
<th>Delete</th>
<th>Details</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
<br>
<br>

<!-- Add Form -->
<div id='studentAddFormDivision' style='display:none'>
<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>Student (Add Module)</h4></p>
</nav>

<form id='studentAddForm'  action='/styletwo/AddStudent.jsp' method='post' onsubmit="return validateForm(this,'addCityErrorSection','addGenderErrorSection')">

  <div class="form-group row mx-md-n1">
    <label for="rollNumber" class="col-sm-2 col-form-label">Roll Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="rollNumber" name='rollNumber'>
    </div>
  </div>


  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name='name'>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="address" class='col-sm-2 col-form-label'>Address</label>
    <div class="col-sm-12">
     <textarea class="form-control" name='address' id="address" rows="3"></textarea>
    </div>
  </div>

<div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-6">
      <select id="addFormCityCode" name='cityCode' class="form-control">
        <option selected value='-1'>&lt;Select City&gt;</option>
      </select>
    </div>
    <div class="col-sm-2">
      <span id='addCityErrorSection' ></span>
    </div>
</div>
    
<div class="row mx-md-n1">
 <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
  <div class="col-sm-10">
   <div class='custom-control custom-radio custom-control-inline'>
    <input type='radio' id='male' name='gender' value='M' class='custom-control-input'>
    <label class='custom-control-label' for='male'>Male</label>
   </div>
   <div class='custom-control custom-radio custom-control-inline'>
    <input type='radio' id='female' name='gender' value='F' class='custom-control-input'>
    <label class='custom-control-label' for='female'>Female</label>
   </div>
   <div class='custom-control custom-radio custom-control-inline'>
    <span id='addGenderErrorSection' ></span>
   </div>
 </div>
</div> 

  <div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">Indian</label>
     <div class="col-sm-10">
      <div class="custom-control custom-checkbox">
       <input type="checkbox" class="custom-control-input" id="indian" name='indian' value='true'>
       <label class="custom-control-label" for="indian"></label>
      </div>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="dateOfBirth" class="col-sm-2 col-form-label">Date of Birth</label>
    <div class="col-sm-10">
      <input type="text" placeholder='yyyy-mm-dd' class="form-control" id="dateOfBirth" name='dateOfBirth'>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <div class="col-sm-6 col-form-label">
      <button type='submit' class="btn btn-primary btn-block" data-toggle='tooltip' data-placement='right' title='Save Data'>Save</button>
    </div>
    <div class="col-sm-6 col-form-label">
      <button type='button' class="btn btn-secondary  btn-block" onclick=showViewContainer('studentAddFormDivision','studentAddForm') data-toggle='tooltip' data-placement='right' title='Cancel Form'>Cancel</button>
    </div>
  </div>

</form>
</div>
<!-- Add Form -->


<!-- Delete Form -->
<div id='studentDeleteFormDivision' style='display:none'>
<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>Student (Delete Module)</h4></p>
</nav>

<form id='studentDeleteForm'  action='/styletwo/DeleteStudent.jsp' method='post' >

  <div class="form-group row mx-md-n1">
    <label for="rollNumber" class="col-sm-2 col-form-label">Roll Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="rollNumber" name='rollNumber' readonly>
    </div>
  </div>


  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="address" class='col-sm-2 col-form-label'>Address</label>
    <div class="col-sm-12">
     <textarea class="form-control" name='address' id="address" rows="3" readonly></textarea>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="deleteFormCityCode" name='cityCode' readonly>
    </div>
  </div>
    
  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Gender</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="gender" name='gender' readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">Indian</label>
     <div class="col-sm-10">
      <div class="custom-control custom-checkbox">
       <input type="checkbox" class="custom-control-input" id="indian" name='indian' value='true' readonly>
       <label class="custom-control-label" for="indian"></label>
      </div>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="dateOfBirth" class="col-sm-2 col-form-label">Date of Birth</label>
    <div class="col-sm-10">
      <input type="text" placeholder='yyyy-mm-dd' class="form-control" id="dateOfBirth" name='dateOfBirth' readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <div class="col-sm-6 col-form-label">
      <button type='submit' class="btn btn-primary btn-block" data-toggle='tooltip' data-placement='right' title='Delete Data'>Delete</button>
    </div>
    <div class="col-sm-6 col-form-label">
      <button type='button' class="btn btn-secondary  btn-block" onclick=showDeleteDetailViewContainer('studentDeleteFormDivision','studentDeleteForm') data-toggle='tooltip' data-placement='right' title='Cancel Form'>Cancel</button>
    </div>
  </div>

</form>
</div>
<!-- Delete Form -->

<!-- Edit Form -->
<div id='studentEditFormDivision' style='display:none'>
<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>Student (Edit Module)</h4></p>
</nav>

<form id='studentEditForm'  action='/styletwo/EditStudent.jsp' method='post' onsubmit="return validateForm(this,'editCityErrorSection','editGenderErrorSection')">

  <div class="form-group row mx-md-n1">
    <label for="rollNumber" class="col-sm-2 col-form-label">Roll Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="rollNumber" name='rollNumber'>
    </div>
  </div>


  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name='name'>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="address" class='col-sm-2 col-form-label'>Address</label>
    <div class="col-sm-12">
     <textarea class="form-control" name='address' id="address" rows="3"></textarea>
    </div>
  </div>

<div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-6">
      <select id="editFormCityCode" name='cityCode' class="form-control">
        <option selected value='-1'>&lt;Select City&gt;</option>
      </select>
    </div>
    <div class="col-sm-2">
      <span id='editCityErrorSection' ></span>
    </div>
</div>
    
<div class="row mx-md-n1">
 <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
  <div class="col-sm-10">
   <div class='custom-control custom-radio custom-control-inline'>
    <input type='radio' id='male' name='gender' value='M' class='custom-control-input'>
    <label class='custom-control-label' for='male'>Male</label>
   </div>
   <div class='custom-control custom-radio custom-control-inline'>
    <input type='radio' id='female' name='gender' value='F' class='custom-control-input'>
    <label class='custom-control-label' for='female'>Female</label>
   </div>
   <div class='custom-control custom-radio custom-control-inline'>
    <span id='editGenderErrorSection' ></span>
   </div>
 </div>
</div> 

  <div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">Indian</label>
     <div class="col-sm-10">
      <div class="custom-control custom-checkbox">
       <input type="checkbox" class="custom-control-input" id="indian" name='indian' value='true'>
       <label class="custom-control-label" for="indian"></label>
      </div>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="dateOfBirth" class="col-sm-2 col-form-label">Date of Birth</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder='yyyy-mm-dd' id="dateOfBirth" name='dateOfBirth'>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <div class="col-sm-6 col-form-label">
      <button type='submit' class="btn btn-primary btn-block" data-toggle='tooltip' data-placement='right' title='Update Data'>Save</button>
    </div>
    <div class="col-sm-6 col-form-label">
      <button type='button' class="btn btn-secondary  btn-block" onclick=showViewContainer('studentEditFormDivision','studentEditForm') data-toggle='tooltip' data-placement='right' title='Cancel Form'>Cancel</button>
    </div>
  </div>

</form>
</div>
<!-- Edit Form -->

<!-- View Detail Form -->
<div id='studentViewDetailDivision' style='display:none'>
<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>Student (View Detail Module)</h4></p>
</nav>

<form id='studentViewDetailForm' >

  <div class="form-group row mx-md-n1">
    <label for="rollNumber" class="col-sm-2 col-form-label">Roll Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="rollNumber" name='rollNumber' readonly>
    </div>
  </div>


  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name='name' readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="address" class='col-sm-2 col-form-label'>Address</label>
    <div class="col-sm-12">
     <textarea class="form-control" name='address' id="address" rows="3" readonly></textarea>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="viewDetailCityCode" name='cityCode' readonly>
    </div>
  </div>
    
  <div class="form-group row mx-md-n1">
    <label for="name" class="col-sm-2 col-form-label">Gender</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="gender" name='gender' readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="city" class="col-sm-2 col-form-label">Indian</label>
     <div class="col-sm-10">
      <div class="custom-control custom-checkbox">
       <input type="checkbox" class="custom-control-input" id="indian" name='indian' value='true' readonly>
       <label class="custom-control-label" for="indian"></label>
      </div>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
    <label for="dateOfBirth" class="col-sm-2 col-form-label">Date of Birth</label>
    <div class="col-sm-10">
      <input type="text" placeholder='yyyy-mm-dd' class="form-control" id="dateOfBirth" name='dateOfBirth' readonly>
    </div>
  </div>

  <div class="form-group row mx-md-n1">
      <button type='button' class="btn btn-secondary  btn-block" onclick=showDeleteDetailViewContainer('studentViewDetailDivision','studentViewDetailForm') data-toggle='tooltip' data-placement='right' title='Back to Student Grid'>Back</button>
  </div>

</form>
</div>
<!-- View Detail Form -->



<jsp:include page='/MasterPageBottomSection.jsp' />