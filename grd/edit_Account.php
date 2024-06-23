<?php

include "connect.php";

header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: POST'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type');




if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $data = json_decode(file_get_contents("php://input"));

    if (isset($data->account_id) && isset($data->government) && isset($data->city) && isset($data->government_center) && isset($data->job) && isset($data->contact) && isset($data->emergency_contact)) {

        $stmt = $con->prepare("UPDATE users SET government = ?, city = ?, government_center = ?, job = ?, contact = ?, emergency_contact = ? WHERE account_id = ?");

        $stmt->bindValue(1, $data->government, PDO::PARAM_STR);
        $stmt->bindValue(2, $data->city, PDO::PARAM_STR);
        $stmt->bindValue(3, $data->government_center, PDO::PARAM_STR);
        $stmt->bindValue(4, $data->job, PDO::PARAM_STR);
        $stmt->bindValue(5, $data->contact, PDO::PARAM_STR);
        $stmt->bindValue(6, $data->emergency_contact, PDO::PARAM_STR);
        $stmt->bindValue(7, $data->account_id, PDO::PARAM_STR);

        if ($stmt->execute()) {

            $updatedDataStmt = $con->prepare("SELECT * FROM users WHERE account_id = ?");
            $updatedDataStmt->execute([$data->account_id]);
            $updatedData = $updatedDataStmt->fetch(PDO::FETCH_ASSOC);

            $modifiedValues = array_intersect_key($updatedData, array_flip(['account_id', 'government', 'city', 'government_center', 'job', 'contact', 'emergency_contact']));

            $response = ["status" => "success", "message" => "User data updated successfully.", "modified_values" => $modifiedValues];
        } else {

            $response = ["status" => "error", "message" => "Failed to update user data."];
        }
    } else {

        $response = ["status" => "error", "message" => "Required data missing."];
    }
} else {

    $response = ["status" => "error", "message" => "Invalid request method."];
}

echo json_encode($response);

?>
