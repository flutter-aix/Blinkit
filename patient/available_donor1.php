<?php

include("../include/config.php");
include("checkLogin.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../dash_resource/vendors/feather/feather.css">
    <link rel="stylesheet" href="../dash_resource/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../dash_resource/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="../dash_resource/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="../dash_resource/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="../dash_resource/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../dash_resource/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../dash_resource/images/favicon.png" />
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <?php include 'navbar.php' ?>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">

            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <?php include 'sidebar.php' ?>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="row">
                                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                    <!-- <center>
                                        <h3 class="text-primary">Here are the nearest available donors for you. </h3>
                                    </center> -->
                                    <section class="section service" id="service" aria-label="service">
        <div class="container">
          <p class="section-subtitle text-center">Find the nearest Donor For You</p>
          <h2 class="h2 section-title text-center">FIND DONOR</h2>

          <!-- Replace the existing content with your form -->
          <form class="donor-form" method="post" action="">
            

          

            <div class="form-group">
              <label for="blood-type">Blood Type:</label>
              <select id="blood-type" name="blood-type">
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
              </select>
            </div>
            <div class="form-group">
              <label for="city">City:</label>
              <input type="text" id="city" name="city" required>
            </div>

            <button type="submit" class="btn">Find Donor</button>
          </form>
          <?php
        
          
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $blood_group = $_POST["blood-type"];
  $city = $_POST["city"];
          $sql = "SELECT COUNT(*) AS count FROM donor_reg WHERE blood_group = ? AND city = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $blood_group, $city);
            $stmt->execute();
            $result = $stmt->get_result();
            $row = $result->fetch_assoc();
            $count = $row['count'];

        
            echo "<script>
            Swal.fire({
              title: ' " . $count . " " . $blood_group . " blood group donor is available to donate in this city!',
              text: 'Register to request for blood donations.',
              icon: 'success',
              showClass: {
                popup: `
                  animate__animated
                  animate__fadeInUp
                  animate__faster
                `
              },
              hideClass: {
                popup: `
                  animate__animated
                  animate__fadeOutDown
                  animate__faster
                `
              }
            });
          </script>";

            $stmt->close();
            $conn->close();
}
          ?>


        </div>
      </section>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2024. Donate Life <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
                        <!-- <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span> -->
                    </div>
                    <!-- <div class="d-sm-flex justify-content-center justify-content-sm-between">
          <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span>
        </div> -->
                </footer>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->

    <!-- plugins:js -->
    <script src="../dash_resource/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="../dash_resource/vendors/chart.js/Chart.min.js"></script>
    <script src="../dash_resource/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="../dash_resource/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="../dash_resource/js/dataTables.select.min.js"></script>

    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../dash_resource/js/off-canvas.js"></script>
    <script src="../dash_resource/js/hoverable-collapse.js"></script>
    <script src="../dash_resource/js/template.js"></script>
    <script src="../dash_resource/js/settings.js"></script>
    <script src="../dash_resource/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="../dash_resource/js/dashboard.js"></script>
    <script src="../dash_resource/js/Chart.roundedBarCharts.js"></script>
    <!-- End custom js for this page-->
</body>

</html>