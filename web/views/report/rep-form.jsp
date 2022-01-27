<%@include file="../../resources/prereq.jsp"%>
<%-- active sidebar --%>
<%    
    title = "Disaster Information Relief System - Report";
    nav_dashboard = "";
    nav_users = "";
    nav_heatmap = "";
    nav_disaster = "active";
    nav_relief = "";
%>

<!doctype html>
<html lang="en">
  <%@include file="../../resources/head.jsp"%>
    <body>
        <%@include file="../../resources/header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../../resources/sidebar.jsp"%>

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
    <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../resources/feather-icons/feather.min.js"></script>
    <script src="../../resources/chartjs/chart.min.js"></script>
    <script src="../../resources/bootstrap/dashboard/dashboard.js"></script>
  </body>
</html>
