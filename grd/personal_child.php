<?php

header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: GET'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 

include "connect.php"; 

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    if (isset($_GET['national_id'])) {
        $nationalId = $_GET['national_id'];

        $sql = "SELECT * FROM children WHERE national_id = ?";

        $stmt = $con->prepare($sql); 

        $stmt->bindParam(1, $nationalId, PDO::PARAM_STR);

        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $childData = $stmt->fetch(PDO::FETCH_ASSOC);

            echo json_encode($childData);
        } else {
            echo json_encode(['error' => 'National ID does not exist']);
        }
    } else {
        echo json_encode(['error' => 'Missing query parameter: national_id']);
    }
} else {
    header('HTTP/1.1 405 Method Not Allowed');
    echo json_encode(['error' => 'Invalid request method']);
}

?>