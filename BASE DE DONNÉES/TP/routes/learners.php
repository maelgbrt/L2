<?php


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


post("/learners", function () {
    $mysql = db();
     $_PUT = read_put();
    $user_pwd = $_PUT['password'];
    $user_login = $_PUT['mail'];
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
        LEFT JOIN states s ON l.stateId = s.id
        LEFT JOIN skill_team st ON st.teamId = l.team 
        LEFT JOIN skills sk ON sk.name = st.skillName && sk.level = st.skillLevel
        LEFT JOIN marks m ON m.learnerId = l.id
        WHERE l.email = '$user_login' AND l.password = '$user_pwd'";



    $result = mysqli_query($mysql,$sql);
    $res = null;
     while ($row = mysqli_fetch_assoc($result)){
            $res = [
                'email' => $row['email'],
                'id' => (int)$row['id_learners'],
                'firstName' => $row['firstName'],
                'lastName' => $row['lastName'],
                'team' => (int)$row['team']
            ];
            $stateId = [
                'id' => (int)$row['id'],
                'title' => $row['title'],
                'color' => $row['stateColor'],
                'icon' => $row['stateIcon']
            ];

            
             $skills[] = [
                'name' => $row['skillName'],
                'level' => (int)$row['skillLevel'],
                'color' => $row['color'],
                'icon' => $row['icon'],

            ];
             $marks[] = [
                'activityId' => (int)$row['activityId'],
                'mark' => (float)$row['mark'],
            ];
            $res['state'] = $stateId;
            $res['skills'] = $skills;
            $res['marks'] = $marks;
   }

return $res;
});