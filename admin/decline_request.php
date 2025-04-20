 <?php
 include ("../include/config.php");
 if (isset($_GET['accept_id'])) {
    $accept_id = $_GET['accept_id'];

    // Begin transaction
    $conn->begin_transaction();

    // Deleting from blood_req table
    $sql = "DELETE FROM blood_req WHERE req_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $accept_id);
    $stmt->execute();

    $conn->commit();
    echo "hello";
 }
 header('location: blood_request.php')

    ?>