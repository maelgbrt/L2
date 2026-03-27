<?php
// delete("/activities/:activitiesId/marks", function ($param) {
//     $activity_id = $param['activitiesId'];
//     $mysql = db(); 

//     $sql_delete = "DELETE FROM marks WHERE activitiesId = '$activity_id'";
//     $result = mysqli_query($mysql, $sql_delete);

//    if($result){
//     return ["success"=>true];
//     }else{
//     return ["success"=>false];

//  }
// });





delete("/activities/:activitiesId/marks", function ($param) {
    $activity_id = $param['activitiesId'];
    $_PUT = read_put();
    $learner_id = $_PUT['learner_id'];
    $mark = $_PUT['mark'];
    $mysql = db(); 

    $sql_insert = "DELETE FROM marks WHERE activityId = '$activity_id' AND learnerId = '$learner_id'";
    $result = mysqli_query($mysql, $sql_insert);
    if($result){
    return ["success"=>true];
    }else{
    return ["success"=>false];
    }
});





post("/activities/:activitiesId/marks", function ($param) {
    $activity_id = $param['activitiesId'];
    $_PUT = read_put();
    $learner_id = $_PUT['learner_id'];
    $mark = $_PUT['mark'];
    $mysql = db(); 
$sql_insert = "INSERT INTO marks (activityId, learnerId, mark) 
               VALUES ('$activity_id', '$learner_id', '$mark') 
               ON DUPLICATE KEY UPDATE mark = '$mark'";

    $result = mysqli_query($mysql, $sql_insert);

   if($result){
    return ["success"=>true];
    }else{
    return ["success"=>false];

 }
});


