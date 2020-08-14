<header>
	<div id="lucy-logo">
		<a href='index.php'><img alt="lucy logo" src="../images/lucylogo.jpg"></a>
	</div>

  <nav>
    <?php
    $top_pages = ["index"=>"Home",
              "myworks"=>"My Works",
              "gallery"=>"Gallery",
              "learn"=>"Learn",
              "contact"=>"Contact",
            ];

    // $myworks_subpages = ["myworks"=>"My Works", "resume"=>"Resume"];

    foreach ($top_pages as $page=>$page_name){

      if ($page == "myworks") {
				?>

				<div class="dropdown <?php if ($current_page_id == 'myworks') { echo ("current-page");}?>">
					<?php if ($page == $current_page_id) { ?>
						<a href="myworks.php" class="dropbtn current-page" >My Works</a>
					<?php } else { ?>
						<a href="myworks.php" class="dropbtn" >My Works</a>
					<?php } ?>
					<div class="dropdown-pages">
						<a href="resume.php">Resume</a>
					</div>
				</div>

			<?php

		} else if ($page == $current_page_id) {

				echo "<a class='top-nav current-page' href='" . $page . ".php'" . ">" . $page_name . "</a>";

			} else {

				echo "<a class='top-nav' href='" . $page . ".php'>" . $page_name . "</a>";
			}
		}

		?>

  </nav>
</header>
