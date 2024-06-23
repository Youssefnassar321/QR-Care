<?php

include "connect.php";

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Authorization, Content-Type');

function sanitizeInput($input) {
    return filter_var($input, FILTER_SANITIZE_STRING);
}

$child_id = sanitizeInput($_POST["child_id"]);

$child_image = imageupload("child_image", "upload");
$id_image = imageupload("id_image", "upload");

$response = ["status" => "fail"];

if ($child_image === 'fail' || $id_image === 'fail') {
    $response["message"] = "Image upload failed";
} else {
    try {
        $stmt = $con->prepare("
          INSERT INTO `child_files` (`child_id`, `child_image`, `id_image`)
          VALUES (?, ?, ?)");

        $stmt->bindParam(1, $child_id, PDO::PARAM_STR);
        $stmt->bindParam(2, $child_image, PDO::PARAM_STR);
        $stmt->bindParam(3, $id_image, PDO::PARAM_STR);

        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $response = [
                "status" => "success",
                "message" => "The child has been added successfully",
                "entered_data" => [
                    "child_id" => $child_id,
                    "child_image" => $child_image,
                    "id_image" => $id_image
                ]
            ];
        } else {
            $response["message"] = "Child ID addition failed";
        }
    } catch (PDOException $e) {
        $response["message"] = "Database error: " . $e->getMessage();
    } finally {
        $con = null;
    }
}

echo json_encode($response);

?>
