
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include_once "bdd.php";
include_once "utility.php";


include_once "includes/fonctions.php";

 include_once "routes/learners.php";
 include_once "routes/activities.php";
 include_once "routes/teams.php";
 include_once "routes/trainers.php";
 include_once "routes/comments.php";
 include_once "routes/marks.php";
 include_once "routes/states.php";
 include_once "routes/sessions.php";

header("HTTP/1.0 404");
