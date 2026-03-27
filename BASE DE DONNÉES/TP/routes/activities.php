
<?php

    get("/activities", function () {
    $mysql = db();
    
    $sql = "SELECT * from activities
    JOIN period ON activities.period = period.title";
    
  
    if (isset($_GET['date'])) {
        if ($_GET['date'] === 'false') {
            $sql .= " ORDER BY period.startDate ASC"; 
        } elseif ($_GET['date'] === 'true') {
            $sql .= " ORDER BY period.startDate DESC";
        }
    }


    if(isset($_GET['coin'])) {
        if ($_GET['coin'] === 'false') {
            $sql .= " ORDER BY activities.coin ASC"; 
        } elseif ($_GET['coin'] === 'true') {
            $sql .= " ORDER BY activities.coin DESC";
        }
    }


    if(isset($_GET['name'])) {
        if ($_GET['name'] === 'false') {
            $sql .= " ORDER BY activities.name ASC"; 
        } elseif ($_GET['name'] === 'true') {
            $sql .= " ORDER BY activities.name DESC";
        }
    }







    $result = mysqli_query($mysql, $sql);
    $res = []; 

    while ($row = mysqli_fetch_assoc($result)){
        $res[] = [
            'id' => (int)$row['id'],
            'name' => $row['name'],
            'syllabus' => $row['syllabus'],
            'coin' => (int)$row['coin'],
            'maxTeams' => (int)$row['maxTeams'],
            'period' => [
                'title' => $row['period'], 
                'startDate' => $row['startDate'],
                'endDate' => $row['endDate'],
                'color' => $row['color']
            ]
        ];
    }
    return $res;
});


get("/activities/:activitiesId", function ($params) {
    $activity_id = $params['activitiesId'];
    $mysql = db();
    $sql = "SELECT * from activities where id = '$activity_id'";
    $result = mysqli_query($mysql,$sql);

    if ($row = mysqli_fetch_assoc($result)){
        $response = [
            'id' => (int)$row['id'],
            'name' => $row['name'],
            'syllabus' => $row['syllabus'],
            'coin' => (int)$row['coin'],
            'mark' => (float)$row['mark'],
            'maxTeams' => (int)$row['maxTeams']
        ];
    }

    $sql_period = "SELECT * from period
    JOIN activities ON activities.period = period.title
    WHERE activities.id = '$activity_id'";
    $result_period = mysqli_query($mysql,$sql_period);
    if ($row = mysqli_fetch_assoc($result_period)){
        $response['period'] = [
            'title' => $row['title'],
            'startDate' => $row['startDate'],
            'endDate' => $row['endDate'],
            'color' => $row['color']
        ];
    }

    $sql_sessions = "SELECT s.id as id_session,s.activityId,s.date as session_date,s.trainerId,s.roomNom,a.id as id_activity,
    t.id as id_trainer,t.firstName,t.lastName,r.nom,r.building,r.number

    
    from sessions s
    LEFT JOIN activities a ON a.id = s.activityId
    LEFT JOIN trainers t ON t.id = s.trainerId
    LEFT JOIN rooms r ON r.nom = s.roomNom
    WHERE s.activityId = '$activity_id'";
    $result_session = mysqli_query($mysql,$sql_sessions);
    $response['sessions'] = [];
    if ($row = mysqli_fetch_assoc($result_session)){
        $response['sessions'][] = [
            'id' => (int)$row['id_session'],
            'date' => $row['session_date'],
            'trainer' => [
                'id' => (int)$row['id_trainer'],
                'firstName' => $row['firstName'],
                'lastName' => $row['lastName']],
            'room' => [ 
                'building' => $row['building'],
                'number' => (int)$row['number']]

        ];
    }

$response['comments'] = [];

$sql_comments = "SELECT c.id as id_comment, c.learnerId, c.date, c.message, 
                        l.id as id_learner, l.firstName, l.lastName 
                 FROM comments c 
                 JOIN learners l ON l.id = c.learnerId
                 WHERE c.activityId = '$activity_id'";

$result_comments = mysqli_query($mysql, $sql_comments);

while ($row = mysqli_fetch_assoc($result_comments)){
    
    $response['comments'][] = [
        'id' => (int)$row['id_comment'],
        'learner' => [
            'id' => (int)$row['id_learner'],
            'firstName' => $row['firstName'],
            'lastName' => $row['lastName']
        ],
        'date' => $row['date'],
        'message' => $row['message']
    ];
}

$response['skills'] = [];

$sql_skills = "SELECT sk.name, sk.activityId, a.id
                  FROM skills sk
                  JOIN activities a ON sk.activityId = a.id
                  WHERE a.id = '$activity_id'";
$result_skills = mysqli_query($mysql,$sql_skills);
while ($row = mysqli_fetch_assoc($result_skills)) {
    $response['skills'] = [
        $row['name']
    ];
}
return $response;
});

