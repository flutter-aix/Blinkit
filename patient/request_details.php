<?php

include("../include/config.php");
include("checkLogin.php");
$pid = $_SESSION['pid']; // Retrieve pid from session

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
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Request Details</h4>

                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Req ID</th>
                                                    <th>Name</th>
                                                    <th>Mobile No</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Gender</th>
                                                    <th>Blood Group</th>
                                                    <th>Blood Quantity</th>
                                                    <th>Weight</th>
                                                    <th>Location</th>
                                                    <th>Landmarks</th>
                                                    <th>Requisition Form</th>
                                                    <th>Request TIme</th>

                                                    <th>Status</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                            <?php
                                                $sql = "SELECT * FROM blood_req WHERE pid = ? ORDER BY req_id DESC";
                                                $stmt = $conn->prepare($sql);
                                                $stmt->bind_param("i", $pid);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                while ($row = $result->fetch_assoc()) {

                                                    
                                                    echo "  <tr>";

                                                            echo " <td>$row[req_id]</td>";
                                                            echo " <td>$row[name]</td>";
                                                            echo " <td>$row[mobile_number]</td>";
                                                            echo " <td>$row[birth_date]</td>";
                                                            echo " <td>$row[gender]</td>";
                                                            echo " <td>$row[blood_group]</td>";
                                                            echo " <td>$row[blood_quantity]</td>";

                                                            echo " <td>$row[weight]</td>";
                                                            echo " <td>$row[location]</td>";
                                                            echo " <td>$row[landmarks]</td>";
                                                            echo " <td>$row[req_form_path]</td>";
                                                            echo " <td>$row[request_time]</td>";
                                                            echo " <td><span class='badge badge-warning'> $row[status]</td></span>";
                                                            
                                                            echo "  </tr>";
                                                          
                                                }
                                                
                                                $stmt->close();
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

            
</body>

</html>