<?php

header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: GET'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 

include "connect.php";

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    if (isset($_GET['national_id'])) {
        $national_id = filter_var($_GET['national_id'], FILTER_SANITIZE_STRING);

        try {
            $response = [];

            $stmt = $con->prepare("SELECT * FROM users WHERE national_id = ?");
            $stmt->execute([$national_id]);
            $user_data = $stmt->fetch(PDO::FETCH_ASSOC);
            $response['user'] = $user_data;

            if ($user_data) {
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

                $stmt = $con->prepare("SELECT * FROM user_conscription_status WHERE national_id = ?");
                $stmt->execute([$national_id]);
                $response['user_conscription_status'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

                echo json_encode(["status" => "success", "data" => $response]);
            } else {
                echo json_encode(["status" => "fail", "message" => "No data found for national ID " . $national_id]);
            }

            $stmt->closeCursor();
            $con = null;
        } catch (PDOException $e) {
            echo json_encode(["status" => "fail", "message" => "Database error: " . $e->getMessage()]);
        }
    } else {
        echo json_encode(["status" => "fail", "message" => "national_id is required"]);
    }
} else {
    echo json_encode(["status" => "fail", "message" => "Invalid request method"]);
}

?>