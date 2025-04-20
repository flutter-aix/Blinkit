<?php
include("../include/config.php");

if (!isset($_SESSION['pid'])) {
    header("Location: login.php");
    exit();
}

$pid = $_SESSION['pid'];

// Fetch the latest req_id for the patient from the blood_req table
$sql = "SELECT req_id FROM blood_req WHERE pid = ? ORDER BY request_time DESC LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $pid);
$stmt->execute();
$result = $stmt->get_result();
$request = $result->fetch_assoc();

if (!$request) {
    echo "No blood request found for the given patient ID.";
    exit();
}

$req_id = $request['req_id'];

// Fetch the blood group using req_id from blood_req table
$sql = "SELECT blood_group FROM approved_request WHERE req_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $req_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    $successMsg = "Your Request is not accepted yet!";

    // exit();
}

$user_blood_group = $user['blood_group'];

// Fetch donors with the same blood group from the donor_reg table
$sql = "SELECT * FROM donor_reg WHERE blood_group = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $user_blood_group);
$stmt->execute();
$donors = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donors</title>
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
  <script src="../dash_resource/js/sweetalert.js"></script>

</head>

<body>
<?php if ($successMsg): ?>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Swal.fire({
  title: "Your form is not approved yet! Our team will look into it.",
  icon: "info"
//   imageUrl: "../assets/images/doctor-2.png",
//   imageWidth: 400,
//   imageHeight: 200,
//   imageAlt: "Custom image"
});
        });
    </script>
    <?php endif; ?>
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
                                    <h4 class="card-title">Available Donors with Blood Group <?= htmlspecialchars($user_blood_group) ?></h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Donor ID</th>
                                                    <th>Name</th>
                                                    <th>Mobile</th>
                                                    <th>Email</th>
                                                    <th>Blood Group</th>
                                                    <th>Location</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php while ($row = $donors->fetch_assoc()) : ?>
                                                    <tr>
                                                        <td><?= htmlspecialchars($row['id']) ?></td>
                                                        <td><?= htmlspecialchars($row['full_name']) ?></td>
                                                        <td><?= htmlspecialchars($row['mobile_number']) ?></td>
                                                        <td><?= htmlspecialchars($row['email']) ?></td>
                                                        <td><?= htmlspecialchars($row['blood_group']) ?></td>
                                                        <td><?= htmlspecialchars($row['city']) ?></td>
<td><a class='btn btn-success btn-rounded btn-fw' href='request_donor.php?donor_id=<?= $row['id'] ?>&req_id=<?= $req_id ?>'>Request</a></td>

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
</body>

</html>
 