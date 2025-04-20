<?php
include("../include/config.php");

if (!isset($_SESSION['pid'])) {
    header("Location: login.php");
    exit();
}

$pid = $_SESSION['pid'];
$donor_id = $_GET['donor_id'];
$req_id = $_GET['req_id'];


// echo "Donor ID: " . htmlspecialchars($donor_id) . "<br>";
// echo "Request ID: " . htmlspecialchars($req_id) . "<br>";

// Insert the request into blood_requests table
$sql = "INSERT INTO request_donor (pid, donor_id, req_id, request_time) VALUES (?, ?, ?, NOW())";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iii", $pid, $donor_id, $req_id);

if ($stmt->execute()) {
    // Fetch donor's email
    $sql = "SELECT email FROM donor_reg WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $donor_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $donor = $result->fetch_assoc();
    $donor_email = $donor['email'];

    // Send email to the donor
    $to = $donor_email;
    $subject = "Urgent Request for Blood Donation - Your Help is Needed!";
    $message = 
    "You have a new blood donation request. Please log in to your dashboard to see the details.
    
    P.S. Even if you are unable to donate at this time, please help us spread the word by sharing this message with your friends, family, and colleagues.
    Thank you for your support!";
    $headers = "From: no-reply@donatelife.com";

    mail($to, $subject, $message, $headers);

    // Redirect to donor dashboard
    header("Location: request_donor.php");
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
