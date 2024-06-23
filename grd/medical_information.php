<?php

header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: GET'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 

include "connect.php";

try {
    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        if (isset($_GET['national_id'])) {
            $national_id = filter_var($_GET['national_id'], FILTER_SANITIZE_STRING);

            $response = [];

            $stmt = $con->prepare("SELECT * FROM medical_analysis WHERE national_id = ?");
            $stmt->execute([$national_id]);
            $response['medical_analysis'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $stmt = $con->prepare("SELECT * FROM medical_tests WHERE national_id = ?");
            $stmt->execute([$national_id]);
            $response['medical_tests'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $stmt = $con->prepare("SELECT * FROM user_allergies WHERE national_id = ?");
            $stmt->execute([$national_id]);
            $response['user_allergies'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $stmt = $con->prepare("SELECT * FROM user_diseases WHERE national_id = ?");
            $stmt->execute([$national_id]);
            $response['user_diseases'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $data_found = false;
            foreach ($response as $table => $data) {
                if (!empty($data)) {
                    $data_found = true;
                    break;
                }
            }

            if ($data_found) {
                echo json_encode(["status" => "success", "data" => $response]);
            } else {
                echo json_encode(["status" => "fail", "message" => "No medical data found for national ID " . $national_id]);
            }
        } else {
            echo json_encode(["status" => "fail", "message" => "national_id is required"]);
        }
    } else {
        echo json_encode(["status" => "fail", "message" => "Invalid request method"]);
    }
} catch (PDOException $e) {
    echo json_encode(["status" => "fail", "message" => "Database error: " . $e->getMessage()]);
}

?>