<?php

$MONGO = array();
$MONGO["features"]["log_query"] = "on";//log queries
$MONGO["features"]["theme"] = "default";//theme
$MONGO["features"]["plugins"] = "on";//plugins

$mongo_name = getenv("MONGO_NAME") ? getenv("MONGO_NAME") : "no name provided";
$mongo_name = explode("|", $mongo_name);
$mongo_host = getenv("MONGO_HOST") ? getenv("MONGO_HOST") : "no host provided";
$mongo_host = explode("|", $mongo_host);

$i = 0;

foreach($mongo_name as $name) {
  $MONGO["servers"][$i]["mongo_name"] = $name;
  $MONGO["servers"][$i]["mongo_host"] = $mongo_host[$i];
  $MONGO["servers"][$i]["mongo_port"] = "27017";
  $MONGO["servers"][$i]["mongo_timeout"] = 0;
  $MONGO["servers"][$i]["mongo_auth"] = true; 

  $i ++;
}
