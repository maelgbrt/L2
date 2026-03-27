<?php 
header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

$links  = [
    [
    "title" => "USMB",
    "url" => "lien usmb",
    "category" => "taf"
    ],[
    "title" => "AUTRE",
    "url" => "lien AUTRE",
    "category" => "autre"
    ]
    ];
echo json_encode($links);