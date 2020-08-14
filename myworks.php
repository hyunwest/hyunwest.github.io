<?php include('includes/init.php');
$current_page_id = "myworks"; ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" type="text/css" href="styles/all.css" media="all" />
  <link rel="stylesheet" type="text/css" href="styles/tablet.css"/>
  <link rel="stylesheet" type="text/css" href="styles/mobile.css"/>

  <title>My Works</title>
</head>

<body>
  <?php include("includes/header.php"); ?>

  <section class="content">
    <h1>My Works</h1>

    <div class="white-background" id="board-wrapper">

      <?php

      $sql = "SELECT * FROM works";
			// $sql = "SELECT * FROM works WHERE title NOT LIKE '%Mobile%' AND title NOT LIKE '%Lab%Project%' AND title NOT LIKE '%Economic%'";
      $params = array();
      // $remaining = exec_sql_query($db, $sql, $params)->fetchAll();
      $works = exec_sql_query($db, $sql, $params)->fetchAll();

			// $works = array_merge($mobile, $labproject, $economic, $remaining);

      $toggle = TRUE;

      if (isset($works) && !empty($works)) {
        foreach($works as $work) {
          $text_html = "<h2>" . strtoupper(htmlspecialchars($work["title"])) .
                        "</h2><hr/><div class = 'boardtext'><p><strong>Date: </strong>" .
                        htmlspecialchars($work['whenithappened']) .
                        "</p><p><strong>Used Program: </strong>" .
                        htmlspecialchars($work['usedprogram']) .
                        "</p><p><strong>Links: </strong> <a href='" .
                        htmlspecialchars($work['links']) .
                        "'>" . htmlspecialchars($work['linkname']) . "</a></p><p class='description'><strong>Description: </strong> " .
                        htmlspecialchars($work['description']) .
                        "</p></div>";
          $image_html = "<img id='img" . htmlspecialchars($work["id"]) . "' alt='" . htmlspecialchars($work["image"]) . "' src='uploads/works/" . htmlspecialchars($work["image"]) . "'/>";
          if (strtoupper(htmlspecialchars($work["title"])) == "UIUX MOBILE APP DESIGN") {
            $figma_html = '<iframe id="iframe" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2FuaFUEId5PopHR1XvT2HVf7%2FChet-prototype%3Fnode-id%3D375%253A108&chrome=DOCUMENTATION" allowfullscreen></iframe>';
          } else {
            $figma_html= "";
          }
          ?>


          <div class='worksFlex'>
            <div class='works-left'> <?php
              if ($toggle==TRUE){
                echo $text_html;
              } else {
                echo $image_html;
              } ?>
          	</div>

	          <div class='works-right'> <?php
  	          if ($toggle==TRUE){
  	            echo $image_html;
  	            $toggle = FALSE;
  	          } else {
  	            echo $text_html;
  	            $toggle = TRUE;
  	          }
              ?>
	          </div>

            <div class="flexbreak"></div>

            <div class='work-bottom'> <?php
              if ($figma_html != "") {
                echo $figma_html;
              }
              ?>
            </div>
					</div>

					<!-- only display this for responsive version -->
					<div class='responsive-print'>
						<div class='works-left'><?php echo $image_html;?></div>
						<div class='works-right'><?php echo $text_html;?></div>
            <div class='work-bottom'> <?php
              if ($figma_html != "") {
                echo $figma_html;
              }
              ?>
            </div>
					</div>

        <?php
        }
      }
      ?>
    </div>
  </section>

  <?php include('includes/footer.php'); ?>
</body>

</html>
