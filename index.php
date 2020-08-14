<?php
error_reporting(-1);
ini_set('display_errors', 'On');
set_error_handler("var_dump");

include('includes/init.php');
$current_page_id = "index";

// fetch all tags
$sql = "SELECT * FROM feed_tags";
$params = array();
$fetch_feed_tags = exec_sql_query($db, $sql, $params)->fetchAll();

// if user clicks on a tag
if ( isset($_GET["tag"])) {
	$current_tag = filter_input(INPUT_GET, 'tag', FILTER_SANITIZE_STRING);

	// fetch images based on TAGS
	$sql = "SELECT * FROM feed_to_tags INNER JOIN feed ON feed_to_tags.feed_id = feed.id WHERE tag_id = :current_tag ORDER BY feed.id DESC";
	$params = array(':current_tag' => $current_tag);
	$fetch_feed_content = exec_sql_query($db, $sql, $params)->fetchAll();

} else {
	// no tags, so display all feed content
	$current_tag = NULL;

	// fetch feed content
	$sql = "SELECT * FROM feed ORDER BY id DESC LIMIT 10";
	$params = array();
	$fetch_feed_content = exec_sql_query($db, $sql, $params)->fetchAll();
}

// // listserv form
// if (isset($_POST["index-listserv-submit"])) {
// 	$email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
//   mail("hl566@cornell.edu", "join", "", "From: " . $email);
// 	record_message("[Success!]");
// }


?>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" type="text/css" href="styles/all.css" media="all" />
		<link rel="stylesheet" type="text/css" href="styles/tablet.css"/>
		<link rel="stylesheet" type="text/css" href="styles/mobile.css"/>

		<title>Home</title>
	</head>

	<body>
		<?php include('includes/header.php'); ?>
		<section id="index">

			<div id="centering">
				<img id="banner-image" alt="banner" src="../images/portfolio_banner.jpg"/>
			</div>

			<div id="welcome">
				<div id="welcome-flex-left">
					<h1>Hi, I'm Lucy :)</h1>
					<p>I am a recent graduate from Cornell University College of Arts & Sciences, Information Science major. I am interested in Web Development & UX/UI Design, and am ardently looking for projects related to Human-Computer Interaction. I strive to improve people's technology usage in their everyday lives. </p>
					<a href="myworks.php">see my projects</a>
				</div>

				<div id="welcome-flex-right">
					<img alt="logo" src="images/my_picture.jpg"/>
				</div>
			</div>

			<div id="feedsection">
				<h1> What I've been up to:</h1>
				<div id="feed">
					<div id="feed-flex-left">

						<!-- Search criteria that appears if a user chooses to filter posts by tags -->
						<?php
						if ( isset($_GET["tag"])) {
							$sql = "SELECT * FROM feed_tags WHERE id = :current_tag";
							$params = array(':current_tag' => $current_tag);
							$fetch_tag_name = exec_sql_query($db, $sql, $params)->fetchAll();

							?>
							<div id="search-criteria">
								<?php /*$unicodeChar = '\u2573';
								json_decode('"'.$unicodeChar.'"');*/
								echo "<p>Search results:</p><div id='tag-name'>" . htmlspecialchars($fetch_tag_name[0]['name']) . "</div><a href='index.php'><img alt='xout' src='../images/xout.png'></a>"; ?>
							</div>
						<?php } ?>

						<!-- for each post -->
						<?php foreach($fetch_feed_content as $post) { ?>
								<div class="post">
									<h6 class="date-ribbon" id=<?php echo "$post[id]"?>><?php echo "$post[entry_date]";?></h6>
									<h2><?php echo "$post[title]";?></h2>

									<?php
									$post_id = $post['id'];

									$sql = "SELECT feed_id, tag_id, name FROM feed_to_tags INNER JOIN feed_tags ON feed_to_tags.tag_id = feed_tags.id WHERE feed_id = :post_id";
									$params = array(':post_id' => $post_id);
									$feed_tags = exec_sql_query($db, $sql, $params)->fetchAll();
									?>

									<ul class="tags-in-post">
										<?php foreach ($feed_tags as $tag) { echo "<li>" . htmlspecialchars($tag['name']) ."</li>"; } ?>
									</ul>

									<p><?php echo "$post[content]";?></p>

									<!-- TODO: echo attachments and links -->
									<!-- TODO: add http -->
									<?php if ($post['url_1'] == NULL && $post['url_2'] == NULL) { echo "";
									} else {
										echo "<h3>Links:</h3>";
										if ($post['url_1'] && $post['url_2']) {
											echo "<a class='url' href=$post[url_1] target='_blank'>Link 1</a><br>";
											echo "<a class='url' href=$post[url_2] target='_blank'>Link 2</a>";

										} elseif ($post['url_1']) {
											echo "<a class='url' href=$post[url_1] target='_blank'>Link 1</a><br>";
										} else {
											echo "<a class='url' href=$post[url_2] target='_blank'>Link 1</a>";
										}
									}?>

									<?php
										$sql = "SELECT feed_attachment_id, file_ext, file_name FROM feed_to_feed_attachments INNER JOIN feed_attachments ON feed_attachments.id = feed_to_feed_attachments.feed_attachment_id WHERE feed_id = :post_id";
										$params = array(':post_id' => $post_id);
										$fetch_attachments = exec_sql_query($db, $sql, $params)->fetchAll();

										if (sizeof($fetch_attachments)>0) {
											echo "<h3 class='attachment-title'>Attachments:</h3>";
											foreach($fetch_attachments as $attachment) {
												echo "<a class='file-attachment' target='_blank' href='uploads/feed/" . htmlspecialchars($attachment['feed_attachment_id']) . "." . htmlspecialchars($attachment['file_ext']) . "'>" . htmlspecialchars($attachment['file_name']) . "</a>";
											}
										}
									?>

								</div>
						<?php } ?>

						<div id="tenposts"><p>Displaying up to 10 most recent posts.</p></div>
					</div>

					<div id="feed-flex-right">
						<div id="feed-tags">
							<h2>Tags</h2>
							<ul>
								<?php foreach($fetch_feed_tags as $tag) {
									echo("<li><a href='/index.php?tag=" . htmlspecialchars($tag['id']) . "'>" . htmlspecialchars($tag['name']) ."</a></li>"); }
								?>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</section>
		<?php include('includes/footer.php'); ?>
	</body>
</html>
