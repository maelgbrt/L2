<?php


post("/activities/:activityId/comments", function ($param) {
    $mysql = db();
    $activityId = $param['activityId'];

    $_PUT = read_put();
    $message = $_PUT['message'];
    $learnerId = $_PUT['learner_id'];
     $sql = "INSERT INTO `comments` (`activityId`, `learnerId`, `date`, `message`) 
         VALUES ('$activityId', '$learnerId', NOW(), '$message')";
         $result = mysqli_query($mysql,$sql);
 if($result){
    return ["success"=>true];
    }else{
    return ["success"=>false];

 }

 });





delete("/activities/:activitiesId/comments/:commentId", function ($param) {
    $activity_id = $param['activitiesId'];
    $comment_id  = $param['commentId'];
    $mysql = db(); 

    $sql_delete = "DELETE FROM comments WHERE id = '$comment_id' AND activityId = '$activity_id'";
    $result = mysqli_query($mysql, $sql_delete);

  if($result){
    return ["success"=>true];
    }else{
    return ["success"=>false];

 }
});


