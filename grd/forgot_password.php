<?php

include "connect.php";
header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: POST'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 


$phone_number = filterRequest("contact");

$response = ["status" => "fail"];


try {
    $stmt = $con->prepare("SELECT * FROM users WHERE contact = ?");
    $stmt->execute([$phone_number]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $verification_code = generateVerificationCode();
        storeVerificationCode($phone_number, $verification_code);

       

        $response = [
            "status" => "success",
            "message" => "Verification code sent",
            "phone_number" => $phone_number,
            "verification_code" => $verification_code 
        ];
    } else {
        $response["message"] = "No account found with this phone number";
    }
} catch (PDOException $e) {
    $response["message"] = "Database error: " . $e->getMessage();
}

echo json_encode($response);
?>