<?php
include("../include/config.php");

if (!isset($_SESSION['did'])) {
    header("Location: login.php");
    exit();
}

$did = $_SESSION['did'];

// Fetch the blood group of the donor
$sql = "SELECT blood_group FROM donor_reg WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $did);
$stmt->execute();
$result = $stmt->get_result();
$donor = $result->fetch_assoc();
$donor_blood_group = $donor['blood_group'];

// Fetch requests for this donor's blood group
$sql = "SELECT r.req_id, p.name, p.mobile_number,p.blood_group,p.weight,p.blood_quantity,p.gender,p.location,p.landmarks,p.message, br.request_time 
        FROM request_donor br
        JOIN blood_req p ON br.pid = p.pid
        JOIN blood_req r ON br.req_id = r.req_id
        WHERE br.donor_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $did);
$stmt->execute();
$requests = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>

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
  <link rel="shortcut icon" href="../dash_resource/images/favicon.png" /></head>
<body>
<div class="container-scroller">
    <?php include 'navbar.php' ?>
    <div class="container-fluid page-body-wrapper">
        <?php include 'sidebar.php' ?>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Blood Requests</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Request ID</th>
                                                <th>Patient Name</th>
                                                <th>Mobile</th>
                                                <th>Blood Group</th>
                                               
                                                <th>blood Quantity</th>
                                                <th>gender</th>
                                                <th>weight</th>
                                                <th>Location</th>
                                                <th>Landmarks</th>
                                                <th>Message</th>
                                                <th>Request Time</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php while ($row = $requests->fetch_assoc()) : ?>
                                                <tr>
                                                    <td><?= htmlspecialchars($row['req_id']) ?></td>
                                                    <td><?= htmlspecialchars($row['name']) ?></td>
                                                    <td><?= htmlspecialchars($row['mobile_number']) ?></td>
                                                    <td><?= htmlspecialchars($row['blood_group']) ?></td>
                                                    <td><?= htmlspecialchars($row['blood_quantity']) ?></td>
                                                    <td><?= htmlspecialchars($row['gender']) ?></td>
                                                    <td><?= htmlspecialchars($row['weight']) ?></td>
                                                    <td><?= htmlspecialchars($row['location']) ?></td>
                                                    <td><?= htmlspecialchars($row['landmarks']) ?></td>
                                                    <td><?= htmlspecialchars($row['message']) ?></td>





                                                    <td><?= htmlspecialchars($row['request_time']) ?></td>
                                                </tr>
                                            <?php endwhile; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2024. Donate Life. All rights reserved.</span>
                </div>
            </footer>
        </div>
    </div>
</div>
<script src="../dash_resource/vendors/js/vendor.bundle.base.js"></script>
<script src="../dash_resource/js/off-canvas.js"></script>
<script src="../dash_resource/js/hoverable-collapse.js"></script>
<script src="../dash_resource/js/template.js"></script>
<script src="../dash_resource/js/settings.js"></script>
<script src="../dash_resource/js/todolist.js"></script>
</body
