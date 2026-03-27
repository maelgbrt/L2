<?php



function getSessionInfo($team_id) {
    $mysql = db();

    $sql = "SELECT 
        ts.teamId,
        ts.sessionId,
        s.id as id_session,
        s.trainerId,
        s.activityId,
        s.date,

        a.id as activityId,
        a.name,
        a.syllabus,
        a.coin,
        a.maxTeams,

        p.title as periodTitle,
        p.startDate,
        p.endDate,
        p.color
            FROM team_session ts
            LEFT JOIN sessions s ON ts.sessionId = s.id
            LEFT JOIN activities a on s.activityId = a.id
            LEFT JOIN period p on s.date <= p.endDate AND s.date >= p.startDate 
            WHERE teamId = '$team_id'";

    $result = mysqli_query($mysql, $sql);

    $sessions = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $sessions[] = [
            'id'     => (int)$row['id_session'],
            'trainerId' => (int)$row['trainerId'],
            'activity' => [
                'id'       => (int)$row['activityId'],
                'name'     => $row['name'],
                'syllabus' => $row['syllabus'],
                'coin'     => (int)$row['coin'],
                'maxTeams' => (int)$row['maxTeams'],
            ],
            'period' => [
                'title'     => $row['periodTitle'],
                'startDate' => $row['startDate'],
                'endDate'   => $row['endDate'],
                'color'     => $row['color'],
            ]

        ];
    }

    return $sessions;

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
        'id'   => (int)$row['id'],
        'name' => $row['name'],
        'coin' => $row['coin'],
    ];
}





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
                'id'        => (int)$row['id_learners'],
                'email'     => $row['email'],
                'firstName' => $row['firstName'],
                'lastName'  => $row['lastName'],
                'team'      => (int)$row['team']
            ];
        }

        if (empty($state)) {
            $state = [
                'id'    => (int)$row['state_id'],
                'title' => $row['title'],
                'color' => $row['stateColor'],
                'icon'  => $row['stateIcon']
            ];
        }

        $skills[] = [
            'name'       => $row['name'],
            'level'      => (int)$row['level'],
            'color'      => $row['color'],
            'icon'       => $row['icon']
        ];

        $marks[] = [
            'activityId' => (int)$row['markActivity'],
            'mark'       => (int)$row['mark']
        ];
    }

    if (!$baseInfo) return null;
    $baseInfo['marks'] = $marks;
    $baseInfo['skills'] = $skills;

    $baseInfo['state'] = $state;
    

    return $baseInfo;
}





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








?>