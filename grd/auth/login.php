<?php

include "../connect.php";

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Authorization, Content-Type');

$response = [];

if (!isset($_POST["account_id"]) || !isset($_POST["password"])) {
    $response = ["status" => "fail", "message" => " الإدخالات غير صالحة"];
    http_response_code(400); 
    echo json_encode($response);
    exit;
}

$account_id = $_POST["account_id"];
$password = $_POST["password"];

try {
    $stmt = $con->prepare("SELECT * FROM users WHERE account_id = :account_id");
    $stmt->bindValue(':account_id', $account_id, PDO::PARAM_STR);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        if (password_verify($password, $user['password'])) {
            $enteredValues = array_filter($user, function ($value) {
                return $value !== null && $value !== '';
            });
            unset($enteredValues['password']); 

            $response = ["status" => "success", "message" => "تم تسجيل الدخول بنجاح", "entered_values" => $enteredValues];
        } else {
            $response = ["status" => "fail", "message" => "كلمة المرور غير صحيحة"];
        }
    } else {
        $response = ["status" => "fail", "message" => "حساب المستخدم غير موجود"];
    }
} catch (PDOException $e) {
    $response = ["status" => "error", "message" => "حدث خطأ في قاعدة البيانات"];
}

http_response_code(200);
echo json_encode($response);

?>