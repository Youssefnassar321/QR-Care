<?php

include "../connect.php";
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: POST'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 

$required_fields = ['gender', 'national_id', 'job', 'government_city', 'city', 'government_center', 'contact', 'emergency_contact', 'emergency_name', 'government', 'password', 'confirm_password'];

foreach ($required_fields as $field) {
    if (!isset($_POST[$field]) || empty($_POST[$field])) {
        $response = ["status" => "fail", "message" => "Missing required field: $field"];
        echo json_encode($response);
        exit();
    }
}

// تنظيف البيانات المدخلة
$gender = filter_var($_POST["gender"], FILTER_SANITIZE_STRING); 
$national_id = filter_var($_POST["national_id"], FILTER_SANITIZE_STRING); 
$job = filter_var($_POST["job"], FILTER_SANITIZE_STRING); 
$government_city = filter_var($_POST["government_city"], FILTER_SANITIZE_STRING); 
$city = filter_var($_POST["city"], FILTER_SANITIZE_STRING); 
$government_center = filter_var($_POST["government_center"], FILTER_SANITIZE_STRING); 
$contact = filter_var($_POST["contact"], FILTER_SANITIZE_STRING); 
$emergency_contact = filter_var($_POST["emergency_contact"], FILTER_SANITIZE_STRING); 
$emergency_name = filter_var($_POST["emergency_name"], FILTER_SANITIZE_STRING); 
$government = filter_var($_POST["government"], FILTER_SANITIZE_STRING); 
$password = filter_var($_POST["password"], FILTER_SANITIZE_STRING); 
$confirm_password = filter_var($_POST["confirm_password"], FILTER_SANITIZE_STRING); 

if ($password !== $confirm_password) {
    $response = ["status" => "fail", "message" => "Passwords do not match"];
    echo json_encode($response);
    exit();
}

$account_id = generateAccountId($job); 
$imagename = imageupload("user_image", "../upload"); 

$user_id_image = imageupload("user_id_image", "../upload/user_ids");

$response = ["status" => "fail"];
if ($imagename === 'fail' || $user_id_image === 'fail') {
    $response["message"] = "Image upload failed";
} else {
    try {
        $stmt = $con->prepare("
            INSERT INTO `users` (`gender`, `national_id`, `job`, `government_city`, `city`, `government_center`, 
            `contact`, `emergency_contact`, `emergency_name`, `government`, `password`, 
            `confirm_password`, `user_image`, `account_id`, `date_of_birth`, `user_id`)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");

        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        $stmt->bindParam(1, $gender, PDO::PARAM_STR);
        $stmt->bindParam(2, $national_id, PDO::PARAM_STR);
        $stmt->bindParam(3, $job, PDO::PARAM_STR);
        $stmt->bindParam(4, $government_city, PDO::PARAM_STR);
        $stmt->bindParam(5, $city, PDO::PARAM_STR);
        $stmt->bindParam(6, $government_center, PDO::PARAM_STR);
        $stmt->bindParam(7, $contact, PDO::PARAM_STR);
        $stmt->bindParam(8, $emergency_contact, PDO::PARAM_STR);
        $stmt->bindParam(9, $emergency_name, PDO::PARAM_STR);
        $stmt->bindParam(10, $government, PDO::PARAM_STR);
        $stmt->bindParam(11, $password_hash, PDO::PARAM_STR);
        $stmt->bindParam(12, $password_hash, PDO::PARAM_STR);
        $stmt->bindParam(13, $imagename, PDO::PARAM_STR);
        $stmt->bindParam(14, $account_id, PDO::PARAM_STR);
        
        $date_of_birth = isset($_POST["date_of_birth"]) ? filter_var($_POST["date_of_birth"], FILTER_SANITIZE_STRING) : null;
        $stmt->bindParam(15, $date_of_birth, PDO::PARAM_STR);
        
        $stmt->bindParam(16, $user_id_image, PDO::PARAM_STR);

        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $lastInsertId = $con->lastInsertId();
            $selectStmt = $con->prepare("SELECT * FROM users WHERE id = ?");
            $selectStmt->execute([$lastInsertId]);
            $userData = $selectStmt->fetch(PDO::FETCH_ASSOC);

            $enteredValues = array_filter($userData, function ($value) {
                return $value !== null && $value !== '';
            });

            $response = ["status" => "success", "entered_values" => $enteredValues];
        } else {
            $response["message"] = "User creation failed";
        }
    } catch (PDOException $e) {
        $response["message"] = "Database error: " . $e->getMessage();
    } finally {
        $con = null;
    }
}

echo json_encode($response);

?>