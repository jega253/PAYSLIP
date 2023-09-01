<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous"
    />

    <style>
      .bgimage {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <section class="vh-100" style="background-color: #94d6f4">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col col-xl-10">
            <div class="card" style="border-radius: 1rem">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img
                    src="image/lbgimage.jpg"
                    alt="login form"
                    class="bgimage"
                  />
                </div>
                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                  <div class="card-body p-4 p-lg-5 text-black">
                  
                    <form action="register" method="post" name="myform" id="myform" onsubmit="return validate(this)">
                      <div class="d-flex align-items-center mb-3 pb-1">
                        <i
                          class="fas fa-cubes fa-2x me-3"
                          style="color: #ff6219"
                        ></i>
                        <img src="image/logo1.jpg" width="65px" height="65px" />
                      </div>

                      <h5
                        class="fw-normal mb-3 pb-3"
                        style="letter-spacing: 1px"
                      >
                        Sign into your account
                      </h5>

                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form2Example17"
                          class="form-control form-control-lg"
                          name="username"
                          value="<%if(request.getAttribute("username")!=null) {
						        	  out.print(request.getAttribute("username"));
						          }
						          %>"
                        />
                        <label class="form-label" for="form2Example17"
                          >Username</label
                        >
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="password"
                          id="form2Example27"
                          name="password"
                          class="form-control form-control-lg"
                          
                        />
                        <label class="form-label" for="form2Example27"
                          >Password</label
                        >
                      </div>

                      <div class="pt-1 mb-4">
                        <button
                          class="btn btn-dark btn-lg btn-block"
                          type="submit" value="Login"
                        >
                          Login
					    </button>
					  <% if (request.getAttribute("error")!=null) { %>
					  <br>
					  <br>
					 
					  <h6 style="color: red;"><%=request.getAttribute("error") %></h6>
					<% } %>
                      </div>

                      <a class="small text-muted" href="#!">Forgot password?</a>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript">
    function validate(form)
    {
      var name = document.myform.username.value;
      var pass = document.myform.password.value;
      if(name=="" && pass=="" )
        {
        swal({
            icon: "error",
            title:"please enter username and password"
          });
         
        return false;
        }
     
    } 
   
    </script>
  </body>
</html>
