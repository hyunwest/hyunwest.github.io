<?php

$current_page = null;

/* ===============
   		MESSAGES
   =============== */

$messages = array(); //inspired by lecture demo code

// inspired by lecture demo code
// Record a message to display to the user.
function record_message($message) {
  global $messages;
  $messages[] = $message;
}

// inspired by lecture demo code
// Write out any messages to the user.
function print_messages() {
  global $messages;
  foreach ($messages as $message) {
    echo "<p class=\"message\">" . htmlspecialchars($message) . "</p>\n";
  }
}


/* ===============
   		DATABASE
   =============== */

function exec_sql_query($db, $sql, $params = array()) {
  $query = $db->prepare($sql);
  if ($query and $query->execute($params)) {
    return $query;
  }
  return NULL;
}

// show database errors during development.
function handle_db_error($exception) {
  echo '<p><strong>' . htmlspecialchars('Exception : ' . $exception->getMessage()) . '</strong></p>';
}

// YOU MAY COPY & PASTE THIS FUNCTION WITHOUT ATTRIBUTION.
// open connection to database
function open_or_init_sqlite_db($db_filename, $init_sql_filename) {
  if (!file_exists($db_filename)) {
    $db = new PDO('sqlite:' . $db_filename);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $db_init_sql = file_get_contents($init_sql_filename);
    if ($db_init_sql) {
      try {
        $result = $db->exec($db_init_sql);
        if ($result) {
          return $db;
        }
      } catch (PDOException $exception) {
        // If we had an error, then the DB did not initialize properly, so let's delete it!
        unlink($db_filename);
        throw $exception;
      }
    }
  } else {
    $db = new PDO('sqlite:' . $db_filename);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
  }
  return NULL;
}

// open connection to database
$db = open_or_init_sqlite_db("website.sqlite", "init/init.sql");


/* ==============================
   		LEARNING SIGNS GALLERY
   ============================== */

function gallery($images){
  $image_count = 1;
  $number_of_images = count($images);
  $number_of_columns = 3;
  $images_in_column = 5;

  $current_word = '';

  echo "<div class='column'>";
  foreach($images as $image) {

    if ($current_word != $image['word']) {
      if ($image['id'] != 1) {
        echo "<div class=\"overlay-sign\">" . $current_word . "</div></div>";
        if ($image['id'] ==  15 || $image['id'] == 25) {
          echo "</div><div class='column'>";
        }
      }
      echo "<div class=\"word\">";
      $current_word = $image['word'];
    }

    echo "<img alt=\"" . $image["image_path"] . "\" src='". $image["image_path"] . "' />";
    if ($image['id'] == 37) {
      echo "<div class=\"overlay-sign\">" . $image['word'] . "</div></div>";
    }
  }
  echo "</div>";
}

function single_view($sign_records){
  echo "<img src='". $sign_records[0]["image_path"] . "' >";
  echo "<p><strong>Word: </strong>" . htmlspecialchars($sign_records[0]["word"]) . "</p>";
  echo "<p><strong>Description: </strong>" . $sign_records[0]["description"] . "</p>";

}

function sign_exists($id) {
  global $db;

  $sql = "SELECT * FROM signs WHERE signs.id = :id;";
  $params = array(":id"=>$id);
  $records = exec_sql_query($db, $sql, $params)->FetchAll();

  return !empty($records); // if $records is not empty, image exists
}

?>
