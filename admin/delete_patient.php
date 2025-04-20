<?php
include ("../include/config.php");

if(isset($_GET['pid'])){
    $pid = $_GET['pid'];
    $sql = "DELETE from patient_reg where pid= $pid";
    $conn->query($sql);
}

header('location: manage_patients.php')

?>