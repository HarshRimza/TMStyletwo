<jsp:useBean id='messageBean' scope='request' class='com.thinking.machines.school.beans.MessageBean' />
<!DOCTYPE html>

<html lang="en">


<head>

  
<meta charset="utf-8">
  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  
<meta name="author" content="">

  
<title>Login Here</title>

  
<link rel='shortcut icon' type='images/x-icon' href='/styletwo/images/avtar3.png' >
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<script>
function showError()
{
var message= "<jsp:getProperty name='messageBean' property='message' />";
if(message.length!=0)
{
var a="<div class='alert alert-primary alert-dismissible fade show' role='alert'>";
a=a+"<strong>Oh, </strong><jsp:getProperty name='messageBean' property='message' />";
a=a+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
a=a+"<span aria-hidden='true'>&times;</span>";
a=a+"</button>";
a=a+"</div>";
document.getElementById("errorMessage").innerHTML=a;
}
}

function validateLoginForm(loginForm)
{
var username=loginForm.username.value.trim();
if(username.length==0)
{
alert("Username Required");
loginForm.username.focus();
return false;
}
var dateOfBirth=loginForm.dateOfBirth.value.trim();
if(dateOfBirth.length==0)
{
alert("Date of Birth Required");
loginForm.dateOfBirth.focus();
return false;
}
return true;
}
window.addEventListener('load',showError);
</script>
</head>


<body class="bg-gradient-primary">


  <div class="container">


    <!-- Outer Row -->

    <div class="row justify-content-center">


      <div class="col-xl-10 col-lg-12 col-md-9">


        <div class="card o-hidden border-0 shadow-lg my-5">

          <div class="card-body p-0">

            <!-- Nested Row within Card Body -->

            <div class="row">

              <div class="col-lg-6 d-none d-lg-block text-center">
                <img src="/styletwo/images/avtar3.png"  style="margin:10px;max-width:100%;height:95%;"></img>
              </div>

              <div class="col-lg-6">

                <div class="p-5">

                  <div class="text-center">

                    <h1 class="h4 text-gray-900 mb-4">Login Here!</h1>

                  </div>

                  <div  id='errorMessage' >
                  </div>
                  <form class="user" action='/styletwo/login' method="post" onsubmit='return validateLoginForm(this)'>

                    <div class="form-group">

                      <input type="text" class="form-control form-control-user" id="username" name="username" aria-describedby="emailHelp" placeholder="Username" required>

                    </div>

                    <div class="form-group">

                      <input type="date" class="form-control form-control-user" id="dateOfBirth" name='dateOfBirth' required>

                    </div>

                    <button type='submit' class="btn btn-primary btn-user btn-block">

                      Login

                    </button>

                  </form>

                 </div>

              </div>

            </div>

          </div>

        </div>


      </div>


    </div>


  </div>


  <!-- Bootstrap core JavaScript-->
  
<script src="vendor/jquery/jquery.min.js"></script>
  
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  
<!-- Core plugin JavaScript-->
  
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  
<!-- Custom scripts for all pages-->
  
<script src="js/sb-admin-2.min.js">
</script>


</body>


</html>
