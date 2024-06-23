<?php
header('Access-Control-Allow-Origin:*'); 
header('Content-Type: application/json'); 
header('Access-Control-Allow-Methods: POST'); 
header('Access-Control-Allow-Headers: Authorization, Content-Type'); 

if (!function_exists('generateVerificationCode')) {
    function generateVerificationCode($length = 4) {
        $characters = '0123456789';
        $randomString = '';

        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }

        return $randomString;
    }
}

if (!function_exists('storeVerificationCode')) {
    function storeVerificationCode($contact, $verificationCode) {
        global $con;

        $expiresAt = date('Y-m-d H:i:s', strtotime('+15 minutes'));

        $stmt = $con->prepare("INSERT INTO verification_codes (contact, verification_code, created_at, expires_at) VALUES (?, ?, ?, ?)");
        $stmt->execute([$contact, $verificationCode, date('Y-m-d H:i:s'), $expiresAt]);
    }
}

if (!function_exists('generateAccountId')) {
    function generateAccountId($job) {
        $randomId = uniqid();
        $randomId = substr($randomId, 0, 8);

        $prefix = '';
        switch ($job) {
            case 'doctor':
                $prefix = 'doctor';
                break;
            case 'police officer':
                $prefix = 'officer';
                break;
            default:
                $prefix = 'other';
                break;
        }

        return $prefix . '_'. $randomId . ".com";
    }
}

if (!function_exists('filterRequest')) {
    function filterRequest($requestname) {
        return htmlspecialchars(strip_tags($_POST[$requestname]));
    }
}

if (!function_exists('imageupload')) {
    function imageupload($imageRequest, $destinationDirectory) {
        global $msgError;
        $imagename = $_FILES[$imageRequest]['name'];
        $imagetmp = $_FILES[$imageRequest]['tmp_name'];
        $imagesize = $_FILES[$imageRequest]['size'];
        $allowExt = array("jpg", "png", "gif", "jpeg", "pdf");
        $strToArray = explode(".", $imagename);
        $ext = end($strToArray);
        $ext = strtolower($ext);

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError[] = "Ext";
        }

        if ($imagesize > 2 * 1024 * 1024) {
            $msgError[] = "size";
        }

        if (empty($msgError)) {
            // Check if the directory exists, if not create it
            if (!is_dir($destinationDirectory)) {
                mkdir($destinationDirectory, 0777, true);
            }

            if (move_uploaded_file($imagetmp, $destinationDirectory . "/" . $imagename)) {
                return $imagename;
            } else {
                return "fail";
            }
        } else {
            return "fail";
        }
    }
}

?>