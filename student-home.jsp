<jsp:include page='/MasterPageSecondTopSection.jsp' />
<jsp:include page='/StudentJS.jsp' />

<nav class='navbar navbar-light bg-light'>
<p class='text-center'><h4>STUDENT</h4></p>
</nav>

<div  id='errorMessage' >
</div>

<!-- Edit Form -->
<div id='studentEditFormDivision' style='display:none'>
<nav class='navbar navbar-light' style='background-color: #e3f2fd;'>
<p class='text-center '><h4>Student (Edit Module)</h4></p>
</nav>
<form id='studentEditForm'  action='/styletwo/EditSingleStudent.jsp' method='post' onsubmit="return validateForm(this,'editCityErrorSection','editGenderErrorSection')">

  <div class="form-group row mx-md-n1">
    <label for="rollNumber" class="col-sm-2 col-form-label">Roll Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="rollNumber" name='rollNumber' readonly>
    </div>
  </div>
<input type="hidden" class="form-control" id="realName" name='realName' >

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
      <button type='button' class="btn btn-secondary  btn-block" onclick=showViewDetailDivision() data-toggle='tooltip' data-placement='right' title='Cancel Form'>Cancel</button>
    </div>
  </div>

</form>
</div>
<!-- Edit Form -->


<!-- View Detail Form -->
<div id='studentViewDetailDivision'>
<nav class='navbar navbar-light' style="background-color: #e3f2fd;">
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

</form>
</div>
<!-- View Detail Form -->

<jsp:include page='/MasterPageBottomSection.jsp' />