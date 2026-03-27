<?php



get("/states", function () {
       $mysql = db();
$sql = "SELECT * from states";
$result = mysqli_query($mysql,$sql);
while ($row = mysqli_fetch_assoc($result)){
    $res[] = [
        'id' => (int)$row['id'],
        'title' => $row['title'],
        'color' => $row['color'],
        'icon' => $row['icon']
    ];
}
return $res;
});





post("/learners/:learnerId/states", function () {
    $mysql = db();
$sql = "UPDATE * from states";
$result = mysqli_query($mysql,$sql);
while ($row = mysqli_fetch_assoc($result)){
    $res[] = [
        'id' => (int)$row['id'],
        'title' => $row['title'],
        'color' => $row['color'],
        'icon' => $row['icon']
    ];
}
return $res;
});


put("/learners/:learnerId/state", function ($param) {
    $_PUT = read_put();
    $user_state = $_PUT['state_id'];
$learner_id = $param['learnerId'];
$mysql = db(); 
$sql = "UPDATE learners SET stateId = '$user_state' WHERE id = '$learner_id'";

    mysqli_query($mysql,$sql);
    return ["status" => "success"];

});  
