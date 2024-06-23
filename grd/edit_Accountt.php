<?php

include "connect.php";

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Authorization, Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    if (isset($_GET['account_id']) && isset($_GET['government']) && isset($_GET['city']) && isset($_GET['government_center']) && isset($_GET['job']) && isset($_GET['contact']) && isset($_GET['emergency_contact'])) {
        $account_id = $_GET['account_id'];
        $government = $_GET['government'];
        $city = $_GET['city'];
        $government_center = $_GET['government_center'];
        $job = $_GET['job'];
        $contact = $_GET['contact'];
        $emergency_contact = $_GET['emergency_contact'];

        $stmt = $con->prepare("SELECT * FROM users WHERE account_id = ?");
        $stmt->execute([$account_id]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $stmt = $con->prepare("UPDATE users SET government = ?, city = ?, government_center = ?, job = ?, contact = ?, emergency_contact = ? WHERE account_id = ?");

            $stmt->bindValue(1, $government, PDO::PARAM_STR);
            $stmt->bindValue(2, $city, PDO::PARAM_STR);
            $stmt->bindValue(3, $government_center, PDO::PARAM_STR);
            $stmt->bindValue(4, $job, PDO::PARAM_STR);
            $stmt->bindValue(5, $contact, PDO::PARAM_STR);
            $stmt->bindValue(6, $emergency_contact, PDO::PARAM_STR);
            $stmt->bindValue(7, $account_id, PDO::PARAM_STR);

            if ($stmt->execute()) {
                $updatedDataStmt = $con->prepare("SELECT * FROM users WHERE account_id = ?");
                $updatedDataStmt->execute([$account_id]);
                $updatedData = $updatedDataStmt->fetch(PDO::FETCH_ASSOC);

                $modifiedValues = array_intersect_key($updatedData, array_flip(['account_id', 'government', 'city', 'government_center', 'job', 'contact', 'emergency_contact']));

                $response = ["status" => "success", "message" => "تم تحديث بيانات المستخدم بنجاح.", "modified_values" => $modifiedValues];
            } else {
                $response = ["status" => "error", "message" => "فشل تحديث بيانات المستخدم."];
            }
        } else {
            $response = ["status" => "error", "message" => "حساب المستخدم غير موجود."];
        }
    } else {
        $response = ["status" => "error", "message" => "البيانات المطلوبة مفقودة."];
    }
} else {
    $response = ["status" => "error", "message" => "طريقة الطلب غير صالحة."];
}

echo json_encode($response);

?>