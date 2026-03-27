<?php



get("/teams/:teamsId", function ($param) {

     $team_id = $param['teamsId'];

     $teamInfo = getTeamInfo($team_id);

    $teamInfo['learners'] = getAllLearnersOfTeamFull($team_id);
    $teamInfo['sessions'] = getSessionInfo($team_id);
    return $teamInfo;
 });



