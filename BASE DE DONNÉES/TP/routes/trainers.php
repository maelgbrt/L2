<?php 


get("/trainers/:trainer_id", function ($param){
$trainer_id = $param['trainer_id'];
$mysql = db();
$sql = "SELECT 


t.id as id_trainer,
t.firstName,
t.lastName,
t.email,
tr.roleName,
r.name as roleName,

s.id as sessionId,
s.date,
a.id as activityId,
a.name,
rm.nom,
rm.building,
rm.number


from trainers t 
join trainer_role tr on t.id = tr.trainerId
join roles r on tr.roleName = r.name
join sessions s on s.trainerId = t.id
join activities a on s.activityId = a.id
join rooms rm on s.roomNom = rm.nom



where t.id = '$trainer_id'";
$result = mysqli_query($mysql, $sql);

$res = null;

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        
        if (!$res) {
            $res = [
                'id'        => (int)$row['id_trainer'],
                'firstName' => $row['firstName'],
                'lastName'  => $row['lastName'],
                'mail'      => $row['email'],
                'roles' => [ [] ],                
                'sessions'  => [[
                    'id' => (int)$row['sessionId'],
                    'date' => $row['date'],
                    'room' => [
                        'building' => $row['building'],
                        'number' => (int)$row['number']
                    ],
                    'activity' => [
                        'id' => (int)$row['activityId'],
                        'name' => $row['name']
                    ]
                ]]
            ];
        }

        if (!empty($row['roleName'])) {
        $res['roles'][0][] = $row['roleName'];       
     }
    }
}

return $res;
});
