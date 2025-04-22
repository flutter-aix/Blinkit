<?php
include("../include/config.php");

if (!isset($_SESSION['pid'])) {
    header("Location: login.php");
    exit();
}

if (!isset($_GET['donor_id']) || !isset($_GET['req_id'])) {
    echo "Invalid request. Missing donor or request ID.";
    exit();
}

$pid = $_SESSION['pid'];
$donor_id = $_GET['donor_id'];
$req_id = $_GET['req_id'];

// Insert the request into request_donor table
$sql = "INSERT INTO request_donor (pid, donor_id, req_id, request_time) VALUES (?, ?, ?, NOW())";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iii", $pid, $donor_id, $req_id);

if ($stmt->execute()) {
    // Fetch donor's email
    $sql = "SELECT full_name, email FROM donor_reg WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $donor_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $donor = $result->fetch_assoc();

    if (!$donor) {
        echo "Donor not found.";
        exit();
    }

    $donor_email = $donor['email'];
    $donor_name = $donor['full_name'];

    // Fetch patient's info
    $sql = "SELECT * FROM blood_req WHERE pid = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $pid);
    $stmt->execute();
    $result = $stmt->get_result();
    $patient = $result->fetch_assoc();

    if (!$patient) {
        echo "Patient information not found.";
        exit();
    }

    $patient_name = $patient['name'];
    $mobile_number = $patient['mobile_number'];
    $patient_location = $patient['location'];
    $landmarks = $patient['landmarks'];
    $blood_quantity = $patient['blood_quantity'];
    $user_message = $patient['message'];

    // Compose HTML Email
    $to = $donor_email;
    $subject = "Urgent Request for Blood Donation - Your Help is Needed!";
    $message = "
    <html>
    <head>
        <title>Urgent Request for Blood Donation</title>
        <style>
            body { font-family: Arial, sans-serif; color: #333; line-height: 1.6; }
            .container { width: 80%; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
            .header { background: #f4f4f4; padding: 10px; text-align: center; border-bottom: 1px solid #ddd; }
            .header h1 { margin: 0; }
            .content { padding: 20px; }
            .footer { text-align: center; padding: 10px; font-size: 12px; color: #777; }
            .highlight { color: #d9534f; }
            .button { display: inline-block; padding: 10px 20px; color: #fff; background-color: #5cb85c; text-decoration: none; border-radius: 5px; }
            .button:hover { background-color: #4cae4c; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h1>Urgent Request for Blood Donation</h1>
            </div>
            <div class='content'>
                <p>Dear $donor_name,</p>
                <p>You have a new blood donation request for a patient in need.</p>
                <p><strong>Patient Name:</strong> <span class='highlight'>$patient_name</span></p>
                <p><strong>Mobile Number:</strong> <span class='highlight'>$mobile_number</span></p>
                <p><strong>Requested Blood Quantity:</strong> <span class='highlight'>$blood_quantity</span></p>
                <p><strong>Location:</strong> <span class='highlight'>$patient_location</span></p>
                <p><strong>Landmarks:</strong> <span class='highlight'>$landmarks</span></p>
                <p><strong>Message from Patient:</strong> <span class='highlight'>$user_message</span></p>
                <p>Please log in to your dashboard to see more details.</p>
                <p><a href='#' class='button'>View Request</a></p>
                <p>P.S. Even if you're unavailable now, please spread the word!</p>
                <p>Thank you for your support!</p>
            </div>
            <div class='footer'>
                <p>&copy; 2024 DonateLife. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";

    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8\r\n";
    $headers .= "From: no-reply@donatelife.com\r\n";

    mail($to, $subject, $message, $headers);

    // ✅ Redirect to donor list with success flag
    header("Location: available_donor.php?msg=success");
    exit();
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
