<?php

include "connect.php";

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Authorization, Content-Type');

$entered_code = filterRequest("verification_code");
$new_password = filterRequest("new_password");
$confirm_password = filterRequest("confirm_password");
$phone_number = filterRequest("contact");

$response = ["status" => "fail"];

try {

  $stmt = $con->prepare("SELECT * FROM verification_codes WHERE contact = ? ORDER BY created_at DESC LIMIT 1");
  $stmt->execute([$phone_number]);
  $verification_data = $stmt->fetch(PDO::FETCH_ASSOC);


  if ($verification_data && $verification_data['expires_at'] > date('Y-m-d H:i:s')) {
    $stored_code = $verification_data['verification_code'];


    if ($entered_code === $stored_code) {
      if ($new_password === $confirm_password) {
        $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);
        $hashed_confirm_password = password_hash($confirm_password, PASSWORD_BCRYPT);
        $updateStmt = $con->prepare("UPDATE users SET password = ?, confirm_password = ? WHERE contact = ?");
        $updateStmt->execute([$hashed_password, $hashed_confirm_password, $phone_number]);

        if ($updateStmt->rowCount() > 0) {

          $deleteStmt = $con->prepare("DELETE FROM verification_codes WHERE contact = ?");
          $deleteStmt->execute([$phone_number]);

          $response = [
            "status" => "success",
            "message" => "Password reset successfully",
            "reset_details" => [ 
              "verification_code" => $entered_code,
              "new_password" => $new_password,
              "confirm_password" => $confirm_password,
              "phone_number" => $phone_number,
            ]
          ];
        } else {
          $response["message"] = "Password reset failed";
        }
      } else {
        $response["message"] = "Passwords do not match";
      }
    } else {
      $response["message"] = "Invalid verification code";
    }
  } else {
    $response["message"] = "Invalid or expired verification code";
  }
} catch (PDOException $e) {
  $response["message"] = "Database error: " . $e->getMessage();
}

echo json_encode($response);
?>
