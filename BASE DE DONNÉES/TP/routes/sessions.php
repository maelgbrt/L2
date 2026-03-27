<?php


get("/activities/:activitiesId/sessions/:sessionsId", function ($params) {
    $activity_id = $params['activitiesId'];
    $session_id = $params['sessionsId'];
    $mysql = db();
    $sql = "SELECT 
    s.date,
    s.id as id_session,
    s.trainerId,
    s.roomNom,

    t.id as id_trainer,
    t.firstName,
    t.lastName,

    r.nom,
    r.building,
    r.number
    
    from sessions s
    JOIN trainers t ON s.trainerId = t.id
    JOIN rooms r ON s.roomNom = r.nom
    where s.activityId = '$activity_id' and s.id = '$session_id'";
    $result = mysqli_query($mysql,$sql);

    if ($row = mysqli_fetch_assoc($result)){
        return [
            'id' => (int)$row['id_session'],
            'date' => $row['date'],
            'trainer' => [
                'id' => (int)$row['id_trainer'],
                'firstName' => $row['firstName'],
                'lastName' => $row['lastName']
            ]
            ,
            'room' => [
                'building' => $row['building'],
                'number' => (int)$row['number']
            ]
        ];
    }
}
);


post("/activities/:activitiesId/sessions/:sessionsId", function ($params) {
    $mysql = db();

    $activity_id = $params['activitiesId'];
    $session_id = $params['sessionsId'];
    
    $_PUT = read_put(); 
    $team_id = $_PUT['team_id'];

    $sql_check_duplicate = "SELECT * FROM team_session WHERE teamId = '$team_id' AND sessionId = '$session_id'";
    $result_duplicate = mysqli_query($mysql, $sql_check_duplicate);

    if (mysqli_num_rows($result_duplicate) > 0) {
        return ["status" => false];
    }

    
    $sql_activity = "SELECT coin FROM activities WHERE id = '$activity_id'";
    $res_act = mysqli_query($mysql, $sql_activity);
    $row_act = mysqli_fetch_assoc($res_act);
    $cost = (int)$row_act['coin'];

    $sql_team = "SELECT coin FROM teams WHERE id = '$team_id'";
    $res_team = mysqli_query($mysql, $sql_team);
    $row_team = mysqli_fetch_assoc($res_team);
    $team_balance = (int)$row_team['coin'];

    if ($team_balance < $cost) {
        return ["status" => false];
    }

    $sql_insert = "INSERT INTO team_session (teamId, sessionId) VALUES ('$team_id', '$session_id')";
    $insert_ok = mysqli_query($mysql, $sql_insert);


    $sql_skill = "SELECT name, level FROM skills WHERE activityId = '$activity_id'";
    $res_skill = mysqli_query($mysql, $sql_skill);
    
    $row_skill = mysqli_fetch_assoc($res_skill);
    $skill_name = $row_skill['name']; 
    $skill_level = $row_skill['level']; 
    $sql_skill_insert = "INSERT IGNORE INTO skill_team (teamId, skillName, skillLevel) 
                     VALUES ('$team_id', '$skill_name', '$skill_level')";
    mysqli_query($mysql, $sql_skill_insert);


    if ($insert_ok) {
        $sql_pay = "UPDATE teams SET coin = coin - $cost WHERE id = '$team_id'";
        mysqli_query($mysql, $sql_pay);
        
        return ["status" => true];
    } else {
        return ["status" => false];
    }
});




 delete("/activities/:activitiesId/sessions/:sessionId", function ($param) {
    $activity_id = $param['activitiesId'];
    $idSession  = $param['sessionId'];
    $mysql = db(); 
    $_PUT = read_put();
    $team_id = $_PUT['team_id'];
    

    
    $sql_activity = "SELECT coin FROM activities WHERE id = '$activity_id'";
    $res_act = mysqli_query($mysql, $sql_activity);
    $row_act = mysqli_fetch_assoc($res_act);
    $cost = (int)$row_act['coin'];


    $sql_team = "SELECT coin FROM teams WHERE id = '$team_id'";
    $res_team = mysqli_query($mysql, $sql_team);
    $row_team = mysqli_fetch_assoc($res_team);
    $team_balance = (int)$row_team['coin'];
    $sql_clean = "DELETE FROM team_session WHERE sessionId = '$idSession'";
    $result = mysqli_query($mysql, $sql_clean);


$sql_skill = "SELECT name, level FROM skills WHERE activityId = '$activity_id'";
    $res_skill = mysqli_query($mysql, $sql_skill);
    
    $row_skill = mysqli_fetch_assoc($res_skill);
        
        $skill_name = $row_skill['name']; 
        $skill_level = $row_skill['level']; 
        
        $sql_delete = "DELETE FROM skill_team 
                       WHERE teamId = '$team_id' 
                       AND skillName = '$skill_name' 
                       AND skillLevel = '$skill_level'";
                       
        mysqli_query($mysql, $sql_delete);

       if ($result) {
        $sql_pay = "UPDATE teams SET coin = coin + $cost WHERE id = '$team_id'";
        mysqli_query($mysql, $sql_pay);
        
        return ["status" => true, "message" => "Inscription réussie"];
    } else {
        return ["status" => false, "message" => "Erreur technique SQL"];
    }

});



