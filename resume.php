<?php
include('includes/init.php');
$current_page_id = "resume";
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" type="text/css" href="styles/all.css" media="all" />
  <link rel="stylesheet" type="text/css" href="styles/tablet.css"/>
  <link rel="stylesheet" type="text/css" href="styles/mobile.css"/>

  <title>Resume</title>
</head>

<body>
  <?php include("includes/header.php"); ?>

  <section class="content">
		<h1>Resume</h1>

		<div id="resume-white-background">
      <h3 class='attachment-title' id="resume-attachment-title">Attachment: <a id="resume download" target='_blank' href='../uploads/works/resume.pdf'>Resume.pdf</a></h3>
      <img id="resume-image" alt="resume" src="../images/resume.png"/>
		</div>
  </section>

	<?php include("includes/footer.php"); ?>
</body>
</html>
