<?php
header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

if (!isset($_GET["action"])) {
    echo json_encode(["error" => "Action is mandatory!!!"]);
    die();
}

if ($_GET["action"] == "load") {

    echo file_get_contents("bookmark.json");

}

if ($_GET["action"] == "save") {

    $post = json_decode(file_get_contents('php://input'), true);
    $data = json_decode(file_get_contents("bookmark.json"));
    $data[] = [
        "title" => $post["title"],
        "url" => $post["url"],
        "category" => $post["category"]
    ];
    file_put_contents(
        "bookmark.json", 
        json_encode($data, JSON_PRETTY_PRINT));

        echo json_encode(["ok" => true]);

}