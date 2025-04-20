<?php

include("../include/config.php");
include("checkLogin.php");

// if (isset($_SESSION['admin_loggedin']) || $_SESSION['admin_loggedin'] === true) {
//   header('Location: login.php');
//   exit;
// }


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
    <link rel="stylesheet" href="../dash_resource/css/vertical-layout-light/sweetalert.css">

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
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Manage Donors</h4>
                                  <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Id
                                                    </th>
                                                    <th>
                                                        Name
                                                    </th>
                                                    <th>
                                                        email
                                                    </th>
                                                    <th>
                                                        Mobile
                                                    </th>
                                                    <th>
                                                        Gender
                                                    </th>
                                                    <th>
                                                        Blood Group
                                                    </th>
                                                    <th>
                                                        weight
                                                    </th>
                                                 
                                                    <th>
                                                        District
                                                    </th>
                                                    <th>
                                                        City
                                                    </th>
                                                    <th>
                                                        Zip code
                                                    </th>
                                                    <th>
                                                        Area
                                                    </th>
                                                    <th>
                                                        Landmarks
                                                    </th>

                                                    <th>
                                                        Actions
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php
                                                $sql = "select * from donor_reg";
                                                $result = $conn->query($sql);
                                                if (!$result) {
                                                    die("Invalid Query");
                                                }
                                                while ($row = $result->fetch_assoc()) {


                                                    
                                                          echo "  <tr>";
                                                           echo " <td>$row[id]</td>";
                                                           echo" <td>$row[full_name]</td>";
                                                            echo " <td>$row[email]</td>";
                                                            echo "<td>$row[mobile_number]</td>";
                                                            echo "<td>$row[gender]</td>";
                                                            echo "<td>$row[blood_group]</td>";
                                                        echo " <td>$row[weight]</td>";
                                                            echo "<td>$row[district]</td>";
                                                            echo "<td>$row[city]</td>";
                                                            echo "<td>$row[zip_code]</td>";
                                                            echo "<td>$row[area]</td>";
                                                            echo "<td>$row[landmarks]</td>";
                                                        echo " <td>
                                                           <a class = 'btn btn-success btn-rounded btn-fw' href='update_donor.php?id=$row[id]'>Edit</a>

                                                            <a class = 'btn btn-danger btn-rounded btn-fw' onclick='confirmDelete($row[id])'>Delete</a>
                                                          </td>";
                                                         echo "   </tr>";
                                                            
                                                }
                                                ?>
                                            </tbody>
                                        </table>
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
            <script src="../dash_resource/js/sweetalert1.js"></script>


            <!-- End custom js for this page-->

            <script>
      function confirmDelete(id) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this record!",
        icon: "warning",
        buttons: ["Cancel", "Yes"],
        dangerMode: true,
    })
    .then((willDelete) => {
        if (willDelete) {
            // Simulating an async action (e.g., AJAX call)
            setTimeout(() => {
                swal({
                    title: "Deleted!",
                    text: "The record has been deleted.",
                    icon: "success",
                    button: "OK",
                }).then(() => {
                    // Redirect to the delete endpoint after showing the success message
                    window.location.href = 'delete_donor.php?id=' + id;
                });
            }, 500);
        } else {
            swal({
                text: "Your data is safe!",
                icon: "info",
                button: "OK"
            });
        }
    });
}

    </script>
</body>

</html>