<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Disaster Information Relief System - Dashboard</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    

    <!-- Bootstrap core CSS -->
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../resources/bootstrap/dashboard/dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Team 4 - Red Shirt Kids</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Sign out</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/index.jsp">
              <span data-feather="home"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              Forum
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="map"></span>
              Disaster Heat Map
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/report/report.jsp">
              <span data-feather="alert-circle"></span>
              Report a Disaster
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="flag"></span>
              Request Relief/Help
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1">
          <a class="nav-link" href="#">
            <span data-feather="book-open"></span>
            Your Disaster Reports
          </a>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Report #1
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Report #2
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Report #3
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Report #4
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Report</h1>
      </div>

      <form class="reportForm" method="post" enctype="application/x-www-form-urlencoded" action="reportController">

            <p>
            <label>Location
            <input type="text" name="location_name" required>
            </label> 
            </p>
            
            <p>
                <label>Type of Disaster
            <select id="disaster_type" name="disaster_type">
            <option value="" selected="selected">Select One</option>
            <option value="flood" >Flood</option>
            <option value="fire" >Fire</option>
            <option value="earthquake" >Earthquake</option>
            <option value="landslide" >Landslide</option>
            </select>
            </label> 
            </p>

            <fieldset>
            <label>Type of Assistance</label>
            <br>
            <p><label class="choice"> <input type="checkbox" name="asst_type" value="meal"> Meals </label></p>
            <p><label class="choice"> <input type="checkbox" name="asst_type" value="clothing"> Clothing </label></p>
            <p><label class="choice"> <input type="checkbox" name="asst_type" value="shelter"> Shelter </label></p>
            <p><label class="choice"> <input type="checkbox" name="asst_type" value="rescue"> Rescue </label></p>
            </fieldset>

            <fieldset>
            <label>Allow assistance from</label>
            <br>
            <p><label class="choice"> <input type="checkbox" name="asst_source" value="community"> Community </label></p>
            <p><label class="choice"> <input type="checkbox" name="asst_source" value="agencies"> Agencies </label></p>
            </fieldset>

            <p><button>Report</button></p>

      </form>

    </main>
  </div>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/feather-icons/feather.min.js"></script>
    <script src="../resources/chartjs/chart.min.js"></script>
    <script src="../resources/bootstrap/dashboard/dashboard.js"></script>
  </body>
</html>
