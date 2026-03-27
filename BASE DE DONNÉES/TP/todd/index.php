<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include_once "bdd.php";
include_once "utility.php";


function getLearnerFullData($learner_id) {
    $mysql = db();

    $sql = "SELECT 
            l.id as id_learners,
            l.firstName,
            l.lastName,
            l.email,
            l.password,
            l.team,
            l.stateId,

            s.id as state_id,
            s.title,
            s.color as stateColor,
            s.icon as stateIcon,

            st.skillName,
            st.skillLevel,

            sk.name,
            sk.level,
            sk.color,
            sk.icon,
            sk.activityId,

            m.activityId as markActivity,
            m.mark
        FROM learners l
        LEFT JOIN states s ON l.stateId = s.id
        LEFT JOIN skill_team st ON st.teamId = l.team
        LEFT JOIN skills sk ON sk.name = st.skillName AND sk.level = st.skillLevel
        LEFT JOIN marks m ON m.learnerId = l.id
        WHERE l.id = '$learner_id'";


    $result = mysqli_query($mysql, $sql);

    if (!$result) return null;

    $state = [];
    $skills = [];
    $marks = [];

    $baseInfo = null;

    while ($row = mysqli_fetch_assoc($result)) {

        if (!$baseInfo) {
            $baseInfo = [
                'email'     => $row['email'],
                'id'        => $row['id_learners'],
                'firstName' => $row['firstName'],
                'lastName'  => $row['lastName'],
                'password'  => $row['password'],
                'team'      => $row['team']
            ];
        }

        if (empty($state)) {
            $state = [
                'id'    => $row['state_id'],
                'title' => $row['title'],
                'color' => $row['stateColor'],
                'icon'  => $row['stateIcon']
            ];
        }

        $skills[] = [
            'name'       => $row['name'],
            'level'      => $row['level'],
            'color'      => $row['color'],
            'icon'       => $row['icon']
        ];

        $marks[] = [
            'activityId' => $row['markActivity'],
            'mark'       => $row['mark']
        ];
    }

    if (!$baseInfo) return null;
    $baseInfo['marks'] = $marks;
    $baseInfo['skills'] = $skills;

    $baseInfo['state'] = $state;
    

    return $baseInfo;
}

function getTeamInfo($team_id) {
    $mysql = db();

    $sql = "SELECT id, name, coin
            FROM teams
            WHERE id = '$team_id'";

    $result = mysqli_query($mysql, $sql);

    if (!$row = mysqli_fetch_assoc($result)) {
        return null; 
    }

    return [
        'id'   => $row['id'],
        'name' => $row['name'],
        'coin' => $row['coin']
    ];
}



get("/learners/:learnerId", function ($param) {
    return getLearnerFullData($param['learnerId']);
});


put("/learners/:learnerId", function ($param) {
    $_PUT = read_put();
    $user_pwd = $_PUT['password'];
    $learner_id = $param['learnerId'];
    $mysql = db(); 
    $sql = "UPDATE learners SET password = '$user_pwd' WHERE id = '$learner_id'";
    $result = mysqli_query($mysql,$sql);
    return ["status" => "success"];
});



put("/learners/:learnerId/state", function ($param) {
    $_PUT = read_put();
    $user_state = $_PUT['state'];
$learner_id = $param['learnerId'];
$mysql = db(); 
$sql = "UPDATE learners SET state = '$user_state' WHERE id = '$learner_id'";

    $result = mysqli_query($mysql,$sql);
    return ["status" => "success"];


});

post("/learners", function () {
    $mysql = db();
$sql = "SELECT 
            l.id as id_learners,
            l.firstName,
            l.lastName,
            l.email,
            l.password,
            l.team,
            l.stateId,

            s.id,
            s.title,
            s.color as stateColor,
            s.icon as stateIcon,
            
             
            st.skillName,
            st.skillLevel,
            st.teamId,

            sk.name,
            sk.level,
            sk.color,
            sk.icon,
            sk.activityId,


            m.learnerId,
            m.activityId,
            m.mark

           
            FROM learners l 
        JOIN states s ON l.stateId = s.id
        JOIN skill_team st ON st.teamId = l.team 
        join skills sk ON sk.name = st.skillName && sk.level = st.skillLevel
        Join marks m ON m.learnerId = l.id";   


    $result = mysqli_query($mysql,$sql);
    $_PUT = read_put();
    $user_pwd = $_PUT['password'];
    $user_login = $_PUT['mail'];
    $res = null;
     while ($row = mysqli_fetch_assoc($result)){
        if ($row['password'] === $user_pwd && $row['email'] === $user_login) {
            $res = [
                'email' => $row['email'],
                'id' => $row['id_learners'],
                'firstName' => $row['firstName'],
                'lastName' => $row['lastName'],
                'password' => $row['password'],
                'team' => $row['team']
            ];
            $stateId[] = [
                'id' => $row['id'],
                'title' => $row['title'],
                'color' => $row['stateColor'],
                'icon' => $row['stateIcon']
            ];

            
             $skill[] = [
                'name' => $row['name'],
                'level' => $row['level'],
                'color' => $row['color'],
                'icon' => $row['icon'],
                'activityId' => $row['activityId']

            ];
             $marks[] = [
                'activityId' => $row['activityId'],
                'mark' => $row['mark'],
            ];
            $res['state'] = $stateId;
            $res['skill'] = $skill;
            $res['marks'] = $marks;
   }
}


return $res;
}
);





// get("/states", function () {
//        $mysql = db();
// $sql = "SELECT * from states";
// $result = mysqli_query($mysql,$sql);
// while ($row = mysqli_fetch_assoc($result)){
//     $res[] = [
//         'id' => $row['id'],
//         'title' => $row['title'],
//         'color' => $row['color'],
//         'icon' => $row['icon']
//     ];
// }
// return $res;
// });

function getAllLearnersOfTeamFull($team_id) {
    $mysql = db();

    $sql = "SELECT id FROM learners WHERE team = '$team_id'";
    $result = mysqli_query($mysql, $sql);

    if (!$result) return [];

    $learners = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $learners[] = getLearnerFullData($row['id']); 
    }

    return $learners;
}







get("/teams/:teamsId", function ($param) {

    $team_id = $param['teamsId'];

    $teamInfo = getTeamInfo($team_id);
    if (!$teamInfo) return null;

    $teamInfo['learners'] = getAllLearnersOfTeamFull($team_id);

    return $teamInfo;
});

header("HTTP/1.0 404");
