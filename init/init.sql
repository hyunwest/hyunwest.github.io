/* TODO: create tables */

/* Home page (newsfeed) */
CREATE TABLE feed (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	title TEXT NOT NULL,
	entry_date TEXT NOT NULL,
	content TEXT NOT NULL,
	url_1 TEXT,
	url_2 TEXT
);

CREATE TABLE feed_attachments (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	file_name TEXT,
	file_ext TEXT
);

CREATE TABLE feed_to_feed_attachments (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	feed_id INTEGER NOT NULL,
	feed_attachment_id INTEGER NOT NULL
);

CREATE TABLE feed_tags (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	name TEXT NOT NULL
);

CREATE TABLE feed_to_tags (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	feed_id INTEGER NOT NULL,
	tag_id INTEGER NOT NULL
);

/* My works (projects) */
CREATE TABLE works (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
 	whenithappened TEXT NOT NULL,
  title TEXT NOT NULL,
  usedprogram TEXT NOT NULL,
	linkname TEXT NOT NULL,
  links TEXT NOT NULL,
  description TEXT NOT NULL,
  image TEXT NOT NULL
);

/* Gallery */
CREATE TABLE images (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	title TEXT NOT NULL,
	file_ext TEXT NOT NULL
);

CREATE TABLE categories (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE images_cats (
	image_id INTEGER NOT NULL,
	cat_id INTEGER NOT NULL
);

/* Learn ASL */
CREATE TABLE signs (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  word TEXT NOT NULL,
	frame INTEGER NOT NULL,
  image_path TEXT NOT NULL
);


/* TODO: initial seed data */

/* Home page (newsfeed) */
/* 1 */INSERT INTO feed (title, entry_date, content, url_1) VALUES ("D/deaf / Hard of Hearing School Counseling Survey", "April 1, 2018", "Phoebe Lo, a New York University graduate student studying School Counseling, is researching how school counselors can understand and help students who are D/deaf / hard of hearing. To facilitate this, she is looking for D/deaf / hard of hearing students to fill out a survey about their experiences. All responses are confidential and used solely for research.", "https://docs.google.com/forms/d/e/1FAIpQLScuN2dMY6eJeJdQdv_RRA7uWD4sifVXAYNZ9AZ6EgZP__ugbQ/viewform");
/* 2 */INSERT INTO feed (title, entry_date, content) VALUES ("E-board Office Hours", "April 9, 2018", "If you'd like extra practice with a song or vocabulary we've done in Sign Choir, or are interested in learning more about ASL, Deaf culture, or CUDAP, feel free to come to any board member's office hours; times are on the attached board list. Please notify them via email so they know to expect you.");
/* 3 */INSERT INTO feed (title, entry_date, content) VALUES ("Apparel Sale", "April 10, 2018", "Thank you to everyone who ordered from CUDAP's first apparel sale! The apparel has been ordered and should arrive within the next two weeks; if you ordered, we will send you an email when it comes in.");
/* 4 */INSERT INTO feed (title, entry_date, content) VALUES ("E-board Openings", "April 12, 2018", "We are excited to announce that the following positions will be open on our executive board for the Fall 2018 Semester: Treasurer, Secretary, Outreach Chair, Publicity Coordinator, and Events Coordinator. Descriptions of all board positions can be found below. If you're interested, please fill out the application. Applications are due Wednesday, April 25th to cudap@cornell.edu. Any questions or concerns may be directed to our email or any current board member. We encourage any student, regardless of ability or experience, to apply!");
/* 5 */INSERT INTO feed (title, entry_date, content) VALUES ("Panel discussion on disability and intersectionality", "April 16, 2018", "The Undergraduate Disability Studies Journal is hosting a panel discussion on disability and intersectionality on campus tomorrow, April 17th, from 4:30-6pm in Ives Hall Room 116. Please join us to learn about the experience of students with disabilities on campus who will share about their personal experiences and academic work in this area. The purpose of the panel is to inspire our campus community to think more broadly of disability as diversity, and create a more welcoming space for students with intersectional experiences.");
/* 6 */INSERT INTO feed (title, entry_date, content) VALUES ("SAT & English Tutor", "June-July 2020", "Taught middle school and high school students SAT/SSAT reading, general reading comprehension, and English-speaking lessons.");
/* 7 */INSERT INTO feed (title, entry_date, content) VALUES ("Adobe Photoshop & Illustrator Training", "August 2020", "Learned the basics of Adobe Photoshop and Adobe Illustrator through a week-long training at Korea Digital Enterprise Association. Completed the textbook "맛있는 디자인: 포토샵 & 일러스트레이터 CC 2020". For final project, we had to re-construct the KakaoPay home page from scratch on Adobe Photoshop. The said project is attached as a psd and a jpg.");

INSERT INTO feed_tags (name) VALUES ("#bilingual");
INSERT INTO feed_tags (name) VALUES ("#design");
INSERT INTO feed_tags (name) VALUES ("#eboard");
INSERT INTO feed_tags (name) VALUES ("#interest");
INSERT INTO feed_tags (name) VALUES ("#apparel");
INSERT INTO feed_tags (name) VALUES ("#officehours");

INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (1, 4);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (2, 6);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (3, 5);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (4, 3);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (5, 4);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (6, 1);
INSERT INTO feed_to_tags (feed_id, tag_id) VALUES (7, 2);

INSERT INTO feed_attachments (file_name, file_ext) VALUES ("kakaopagereconstruct.psd", "psd");
INSERT INTO feed_attachments (file_name, file_ext) VALUES ("kakaopagereconstruct.jpg", "jpg");
INSERT INTO feed_attachments (file_name, file_ext) VALUES ("board-application.pdf", "pdf");

INSERT INTO feed_to_feed_attachments (feed_id, feed_attachment_id) VALUES (7, 1);
INSERT INTO feed_to_feed_attachments (feed_id, feed_attachment_id) VALUES (7, 2);
INSERT INTO feed_to_feed_attachments (feed_id, feed_attachment_id) VALUES (4, 3);


/* See my work (projects) */
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Aug~Dec 2019', 'UIUX Mobile App Design', 'Figma, Balsamiq, Adobe Illustrator', 'https://drive.google.com/drive/folders/1AJiuajftZPAnkQ4KY5UqgiLFBgwBUPzU?usp=sharing', 'App Walk-through Video, App Poster, Usability Test and More', 'Designed a house chore completion app for college housemates and conducted contextual interviews with Cornell students. Created wireframes using Balsamiq, and then Figma. Conducted user testing sessions after the first version was created, and then made necessary adjustments to the final version.', '1.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Jun~Aug 2019', 'Cornell Social Media Lab Website', 'HTML, CSS, Javascript', 'https://drive.google.com/drive/folders/1Y4VBFhU5Knc_Se7wTUB6fIFQTxZJ5BVo?usp=sharing', 'Walk-through Video and HTML/CSS/Javascript Files', 'Edited the website for a lab project called "TestDrive", a program that teaches children safe social media practices. Reconstructed the website using HTML, CSS, and Javascript. Used responsive CSS to provide equivalent user experience for different browsers and devices. Brainstormed and created filler contents for TestDrive social media lesson plans.', '2.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Mar~May 2019', 'Economic Freedom Data-driven Web Application', 'HTML, CSS, Javascript', 'https://drive.google.com/drive/folders/1bZWCNVOReNUcSv9r6SlfO5SbpZF4HU_O?usp=sharing', "Walk-through Video, HTML/CSS/JS Files, Datasets and More", 'Produced a data-visualizing web app that illustrate the economic freedom score and related factors of countries around the world. Interactive visualizations included an interactive world map with on-hover display of each country’s stats, and an interactive correlation graph with selectable variables.', '3.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Aug 2020', 'Website Mockup with Adobe Photoshop', 'Adobe Photoshop', 'index.php#7', "Go to homepage feed for psd file and more details", 'Created a website mockup for a company called “Kakaopay Securities” through Adobe Photoshop.', '4.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Jan~Mar 2019', 'Political Data-Visualization', 'HTML, CSS, Javascript', 'https://drive.google.com/drive/folders/1itlHl9b-5XkurhZ8PH5zOByYHHv0yvt6?usp=sharing', 'Walk-through Video, HTML/CSS/JS Files, Datasets and More', "This is a data-visualization web app that explores a possible relationship between each of the U.S. district partisanship and its Congressperson's ideology.", '5.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Pamela Wildstein', 'Publicity Designer', 'Environmental and Sustainability Sciences', '2020', 'She joined CUDAP in the Fall of her sophomore year, after transferring from Penn State, with the goal of becoming an advocate for the Deaf community.', '6.png');
INSERT INTO works(whenithappened, title, usedprogram, links, description, image) VALUES ('Jonathan Masci', 'Alumni Advisor', 'Linguistics', '2016', 'He joined CUDAP his sophomore year to learn more about ASL and Deaf culture. Since graduating, he has served as an AmeriCorps member with City Year New Hampshire, where he gives students individualized tutoring in a high-need elementary school. He is honored to have the opportunity to support the newest generation of CUDAP leaders.', '7.png');

/* Gallery */
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase ', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Actions speak louder than words', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (2)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everyone deserves a chance to be their best self', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everyone has value', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('A persons value is independent of their physical and mental status', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Inclusivity helps everyone', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (3)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everyone deserves equal chances', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('I support inclusion', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Inclusion matters', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everyone deserves equal access', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (4)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (5)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (6)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everybody matters', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everyone deserves an opportunity to succeed', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (7)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Deaf Awareness Showcase (8)', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Everybody matters', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Performance', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Club meeting', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Balch Arch Performance', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Watching a movie', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Balch Arch Performance', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Teaching signs', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Learning signs', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Club Fest', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Teaching more signs', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Eboard meeting', 'jpg');
INSERT INTO images (title, file_ext) VALUES ('Chalking! Come support us', 'jpg');

INSERT INTO categories (name) VALUES ('Sign Choir');
INSERT INTO categories (name) VALUES ('Workshops');
INSERT INTO categories (name) VALUES ('Deaf Awareness Week');

INSERT INTO images_cats (image_id, cat_id) VALUES ('1', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('2', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('3', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('4', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('5', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('6', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('7', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('8', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('9', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('10', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('11', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('12', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('13', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('14', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('15', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('16', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('17', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('18', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('19', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('20', '3');
INSERT INTO images_cats (image_id, cat_id) VALUES ('21', '1');
INSERT INTO images_cats (image_id, cat_id) VALUES ('22', '2');
INSERT INTO images_cats (image_id, cat_id) VALUES ('23', '1');
INSERT INTO images_cats (image_id, cat_id) VALUES ('24', '2');
INSERT INTO images_cats (image_id, cat_id) VALUES ('25', '1');
INSERT INTO images_cats (image_id, cat_id) VALUES ('26', '2');
INSERT INTO images_cats (image_id, cat_id) VALUES ('27', '2');
INSERT INTO images_cats (image_id, cat_id) VALUES ('28', '1');
INSERT INTO images_cats (image_id, cat_id) VALUES ('29', '2');
INSERT INTO images_cats (image_id, cat_id) VALUES ('30', '1');
INSERT INTO images_cats (image_id, cat_id) VALUES ('31', '1');

/* Learn ASL */
INSERT INTO signs(word, frame, image_path) VALUES ('Cornell', '1', 'uploads/signs/1.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('Cornell', '2', 'uploads/signs/2.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('Cornell', '3', 'uploads/signs/3.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('deaf', '1', 'uploads/signs/4.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('deaf', '2', 'uploads/signs/5.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('deaf', '3', 'uploads/signs/6.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hard of hearing', '1', 'uploads/signs/7.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hard of hearing', '2', 'uploads/signs/8.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hard of hearing', '3', 'uploads/signs/9.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hearing', '1', 'uploads/signs/10.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hearing', '2', 'uploads/signs/11.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('hearing', '3', 'uploads/signs/12.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('help', '1', 'uploads/signs/13.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('help', '2', 'uploads/signs/14.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('home', '1', 'uploads/signs/15.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('home', '2', 'uploads/signs/16.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('school', '1', 'uploads/signs/17.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('school', '2', 'uploads/signs/18.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('who', '1', 'uploads/signs/19.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('who', '2', 'uploads/signs/20.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('what', '1', 'uploads/signs/21.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('what', '2', 'uploads/signs/22.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('where', '1', 'uploads/signs/23.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('where', '2', 'uploads/signs/24.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('why', '1', 'uploads/signs/25.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('why', '2', 'uploads/signs/26.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('how', '1', 'uploads/signs/27.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('how', '2', 'uploads/signs/28.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('how', '3', 'uploads/signs/29.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('Ithaca', '1', 'uploads/signs/33.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('Ithaca', '2', 'uploads/signs/34.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('Ithaca', '3', 'uploads/signs/35.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('learn', '1', 'uploads/signs/36.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('learn', '2', 'uploads/signs/37.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('sign', '1', 'uploads/signs/38.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('sign', '2', 'uploads/signs/39.jpg');
INSERT INTO signs(word, frame, image_path) VALUES ('sign', '3', 'uploads/signs/40.jpg');
