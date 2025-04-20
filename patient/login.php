<?php
error_reporting(0);
include("../include/config.php");

if ($_SESSION['patient_loggedin']) {
    header('Location: dashboard.php');
    exit;
}
if (isset($_POST['login'])) {
  $email = $_POST['email'];
  $password = $_POST['password'];

  $query = "SELECT * FROM patient_reg WHERE email = ?";
  $stmt = $conn->prepare($query);
  $stmt->bind_param("s", $email);
  $stmt->execute();
  $result = $stmt->get_result();
  $count = $result->num_rows;

  if ($count == 1) {
      $row = $result->fetch_assoc();
      $hash = $row['password'];
      $pid = $row['pid'];  // Fetch the pid from the result

      if (password_verify($password, $hash)) {
          $_SESSION['admin_loggedin'] = false;
          $_SESSION['donor_loggedin'] = false;
          $_SESSION['patient_loggedin'] = true;
          $_SESSION['userrole'] = 'Patient';
          $_SESSION['email'] = $email;
          $_SESSION['pid'] = $pid;  // Set the pid in the session

        
          header("Location: dashboard.php");
          exit();
          
      
          
      } else {
        $errorMsg = "Loggedin Failed!";  
      }
  } else {
    $errorMsg1 = "login failed!";
      }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Donate Life</title>

  <!-- favicon-->
  <link rel="shortcut icon" href="../favicon.svg" type="image/svg+xml">

  <!--css-->
  <link rel="stylesheet" href="../assets/css/style.css">

  <!-- google font link-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Roboto:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../dash_resource/css/vertical-layout-light/sweetalert.css">
  <script src="../dash_resource/js/sweetalert.js"></script>
  <style>
    hr {
      border: none;
      height: 1px;
      background-color: #c5c7c9;
      margin: 20px 0;
    }

    /* Form Styles */
    .form-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: #f9f9f9;
      border-radius: 10px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-title {
      color: var(--oxford-blue-1);
      font-family: var(--ff-poppins);
      font-size: 3.4rem;
      font-weight: var(--fw-800);
      text-align: center;
      margin-bottom: 20px;
    }

    .form-section {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }

    .form-field {
      flex: 0 0 48%;
      margin-bottom: 20px;
    }

    .form-field label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-field input,
    .form-field select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .form-field input[type="submit"] {
      background-color: #216aca;
      color: #fff;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
    }

    .form-field input[type="submit"]:hover {
      background-color: #060952;
    }

    .form-title-login {
      text-align: center;
      margin-top: 30px;
      font-family: var(--ff-poppins);
      font-size: 1.8rem;
      color: #216aca;
    }

    .form-title-login a {
      color: #216aca;
      text-decoration: underline;
    }

    .form-title-login a:hover {
      color: #03d9ff;
    }
  </style>

</head>

<body>
<?php if ($errorMsg): ?>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Swal.fire({
                title: '<?php echo $errorMsg; ?>',
                text: 'Email and password doesnot matched!',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        });
    </script>
    <?php endif; ?>
    <?php if ($errorMsg1): ?>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Swal.fire({
                title: '<?php echo $errorMsg1; ?>',
                text: 'User doesnot exits, Signup first.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        });
    </script>
    <?php endif; ?>
  <header class="header">
    <div class="header-top">
      <div class="container">
        <ul class="contact-list">
          <li class="contact-item">
            <ion-icon name="mail-outline"></ion-icon>
            <a href="mailto:donatelife@gmail.com" class="contact-link">donatelife@gmail.com</a>
          </li>
          <li class="contact-item">
            <ion-icon name="call-outline"></ion-icon>
            <a href="tel:+977-9863442248" class="contact-link">+977-9863442248</a>
          </li>
        </ul>
        <ul class="social-list">
          <li>
            <a href="https://www.facebook.com/andro.pool.54?mibextid=ZbWKwL" class="social-link">
              <ion-icon name="logo-facebook"></ion-icon>
            </a>
          </li>
          <li>
            <a href="https://www.instagram.com/_vladimir_putin.___/" class="social-link">
              <ion-icon name="logo-instagram"></ion-icon>
            </a>
          </li>
          <li>
            <a href="https://twitter.com/Annabel07785340" class="social-link">
              <ion-icon name="logo-twitter"></ion-icon>
            </a>
          </li>
          <li>
            <a href="https://youtu.be/Af0gk_kiGac" class="social-link">
              <ion-icon name="logo-youtube"></ion-icon>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <?php include '../navbar.php'; ?>

  </header>

  <main>
    <article>
      <section class="section hero" id="home" style="background-image: url('../assets/images/hero-bg.png'); margin: 0%;" aria-label="hero">
        <!-- Login and Registration Form -->
        <div class="container">
          <div class="form-container">
            <div class="form-title">Login</div>
            <hr><br><br>
            <form action="" method="POST">
              <div class="form-section">
                <div class="form-field">
                  <label for="email">Email:</label>
                  <input type="email" id="email" name="email" required>
                </div>
                <div class="form-field">
                  <label for="password">Password:</label>
                  <input type="password" id="password" name="password" required>
                </div>
                <div class="form-field">
                  <label for="remember_me">Remember Me:</label>
                  <input type="checkbox" id="remember_me" name="remember_me" value="1">
                </div>
              </div><br>
              <button type="submit" name="login" class="btn">Login</button>
            </form><br><br>
            <div class="form-title">Not Registered? <u><a href="register.php" style="display: inline; color: #216aca;" onmouseover="this.style.color='#03d9ff'" onmouseout="this.style.color='#216aca'">Register Here</a></u></div>
          </div>
          <figure class="hero-banner">
            <img src="../assets/images/bg.svg" width="587" height="839" alt="hero banner" class="w-100">
            <center>
              <h1>Welcome back</h1>
            </center>
          </figure>
        </div>
      </section>
    </article>
  </main>
  <?php include '../footer.php'; ?> <!--BACK TO TOP-->
  <a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
    <ion-icon name="caret-up" aria-hidden="true"></ion-icon>
  </a>

  <!--custom js link-->
  <script src="../assets/js/script.js" defer></script>
  <!--ionicon link-->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>