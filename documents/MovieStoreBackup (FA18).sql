-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.87-community-nt



--
-- Create schema moviestoredb
--

CREATE DATABASE IF NOT EXISTS moviestoredb;
USE moviestoredb;

--
-- Definition of table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardID` int(10) unsigned NOT NULL,
  `memberID` int(10) unsigned default NULL,
  `creditCardCCV` int(10) unsigned default NULL,
  `creditCardNumber` text,
  `cardHolderFirstName` varchar(45) default NULL,
  `cardHolderLastName` varchar(45) default NULL,
  `expYear` int(10) unsigned default NULL,
  `expMonth` int(10) unsigned default NULL,
  `ccType` varchar(45) default NULL,
  PRIMARY KEY  (`cardID`),
  KEY `FK_card_1` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`cardID`,`memberID`,`creditCardCCV`,`creditCardNumber`,`cardHolderFirstName`,`cardHolderLastName`,`expYear`,`expMonth`,`ccType`) VALUES 
 (4,10001,12345,'3994781776575320','Richard','Shelby',2009,11,'AmericanExpress'),
 (5,10002,12345,'1933667408756440','Jeff','Sessions',2011,10,'Discover'),
 (6,10003,12345,'9751105946061040','Ted','Stevens',2011,5,'Visa'),
 (7,10004,12345,'1202366155621340','Lisa','Murkowski',2010,5,'Discover'),
 (8,10005,12345,'8035362684046050','John','McCain',2012,9,'AmericanExpress'),
 (9,10006,12345,'1876408666555860','Jon','Kyl',2008,9,'Discover'),
 (10,10007,12345,'7979756355328080','Blanche','Lincoln',2009,7,'MasterCard'),
 (11,10008,12345,'6295809193605710','Mark','Pryor',2008,9,'MasterCard'),
 (12,10009,12345,'5991223319790250','Dianne','Feinstein',2009,4,'Visa'),
 (13,10010,12345,'4919623420034730','Barbara','Boxer',2012,7,'Visa'),
 (14,10011,12345,'2568476161496700','Wayne','Allard',2010,3,'Visa'),
 (15,10012,12345,'8648458933928500','Ken','Salazar',2015,2,'Discover'),
 (16,10013,12345,'9892984032195930','Chris','Dodd',2013,8,'Discover'),
 (17,10014,12345,'3590389378753280','Joe','Lieberman',2016,8,'AmericanExpress'),
 (18,10015,12345,'7389010056583180','Joe','Biden',2009,11,'MasterCard'),
 (19,10016,12345,'4238545958242720','Tom','Carper',2011,1,'Visa'),
 (20,10017,12345,'9542286651415390','Bill','Nelson',2009,9,'Discover'),
 (21,10018,12345,'7389010056583180','Mel','Martinez',2010,6,'MasterCard'),
 (22,10019,12345,'4087388550889250','Dick','Durbin',2009,6,'MasterCard'),
 (23,10020,12345,'5997601199766710','Barack','Obama',2013,1,'Visa');



--
-- Definition of table `membership`
--

DROP TABLE IF EXISTS `membership`;
CREATE TABLE `membership` (
  `tierName` varchar(15) NOT NULL default '',
  `downloadsPerMonth` int(10) unsigned default NULL,
  `tierMonthlyCost` varchar(45) default NULL,
  PRIMARY KEY  USING BTREE (`tierName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`tierName`,`downloadsPerMonth`,`tierMonthlyCost`) VALUES 
 ('Gold',4,'$6.95'),
 ('Platinum',6,'$9.95'),
 ('Silver',3,'$3.95'),
 ('None',1,'$0.00'),
 ('test',3,NULL);

--
-- Definition of table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `memberID` int(10) unsigned NOT NULL auto_increment,
  `tierName` varchar(15) default 'Silver',
  `userName` varchar(45) default NULL,
  `firstName` varchar(45) default NULL,
  `lastName` varchar(45) default NULL,
  `age` tinyint(3) default NULL,
  `billAddressLine1` varchar(45) default NULL,
  `billAddressLine2` varchar(45) default NULL,
  `billCity` varchar(45) default NULL,
  `billState` varchar(45) default NULL,
  `billZipCode` varchar(10) default NULL,
  `shipAddressLine1` varchar(45) default NULL,
  `shipAddressLine2` varchar(45) default NULL,
  `shipCity` varchar(45) default NULL,
  `shipState` varchar(45) default NULL,
  `shipZipCode` varchar(10) default NULL,
  `phoneNumber` varchar(20) default NULL,
  `emailAddress` varchar(45) default NULL,
  `memberPassword` varchar(45) default NULL,
  `memberSince` date default NULL,
  `activeStatus` tinyint(1) unsigned default NULL,
  `genrePreference` varchar(45) default NULL,
  PRIMARY KEY  (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=10043 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--


INSERT INTO `member` (`memberID`,`tierName`,`userName`,`firstName`,`lastName`,`age`,`billAddressLine1`,`billAddressLine2`,`billCity`,`billState`,`billZipCode`,`shipAddressLine1`,`shipAddressLine2`,`shipCity`,`shipState`,`shipZipCode`,`phoneNumber`,`emailAddress`,`memberPassword`,`memberSince`,`activeStatus`,`genrePreference`) VALUES 
 (10001,'silver','rshelby','Richard','Shelby',1,'422 Princeton Ct.','','Birmingham','AL','56231','422 Princeton Ct.','','Birmingham','AL','56231','(555) 555-0001','rshelby@yahoo.com','sesame','2007-01-01',1,'comedy'),
 (10002,'gold','jsessions','Jeff','Sessions',2,'68 Hanover Dr.','Apt 2','Mobile','AL','56498','68 Hanover Dr.','Apt 2','Mobile','AL','56498','(555) 555-0002','jsessions@yahoo.com','sesame','2007-01-01',1,'horror'),
 (10003,'platinum','tstevens','Ted','Stevens',3,'1001 S. Limerick Dr.','','Anchorage','AK','45232','1001 S. Limerick Dr.','','Anchorage','AK','45232','(555) 555-1112','tstevens@yahoo.com','sesame','2007-01-01',1,'thriller'),
 (10004,'silver','lmurkowski','Lisa','Murkowski',4,'78 Bay Rd.','','Anchorage','AK','45678','78 Bay Rd.','','Anchorage','AK','45678','(555) 558-4621','lmurkowski@yahoo.com','sesame','2007-01-01',1,'sci-fi'),
 (10005,'gold','jmccain','John','McCain',5,'3042 W. Sunset Blvd','','Phoenix','AZ','98576','3042 W. Sunset Blvd','','Phoenix','AZ','98576','(555) 982-3861','jmccain@yahoo.com','sesame','2008-01-01',1,'drama'),
 (10006,'platinum','jkyl','Jon','Kyl',6,'893 E.Rocky Rd.','Suite 701','Phoenix','AZ','89454','893 E.Rocky Rd.','Suite 701','Phoenix','AZ','89454','(555) 465-7312','jkyl@yahoo.com','sesame','2006-01-01',1,'action'),
 (10007,'silver','blincoln','Blanche','Lincoln',7,'3753 N. Pulaski Rd','','Helena','AR','64512','3753 N. Pulaski Rd','','Helena','AR','64512','(555) 643-1248','blincoln@yahoo.com','sesame','2006-01-01',1,'comedy'),
 (10008,'gold','mpryor','Mark','Pryor',8,'9 Faith Hill','Apt 7','Boumont','AR','76454','9 Faith Hill','Apt 7','Boumont','AR','76454','(555) 643-1279','mpryor@yahoo.com','sesame','2008-01-01',1,'horror'),
 (10009,'platinum','dfeinstein','Dianne','Feinstein',9,'239 Seaside Rd.','','Pasadena','CA','40232','239 Seaside Rd.','','Pasadena','CA','40232','(555) 976-4542','dfeinstein@yahoo.com','sesame','2008-01-01',1,'thriller'),
 (10010,'silver','bboxer','Barbara','Boxer',10,'678 S. Wales Street','','San Francisco','CA','30575','678 S. Wales Street','','San Francisco','CA','30575','(555) 643-4789','bboxer@yahoo.com','sesame','2006-01-01',1,'sci-fi'),
 (10011,'gold','wallard','Wayne','Allard',11,'3833 N. Pinecone Way','','Denver','CO','78663','3833 N. Pinecone Way','','Denver','CO','78663','(555) 982-3572','wallard@yahoo.com','sesame','2008-01-01',1,'drama'),
 (10012,'platinum','ksalazar','Ken','Salazar',12,'1232 E. 5th Street','','Boulder','CO','30454','1232 E. 5th Street','','Boulder','CO','30454','(892) 352-8758','ksalazar@yahoo.com','sesame','2008-01-01',1,'action'),
 (10013,'silver','cdodd','Chris','Dodd',13,'89','','New Haven','CT','34222','89','','New Haven','CT','34222','(304) 985-7129','cdodd@yahoo.com','sesame','2007-01-01',1,'comedy '),
 (10014,'gold','jlieberman','Joe','Lieberman',14,'468 Kane Court','','Bridgeport','CT','39845','468 Kane Court','','Bridgeport','CT','39845','(398) 457-1029','jlieberman@yahoo.com','sesame','2007-01-01',1,'horror'),
 (10015,'platinum','jbiden','Joe','Biden',15,'9485 Diversey Ave.','','Wellington','DE','2435','9485 Diversey Ave.','','Wellington','DE','2435','(239) 482-9762','jbiden@yahoo.com','sesame','2007-01-01',1,'thriller'),
 (10016,'silver','tcaper','Tom','Carper',16,'12 Peacock Circle','','Monterrey','DE','24872','12 Peacock Circle','','Monterrey','DE','24872','(239) 847-5120','tcarper@yahoo.com','sesame','2008-01-01',1,'sci-fi'),
 (10017,'gold','bnelson','Bill','Nelson',17,'4820 Futon Rd.','','Miami','FL','20841','4820 Futon Rd.','','Miami','FL','20841','(304) 920-9678','bnelson@yahoo.com','sesame','2007-01-01',1,'drama'),
 (10018,'platinum','mmartinez','Mel','Martinez',18,'248 Beachside Drive','','Pensacola','FL','60948','248 Beachside Drive','','Pensacola','FL','60948','(789) 465-8927','mmartinez@yahoo.com','sesame','2008-01-01',1,'action'),
 (10019,'silver','ddurbin','Dick','Durbin',19,'300 E. Wacker Dr.','','Chicago','IL','60001','300 E. Wacker Dr.','','Chicago','IL','60001','(312) 394-8762','ddurbin@yahoo.com','sesame','2008-01-01',1,'comedy'),
 (10020,'gold','bobama','Barack','Obama',20,'32 S. State Street','','Chicago','IL','60001','32 S. State Street','','Chicago','IL','60001','(312) 389-4762','bobama@yahoo.com','sesame','2008-01-01',1,'horror'),
 (10041,'Platinum','LASTTEST','LASTTEST','LASTTEST',0,'LASTTEST','LASTTEST','LASTTEST','KY','345345','LASTTEST','LASTTEST','LASTTEST','KY','34543','34534','LASTTEST','LASTTEST',NULL,NULL,'action'),
 (10042,'Platinum','finaltest','finaltest','finaltest',0,'finaltest','finaltest','finaltest','LA','34534','finaltest','finaltest','finaltest','MD','finaltest','34534534534','finaltest','finaltest',NULL,NULL,'action');

--
-- Definition of table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `movieGenre` varchar(45) default NULL,
  `movieTitle` varchar(45) default NULL,
  `movieDescription` text,
  `movieYearReleased` varchar(10) default NULL,
  `movieImage` varchar(45) default NULL,
  `movieTrailer` varchar(255) default NULL,
  `movieReleaseDate` date default NULL,
  `movieMPAARating` varchar(10) default NULL,
  PRIMARY KEY  (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieID`,`movieGenre`,`movieTitle`,`movieDescription`,`movieYearReleased`,`movieImage`,`movieTrailer`,`movieReleaseDate`,`movieMPAARating`) VALUES 
 (1,'Drama','11:14','Tells the seemingly random yet vitally connected story of a set of incidents that all converge one evening at 11:14pm. The story follows the chain of events of five different characters and five different storylines that all converge to tell the story of murder and deceit.','2003','1114.jpg','http://www.imdb.com/video/screenplay/vi2326987033/','2004-08-20','R'),
 (2,'Drama','21 Grams','A freak accident brings together a critically ill mathematician (Penn) a grieving mother (Watts) and a born-again ex-con (Del Toro).','2003','21Grams.jpg','http://www.imdb.com/video/screenplay/vi3383951641/','2003-12-26','R'),
 (3,'Drama','25th Hour','Cornered by the DEA convicted New York drug dealer Montgomery Brogan (Norton) reevaluates his life in the 24 remaining hours before facing a seven-year jail term.','2002','25thHour.jpg','http://www.imdb.com/video/screenplay/vi3350397209/','2003-01-10','R'),
 (4,'Drama','A Beautiful Mind','After a brilliant but asocial mathematician accepts secret work in cryptography his life takes a turn to the nightmarish.','2001','ABeautifulMind.jpg','http://www.imdb.com/video/screenplay/vi2279866649/','2002-01-04','PG-13'),
 (5,'Drama','A Bronx Tale','A father becomes worried when a local gangster befriends his son in the Bronx in the 1960s.','1993','ABronxTale.jpg','http://www.youtube.com/watch?v=1bkIqZfviXU','1993-09-29','R'),
 (6,'Drama','A Few Good Men','Neo military lawyer Kaffee defends Marines accused of murder; they contend they were acting under orders.','1992','AFewGoodMen.jpg','http://www.imdb.com/video/screenplay/vi2142503193/','1992-12-11','R'),
 (7,'Sci-Fi','Alien','A mining ship investigating a suspected SOS lands on a distant planet. The crew discovers some strange creatures and investigates.','1979','Alien.jpg','http://www.imdb.com/video/imdb/vi1497801241/','1979-05-25','R'),
 (8,'Sci-Fi','Alien³','Ripley continues to be stalked by a savage alien after her escape pod crashes on a prison planet.','1992','Alien3.jpg','http://www.imdb.com/video/screenplay/vi1520474905/','1992-05-22','R'),
 (9,'Sci-Fi','Aliens','The planet from Alien (1979) has been colonized but contact is lost. This time the rescue team has impressive firepower enough?','1986','Aliens.jpg','http://www.imdb.com/video/screenplay/vi368744473/','1986-07-18','R'),
 (10,'Drama','Always Outnumbered','An ex-con moves to L.A. to find work and creates a disturbance by fighting for a position.','1998','AlwaysOutnumbered.jpg','http://www.youtube.com/watch?v=bMgLHo1phOw','1998-03-21','R'),
 (11,'Drama','Amadeus','The incredible story of Wolfgang Amadeus Mozart told in flashback mode by Antonio Salieri - now confined to an insane asylum.','1984','Amadeus.jpg','http://www.imdb.com/video/screenplay/vi2535496985/','1984-09-19','R'),
 (12,'Drama','American Beauty','Lester Burnham a depressed suburban father in a mid-life crisis decides to turn his hectic life around after developing an infatuation for his daughter\'s attractive friend.','1999','AmericanBeauty.jpg','http://www.imdb.com/video/screenplay/vi917897497/','1999-10-01','R'),
 (13,'Drama','American History X','A former neo-nazi skinhead (Norton) tries to prevent his younger brother (Furlong) from going down the same wrong path that he did.','1998','AmericanHistoryX.jpg','http://www.imdb.com/video/screenplay/vi854001177/','1998-10-30','R'),
 (14,'Drama','Amistad','AMISTAD is about a 1839 mutiny aboard a slave ship that is traveling towards the Northeast Coast of America. Much of the story involves a court-room 1 about the free-man who led the revolt.','1997','Amistad.jpg','http://www.imdb.com/video/screenplay/vi2161771289/','1997-12-10','R'),
 (15,'Drama','Amores perros','A horrific car accident connects three stories each involving characters dealing with loss regret and life\'s harsh realities all in the name of love.','2000','AmoresPerros.jpg','http://www.youtube.com/watch?v=XToRtfQbeHg','2000-06-16','R'),
 (16,'Comedy','Anger Management','Sandler plays a businessman who is wrongly sentenced to an anger-management program where he meets an aggressive instructor.','2003','AngerManagement.jpg','http://www.imdb.com/video/screenplay/vi3853910297/','2003-04-11','PG-13'),
 (17,'Drama','Any Given Sunday','Any Given Sunday is a behind the scenes look at the life and death struggles of modern day gladiators and those who lead them.','1999','AnyGivenSunday.jpg','http://www.youtube.com/watch?v=RN7sKvaHDlA','1999-12-22','R'),
 (18,'Comedy','Arizona Dream','An Innuit hunter races his sled home with a fresh-caught halibut. This fish pervades the entire film...','1993','ArizonaDream.jpg','http://www.youtube.com/watch?v=5xgHBIHUqfc','1994-09-09','R'),
 (19,'Drama','Arlington Road','A college professor begins to suspect that his neighbour is a terrorist.','1999','ArlingtonRd.jpg','http://www.youtube.com/watch?v=nk2CPzIgBRo','1999-07-09','R'),
 (20,'Comedy','As Good as It Gets','A single mother/waitress a misanthropic author and a gay artist form an unlikely friendship','1997','AsGoodAsItGets.jpg','http://www.youtube.com/watch?v=BXHxg6Ug9GM','1997-12-25','PG-13'),
 (21,'Action','Assassins','Robert Rath (Sylvester Stallone) is a seasoned hitman who just wants out of the business with no back talk...','1995','Assassins.jpg','http://www.imdb.com/video/screenplay/vi4038525209/','1995-10-06','R'),
 (22,'Drama','At First Sight','A blind man has an operation to regain his sight at the urging of his girlfriend and must deal with the changes to his life.','1999','AtFirstSight.jpg','http://www.youtube.com/watch?v=os50D-aOZQo','1999-01-15','R'),
 (23,'Drama','Autumn in New York','Romantic 1 about an aging playboy who falls for a sweet but terminally ill young woman.','2000','AutumnInNewYork.jpg','http://www.youtube.com/watch?v=zACckn8ie-8','2000-08-11','PG-13'),
 (24,'Drama','Awakenings','The victims of an encephalitis epidemic many years ago have been catatonic ever since but now a new drug offers the prospect of reviving them.','1990','Awakenings.jpg','http://www.imdb.com/video/screenplay/vi1387790617/','1990-12-20','PG-13'),
 (25,'Drama','Babel','Tragedy strikes a married couple on vacation in the Moroccan desert touching off an interlocking story involving four different families.','2006','Babel.jpg','http://www.imdb.com/video/screenplay/vi2058879257/','2006-11-10','R'),
 (26,'Drama','Bang Bang You\'re Dead','For the most part it\'s a tale of a kid Trevor who gets picked on a lot a school. Not as much as he used to...','2002','BangBangYourDead.jpg','http://www.cinemagia.ro/trailer/bang-bang-youre-dead-5882/','2002-10-13','R'),
 (27,'Drama','Basic','A DEA agent investigates the disappearance of a legendary Army ranger drill sergeant and several of his cadets during a training exercise gone severely awry.','2003','Basic.jpg','http://www.imdb.com/video/screenplay/vi112787737/','2003-03-28','R'),
 (28,'Drama','Basic Instinct','A police detective is in charge of the investigation of a brutal murder in which a beautiful and seductive woman could be involved.','1992','BasicInstinct.jpg','http://www.imdb.com/video/screenplay/vi129564953/','1992-03-20','R'),
 (29,'Drama','Before Sunset','It\'s nine years after Jesse and Celine first met; now they encounter one another on the French leg of Jesse\'s book tour.','2004','BeforeSunset.jpg','http://www.imdb.com/video/screenplay/vi2813919513/','2004-06-17','R'),
 (30,'Comedy','Being John Malkovich','A puppeteer discovers a portal that leads literally into the head of the movie star John Malkovich.','1999','BeingJohnMalkovich.jpg','http://www.imdb.com/video/screenplay/vi3778520089/','1999-11-24','R'),
 (31,'Drama','Best Laid Plans','Ever feel like the world is conspiring against you... You don\'t have to tell me where you\'ve been... Everyone sucks but us... keeping a relationship alive can be murder.','1999','BestLaidPlans.jpg','http://www.imdb.com/video/screenplay/vi364511513/','1999-05-14','R'),
 (32,'Sci-Fi','Bicentennial Man','An android endeavors to become human as he gradually acquires emotions.','1999','BicentennialMan.jpg','http://www.imdb.com/video/screenplay/vi783941913/','1999-12-17','PG'),
 (33,'Drama','Big Fish','A story about a son trying to learn more about his dying father by reliving stories and myths his father told him about himself.','2003','BigFish.jpg','http://www.imdb.com/video/screenplay/vi1522139417/','2004-01-09','PG-13'),
 (34,'Drama','Birdy','Two friends arrive back from Vietnam scarred in different ways. One has physical injuries the other...','1984','Birdy.jpg','http://www.imdb.com/video/screenplay/vi1840906521/','1984-12-21','R'),
 (35,'Comedy','Birthday Girl','A thirtysomething bank clerk from St Albans has his small-town life exploded by the arrival of his Russian mail-order bride.','2001','BirthdayGirl.jpg','http://www.imdb.com/video/screenplay/vi1743691289/','2002-02-01','R'),
 (36,'Drama','Blow','The story of George Jung the man who established the American cocaine market in the 1970\'s.','2001','Blow.jpg','http://www.imdb.com/video/screenplay/vi3504603417/','2001-04-06','R'),
 (37,'Horror','Book of Shadows: Blair Witch 2','College students at a Boston college become fascinated by the events of the three missing filmmakers in Maryland so they decide to go into the same woods and find out what really happened.','2000','BlairWitch2.jpg','http://www.imdb.com/video/screenplay/vi3300524313/','2000-10-27','R'),
 (38,'Drama','Boss of Bosses','The story of the rise and fall of the powerful New York City organized crime boss Paul Castellano.','2001','BossOfBosses.jpg','http://www.youtube.com/watch?v=shSjnxcY1I8','2005-07-19','R'),
 (39,'Drama','Bounce','A man switches plane tickets with another man who dies in that plane in a crash. The man falls in love with the deceased one\'s wife.','2000','Bounce.jpg','http://www.imdb.com/video/screenplay/vi2548997657/','2000-11-15','PG-13'),
 (40,'Drama','Bringing Out the Dead','Frank Pierce is a paramedic working Gotham\'s Hell\'s Kitchen. He\'s become burned out and haunted by visions of the people he\'s tried to save.','1999','BringingOutTheDead.jpg','http://www.imdb.com/video/screenplay/vi1002176793/','1999-10-22','R'),
 (41,'Comedy','Buffalo \'66','Billy is released after five years in prison. In the next moment he kidnaps teenage student Layla and visits his parents with her...','1998','Buffallo66.jpg','http://www.imdb.com/video/screenplay/vi1102840089/','1998-06-26','R'),
 (42,'Drama','Carandiru','Film based on real life experiences of doctor Drauzio Varella inside dreadful State penitentiary Carandiru...','2003','Carandiru.jpg','http://www.imdb.com/video/screenplay/vi3971744025/','2003-04-11','R'),
 (43,'Drama','Carlito\'s Way','A Puerto-Rican ex-con just released from prison pledges to stay away from drugs and violence despite the pressure around him and lead on to a better life outside of NYC.','1993','CarlitosWay.jpg','http://www.imdb.com/video/screenplay/vi431816985/','1993-11-10','R'),
 (44,'Drama','Carne trémula','After leaving jail Víctor is still in love with Elena but she\'s married to the former cop -now basketball player- who became paralysed by a shot from Víctor\'s gun...','1997','CarneTremula.jpg','http://www.cinemagia.ro/trailer/carne-tremula-6117/','1998-01-16','R'),
 (45,'Drama','Casino','Greed deception money power and murder occur between two mobster best friends and a trophy wife over a gambling empire.','1995','Casino.jpg','http://www.imdb.com/video/screenplay/vi1035796761/','1995-11-22','R'),
 (46,'Drama','Cast Away','A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.','2000','CastAway.jpg','http://www.youtube.com/watch?v=2TWYDogv4WQ','2000-12-22','PG-13'),
 (47,'Drama','Catch Me If You Can','A true story about Frank Abagnale Jr. who before his 19th birthday successfully conned millions of dollars worth of checks as a Pan Am pilot doctor and legal prosecutor.','2002','CatchMeIfYouCan.jpg','http://www.imdb.com/video/screenplay/vi1220346137/','2002-12-25','PG-13'),
 (48,'Drama','Changing Lanes','The story of what happens one day in New York when a young lawyer and a businessman share a small automobile accident on F.D.R. Drive and their mutual road rage escalates into a feud...','2002','ChangingLanes.jpg','http://www.imdb.com/video/screenplay/vi1824325913/','2002-04-12','R'),
 (49,'Drama','Cidade de Deus','Two boys growing up in a violent neighborhood of Rio de Janeiro take different paths: one becomes a photographer the other a drug dealer.','2002','CityOfGod.jpg','http://www.imdb.com/video/screenplay/vi3639516697/','2002-08-30','R'),
 (50,'Drama','City by the Sea','Vincent Lamarca whose father was executed for a 1950s kidnapping of a child grew up to become a police officer only to see his own son become a murderer.','2002','CityByTheSea.jpg','http://www.imdb.com/video/screenplay/vi2663252249/','2002-09-06','R'),
 (51,'Action','The Avengers','Nick Fury of S.H.I.E.L.D. brings together a team of super humans to form The Avengers to help save the Earth from Loki and his army.','2012','the_avengers.jpg','http://www.youtube.com/watch?v=eOrNdBpGMv8','2012-09-25','PG-13'),
 (52,'Action','Terminator 2: Judgment Day','The cyborg who once tried to kill Sarah Connor is dead, and another T-101 must now protect her teenage son, John Connor, from an even more powerful and advanced Terminator, the T-1000.','1991','Terminator2.jpg','http://www.youtube.com/watch?v=oL1RE8JXaIw','1997-10-22','R'),
 (53,'Sci-Fi','Prometheus','A team of explorers discover a clue to the origins of mankind on Earth, leading them on a journey to the darkest corners of the universe. There, they must fight a terrifying battle to save the future of the human race. ','2012','prometheus.jpg','http://www.youtube.com/watch?v=sftuxbvGwiU','2012-10-09','R');


--
-- Definition of table `moviereview`
--

DROP TABLE IF EXISTS `moviereview`;
CREATE TABLE `moviereview` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `memberID` int(10) unsigned NOT NULL,
  `rating` tinyint(2) NOT NULL,
  `reviewText` varchar(240) NOT NULL,
  PRIMARY KEY USING BTREE (`movieID`,`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `moviereview`
--

INSERT INTO `moviereview` (`movieID`, `memberID`, `rating`, `reviewText`) VALUES
  (1, 1, 8, 'Honestly, fairly mediocre. Could have been better.'),
  (2, 2, 10, 'This movie changed my life. Ever since I saw this movie, all other movies have seemed lackluster.'),
  (3, 3, 0, 'How can this even be considered a movie? The part where the heroes all form a massive mecha is just trite.'),
  (51, 13, 4, 'Ok but Infinity War was better...');

--
-- Definition of table `viewedmovies`
--

DROP TABLE IF EXISTS `viewedmovies`;
CREATE TABLE `viewedmovies` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `memberID` int(10) unsigned NOT NULL,
  `numViews` int(10) unsigned NOT NULL,
  PRIMARY KEY USING BTREE (`movieID`,`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `viewedmovies`
--

INSERT INTO `viewedmovies` (`movieID`, `memberID`, `numViews`) VALUES
  (1, 1, 2),
  (2, 2, 4),
  (3, 3, 1),
  (51, 13, 3);

--
-- Definition of table `movieperson`
--

DROP TABLE IF EXISTS `movieperson`;
CREATE TABLE `movieperson` (
  `movieID` int(10) unsigned NOT NULL auto_increment,
  `personID` int(10) unsigned NOT NULL,
  `actor` tinyint(1) default NULL,
  `producer` tinyint(1) default NULL,
  `director` tinyint(1) default NULL,
  PRIMARY KEY  USING BTREE (`movieID`,`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movieperson`
--

INSERT INTO `movieperson` (`movieID`,`personID`,`actor`,`producer`,`director`) VALUES 
 (1,1,0,0,1),
 (1,485,1,0,0),
 (1,486,1,0,0),
 (1,487,1,0,0),
 (1,488,1,0,0),
 (1,489,1,0,0),
 (1,490,1,0,0),
 (1,491,1,0,0),
 (1,492,1,0,0),
 (1,493,1,0,0),
 (1,494,1,0,0),
 (2,2,0,0,1),
 (2,495,1,0,0),
 (2,496,1,0,0),
 (2,497,1,0,0),
 (2,498,1,0,0),
 (2,499,1,0,0),
 (2,500,1,0,0),
 (3,3,0,0,1),
 (3,501,1,0,0),
 (3,502,1,0,0),
 (3,503,1,0,0),
 (3,504,1,0,0),
 (3,505,1,0,0),
 (3,506,1,0,0),
 (4,4,0,0,1),
 (4,507,1,0,0),
 (4,508,1,0,0),
 (4,509,1,0,0),
 (4,510,1,0,0),
 (4,511,1,0,0),
 (4,512,1,0,0),
 (5,5,0,0,1),
 (5,513,1,0,0),
 (5,514,1,0,0),
 (5,515,1,0,0),
 (6,483,1,0,0),
 (6,517,1,0,0),
 (6,519,1,0,0),
 (6,520,1,0,0),
 (6,521,1,0,0),
 (6,6,0,0,1),
 (7,522,1,0,0),
 (7,523,1,0,0),
 (7,524,1,0,0),
 (7,525,1,0,0),
 (7,526,1,0,0),
 (7,527,1,0,0),
 (7,7,0,0,1),
 (8,523,1,0,0),
 (8,531,1,0,0),
 (8,532,1,0,0),
 (8,533,1,0,0),
 (8,534,1,0,0),
 (8,535,1,0,0),
 (8,8,0,0,1),
 (9,523,1,0,0),
 (9,536,1,0,0),
 (9,537,1,0,0),
 (9,538,1,0,0),
 (9,539,1,0,0),
 (9,9,0,0,1),
 (10,10,0,0,1),
 (10,542,1,0,0),
 (10,543,1,0,0),
 (10,544,1,0,0),
 (10,545,1,0,0),
 (10,546,1,0,0),
 (11,11,0,0,1),
 (11,547,1,0,0),
 (11,548,1,0,0),
 (11,549,1,0,0),
 (11,550,1,0,0),
 (11,551,1,0,0),
 (11,552,1,0,0),
 (12,12,0,0,1),
 (12,553,1,0,0),
 (12,554,1,0,0),
 (12,555,1,0,0),
 (12,556,1,0,0),
 (12,557,1,0,0),
 (12,558,1,0,0),
 (13,13,0,0,1),
 (13,501,1,0,0),
 (13,559,1,0,0),
 (13,560,1,0,0),
 (13,561,1,0,0),
 (13,562,1,0,0),
 (13,563,1,0,0),
 (13,564,1,0,0),
 (14,14,0,0,1),
 (14,565,1,0,0),
 (14,566,1,0,0),
 (14,567,1,0,0),
 (15,2,0,0,1),
 (15,568,1,0,0),
 (15,569,1,0,0),
 (15,570,1,0,0),
 (15,571,1,0,0),
 (16,15,0,0,1),
 (16,483,1,0,0),
 (16,572,1,0,0),
 (16,573,1,0,0),
 (16,574,1,0,0),
 (17,16,0,0,1),
 (17,575,1,0,0),
 (17,576,1,0,0),
 (17,577,1,0,0),
 (17,578,1,0,0),
 (17,579,1,0,0),
 (17,580,1,0,0),
 (18,17,0,0,1),
 (18,581,1,0,0),
 (18,582,1,0,0),
 (18,583,1,0,0),
 (19,18,0,0,1),
 (19,584,1,0,0),
 (19,585,1,0,0),
 (19,586,1,0,0),
 (19,587,1,0,0),
 (20,19,0,0,1),
 (20,483,1,0,0),
 (20,588,1,0,0),
 (20,589,1,0,0),
 (20,590,1,0,0),
 (21,20,0,0,1),
 (21,592,1,0,0),
 (21,593,1,0,0),
 (21,594,1,0,0),
 (22,21,0,0,1),
 (22,595,1,0,0),
 (22,596,1,0,0),
 (22,597,1,0,0),
 (23,22,0,0,1),
 (23,598,1,0,0),
 (23,599,1,0,0),
 (23,600,1,0,0),
 (24,23,0,0,1),
 (24,5,1,0,1),
 (24,601,1,0,0),
 (24,602,1,0,0),
 (25,2,0,0,1),
 (25,603,1,0,0),
 (25,604,1,0,0),
 (26,24,0,0,1),
 (26,493,1,0,0),
 (26,605,1,0,0),
 (27,25,0,0,1),
 (27,610,1,0,0),
 (27,611,1,0,0),
 (28,26,0,0,1),
 (29,27,0,0,1),
 (29,612,1,0,0),
 (29,613,1,0,0),
 (30,28,0,0,1),
 (30,576,1,0,0),
 (30,614,1,0,0),
 (30,615,1,0,0),
 (31,29,0,0,1),
 (31,616,1,0,0),
 (31,617,1,0,0),
 (32,30,0,0,1),
 (32,602,1,0,0),
 (32,622,1,0,0),
 (32,623,1,0,0),
 (33,31,0,0,1),
 (33,624,1,0,0),
 (33,625,1,0,0),
 (33,626,1,0,0),
 (33,627,1,0,0),
 (34,32,0,0,1),
 (34,628,1,0,0),
 (34,629,1,0,0),
 (35,33,0,0,1),
 (35,630,1,0,0),
 (35,631,1,0,0),
 (36,34,0,0,1),
 (36,581,1,0,0),
 (36,632,1,0,0),
 (36,633,1,0,0),
 (37,35,0,0,1),
 (37,634,1,0,0),
 (37,635,1,0,0),
 (38,36,0,0,1),
 (38,637,1,0,0),
 (39,37,0,0,1),
 (39,638,1,0,0),
 (39,639,1,0,0),
 (40,38,0,0,1),
 (40,629,1,0,0),
 (40,640,1,0,0),
 (40,641,1,0,0),
 (41,39,0,0,1),
 (41,642,1,0,0),
 (41,643,1,0,0),
 (42,40,0,0,1),
 (42,644,1,0,0),
 (42,645,1,0,0),
 (43,41,0,0,1),
 (43,495,1,0,0),
 (43,575,1,0,0),
 (43,646,1,0,0),
 (44,42,0,0,1),
 (44,632,1,0,0),
 (44,647,1,0,0),
 (44,648,1,0,0),
 (45,38,0,0,1),
 (45,5,1,0,1),
 (45,516,1,0,0),
 (45,578,1,0,0),
 (45,611,1,0,0),
 (46,43,0,0,1),
 (46,649,1,0,0),
 (46,650,1,0,0),
 (47,14,0,0,1),
 (47,649,1,0,0),
 (47,651,1,0,0),
 (47,652,1,0,0),
 (47,653,1,0,0),
 (48,44,0,0,1),
 (48,609,1,0,0),
 (48,638,1,0,0),
 (49,45,0,0,1),
 (49,654,1,0,0),
 (49,655,1,0,0),
 (50,46,0,0,1),
 (50,5,1,0,1),
 (50,656,1,0,0);



--
-- Definition of table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `personID` int(10) unsigned NOT NULL auto_increment,
  `personFirstName` varchar(45) default NULL,
  `personLastName` varchar(45) default NULL,
  PRIMARY KEY  (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--


INSERT INTO `person` (`personID`,`personFirstName`,`personLastName`) VALUES 
 (1,'Greg','Marcks'),
 (2,'Alejandro','González Iñárritu'),
 (3,'Spike','Lee'),
 (4,'Ron','Howard'),
 (5,'Robert','De Niro'),
 (6,'Rob','Reiner'),
 (7,'Ridley','Scott'),
 (8,'David','Fincher'),
 (9,'James','Cameron'),
 (10,'Michael','Apted'),
 (11,'Milos','Forman'),
 (12,'Sam','Mendes'),
 (13,'Tony','Kaye'),
 (14,'Steven','Spielberg'),
 (15,'Peter','Segal'),
 (16,'Oliver','Stone'),
 (17,'Emir','Kusturica'),
 (18,'Mark','Pellington'),
 (19,'James','Brooks'),
 (20,'Richard','Donner'),
 (21,'Irwin','Winkler'),
 (22,'Joan','Chen'),
 (23,'Penny','Marshall'),
 (24,'Guy','Ferland'),
 (25,'John','McTiernan'),
 (26,'Paul','Verhoeven'),
 (27,'Richard','Linklater'),
 (28,'Spike','Jonze'),
 (29,'Mike','Barker'),
 (30,'Chris','Columbus'),
 (31,'Tim','Burton'),
 (32,'Alan','Parker'),
 (33,'Jez','Butterworth'),
 (34,'Ted','Demme'),
 (35,'Joe','Berlinger'),
 (36,'Dwight','Little'),
 (37,'Don','Roos'),
 (38,'Martin','Scorsese'),
 (39,'Vincent','Gallo'),
 (40,'Hector','Babenco'),
 (41,'Brian','De Palma'),
 (42,'Pedro','Almodóvar'),
 (43,'Robert','Zemeckis'),
 (44,'Roger','Michell'),
 (45,'Fernando','Meirelles'),
 (46,'Michael','Caton-Jones'),
 (480,'Fred','Flintstone'),
 (481,'Barney','Rubble'),
 (482,'John','Smith'),
 (483,'Jack','Nicholson'),
 (484,'Clint','Eastwood'),
 (485,'Henry','Thomas'),
 (486,'Blake','Heron'),
 (487,'Barbara','Hershey'),
 (488,'Clark','Gregg'),
 (489,'Hilary','Swank'),
 (490,'Shawn','Hatosy'),
 (491,'Stark','Sands'),
 (492,'Colin','Hanks'),
 (493,'Ben','Foster'),
 (494,'Patrick','Swayze'),
 (495,'Sean','Penn'),
 (496,'Naomi','Watts'),
 (497,'Danny','Huston'),
 (498,'Carly','Nahon'),
 (499,'Claire','Pakis'),
 (500,'Benicio','Del Toro'),
 (501,'Edward','Norton'),
 (502,'Philip','Seymour Hoffman'),
 (503,'Barry','Pepper'),
 (504,'Rosario','Dawson'),
 (505,'Anna','Paquin'),
 (506,'Brian','Cox'),
 (507,'Russell','Crowe'),
 (508,'Ed','Harris'),
 (509,'Jennifer','Connelly'),
 (510,'Christopher','Plummer'),
 (511,'Paul','Bettany'),
 (512,'Judd','Hirsch'),
 (513,'Chazz','Palminteri'),
 (514,'Lillo','Brancato'),
 (515,'Francis','Capra'),
 (516,'Joe','Pesci'),
 (517,'Tom','Cruise'),
 (519,'Demi','Moore'),
 (520,'Kevin','Bacon'),
 (521,'Kiefer','Sutherland'),
 (522,'Tom','Skerritt'),
 (523,'Sigourney','Weaver'),
 (524,'Veronica','Cartwright'),
 (525,'Harry','Dean Stanton'),
 (526,'John','Hurt'),
 (527,'Ian','Holm'),
 (531,'Charles','Dutton'),
 (532,'Charles','Dance'),
 (533,'Paul','McGann'),
 (534,'Brian','Glover'),
 (535,'Ralph','Brown'),
 (536,'Carrie','Henn'),
 (537,'Michael','Biehn'),
 (538,'Lance','Henriksen'),
 (539,'Paul','Reiser'),
 (542,'Laurence','Fishburne'),
 (543,'Daniel','Williams'),
 (544,'Bill','Cobbs'),
 (545,'Natalie','Cole'),
 (546,'Laurie','Metcalf'),
 (547,'F. Murray','Abraham'),
 (548,'Tom','Hulce'),
 (549,'Elizabeth','Berridge'),
 (550,'Roy','Dotrice'),
 (551,'Simon','Callow'),
 (552,'Christine','Ebersole'),
 (553,'Kevin','Spacey'),
 (554,'Annette','Bening'),
 (555,'Thora','Birch'),
 (556,'Wes','Bentley'),
 (557,'Mena','Suvari'),
 (558,'Scott','Bakula'),
 (559,'Edward','Furlong'),
 (560,'Beverly','D\'Angelo'),
 (561,'Avery','Brooks'),
 (562,'Jennifer','Lien'),
 (563,'Stacy','Keach'),
 (564,'Elliott','Gould'),
 (565,'Morgan','Freeman'),
 (566,'Nigel','Hawthorne'),
 (567,'Anthony','Hopkins'),
 (568,'Emilio','Echevarría'),
 (569,'Gael','García Bernal'),
 (570,'Goya','Toledo'),
 (571,'Álvaro','Guerrero'),
 (572,'Adam','Sandler'),
 (573,'Marisa','Tomei'),
 (574,'Luis','Guzmán'),
 (575,'Al','Pacino'),
 (576,'Cameron','Diaz'),
 (577,'Dennis','Quaid'),
 (578,'James','Woods'),
 (579,'Jamie','Foxx'),
 (580,'LL','Cool J'),
 (581,'Johnny','Depp'),
 (582,'Jerry','Lewis'),
 (583,'Faye','Dunaway'),
 (584,'Jeff','Bridges'),
 (585,'Tim','Robbins'),
 (586,'Joan','Cusack'),
 (587,'Hope','Davis'),
 (588,'Helen','Hunt'),
 (589,'Greg','Kinnear'),
 (590,'Cuba','Gooding Jr.'),
 (592,'Sylvester','Stallone'),
 (593,'Antonio','Banderas'),
 (594,'Julianne','Moore'),
 (595,'Val','Kilmer'),
 (596,'Mira','Sorvino'),
 (597,'Kelly','McGillis'),
 (598,'Richard','Gere'),
 (599,'Winona','Ryder'),
 (600,'Anthony','LaPaglia'),
 (601,'Julie','Kavner'),
 (602,'Robin','Williams'),
 (603,'Brad','Pitt'),
 (604,'Cate','Blanchett'),
 (605,'Thomas','Cavanagh'),
 (607,'John','Travolta'),
 (608,'Connie','Nielsen'),
 (609,'Samuel L.','Jackson'),
 (610,'Michael','Douglas'),
 (611,'Sharon','Stone'),
 (612,'Ethan','Hawke'),
 (613,'Julie','Delpy'),
 (614,'John','Malkovich'),
 (615,'John','Cusack'),
 (616,'Alessandro','Nivola'),
 (617,'Reese','Witherspoon'),
 (622,'Embeth','Davidtz'),
 (623,'Sam','Neill'),
 (624,'Ewan','McGregor'),
 (625,'Albert','Finney'),
 (626,'Billy','Crudup'),
 (627,'Jessica','Lange'),
 (628,'Matthew','Modine'),
 (629,'Nicolas','Cage'),
 (630,'Nicole','Kidman'),
 (631,'Ben','Chaplin'),
 (632,'Penélope','Cruz'),
 (633,'Paul','Reubens'),
 (634,'Kim','Director'),
 (635,'Kurt','Loder'),
 (637,'Angela','Alvarado'),
 (638,'Ben','Affleck'),
 (639,'Gwyneth','Paltrow'),
 (640,'Patricia','Arquette'),
 (641,'John','Goodman'),
 (642,'Christina','Ricci'),
 (643,'Mickey','Rourke'),
 (644,'Luiz Carlos','Vasconcelos'),
 (645,'Milton','Gonçalves'),
 (646,'John','Leguizamo'),
 (647,'Javier','Bardem'),
 (648,'Francesca','Neri'),
 (649,'Tom','Hanks'),
 (650,'Lari','White'),
 (651,'Leonardo','DiCaprio'),
 (652,'Christopher','Walken'),
 (653,'Martin','Sheen'),
 (654,'Alexandre','Rodrigues'),
 (655,'Leandro','Firmino'),
 (656,'Frances','McDormand');



--
-- Definition of table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `memberID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL default '0',
  `queueSequence` int(10) unsigned default NULL,
  `movieTitle` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`memberID`,`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`memberID`,`movieID`,`queueSequence`,`movieTitle`) VALUES 
 (10001,8,4,'Alien³'),
 (10002,22,1,'At First Sight'),
 (10002,27,4,'Basic'),
 (10002,31,5,'Best Laid Plans'),
 (10002,33,6,'Big Fish'),
 (10003,5,1,'A Bronx Tale'),
 (10003,6,2,'A Few Good Men'),
 (10003,7,3,'Alien'),
 (10003,8,4,'Alien³'),
 (10003,15,5,'Amores Perros'),
 (10003,16,6,'Anger Management'),
 (10003,17,7,'Any Given Sunday'),
 (10003,18,8,'Arizona Dream'),
 (10003,19,9,'Arlington Road'),
 (10004,6,6,'A Few Good Men'),
 (10004,7,7,'Alien'),
 (10004,8,8,'Alien³'),
 (10004,9,9,'Aliens'),
 (10004,11,2,'Amadeus'),
 (10004,12,3,'American Beauty'),
 (10004,13,4,'American History X'),
 (10004,14,5,'Amistad'),
 (10004,20,1,'As Good As It Gets'),
 (10005,10,1,'Always Outnumbered'),
 (10005,46,2,'Cast Away'),
 (10005,47,3,'Catch Me If You Can'),
 (10005,48,4,'Changing Lanes'),
 (10005,49,5,'Cidade de Deus'),
 (10005,50,6,'City By The Sea'),
 (10006,2,6,'25th Hour'),
 (10006,31,1,'Best Laid Plans'),
 (10006,32,2,'Bicentennial Man'),
 (10006,33,3,'Big Fish'),
 (10006,34,4,'Birdy'),
 (10006,35,5,'Birthday Girl'),
 (10007,3,1,'25th Hour'),
 (10007,4,2,'A Beautiful Mind'),
 (10007,41,3,'Buffalo \'66'),
 (10008,42,1,'Carandiru'),
 (10008,43,2,'Carltio\'s Way'),
 (10009,7,9,'Alien'),
 (10009,21,4,'Assassins'),
 (10009,22,5,'At First Sight'),
 (10009,23,6,'Autumn in New York'),
 (10009,24,7,'Awakenings'),
 (10009,25,8,'Babel'),
 (10009,44,1,'Carne Trémula'),
 (10009,45,2,'Casino'),
 (10009,46,3,'Cast Away'),
 (10010,8,1,'Alien³'),
 (10010,9,2,'Aliens'),
 (10010,10,3,'Always Outnumbered'),
 (10010,13,4,'American History X'),
 (10010,14,5,'Amistad'),
 (10010,15,6,'Amores Perros'),
 (10010,16,7,'Anger Management'),
 (10011,7,6,'Alien'),
 (10011,26,1,'Bang Bang You\'re Dead'),
 (10011,27,2,'Basic'),
 (10011,28,3,'Basic Instinct'),
 (10011,29,4,'Before Sunset'),
 (10011,30,5,'Being John Malkovich'),
 (10012,8,1,'Alien³'),
 (10012,9,2,'Aliens'),
 (10012,10,3,'Always Outnumbered'),
 (10012,13,4,'American History X'),
 (10012,14,5,'Amistad'),
 (10012,15,6,'Amores Perros'),
 (10012,16,7,'Anger Management'),
 (10012,26,8,'Bang Bang You\'re Dead'),
 (10012,27,9,'Basic'),
 (10013,2,10,'25th Hour'),
 (10013,3,11,'25th Hour'),
 (10013,4,12,'A Beautiful Mind'),
 (10013,6,5,'A Few Good Men'),
 (10013,7,6,'Alien'),
 (10013,8,7,'Alien³'),
 (10013,9,8,'Aliens'),
 (10013,11,9,'Amadeus'),
 (10013,14,4,'Amistad'),
 (10013,25,13,'Babel'),
 (10013,28,1,'Basic Instinct'),
 (10013,29,2,'Before Sunset'),
 (10013,30,3,'Being John Malkovich'),
 (10014,7,4,'Alien'),
 (10014,8,5,'Alien³'),
 (10014,9,6,'Aliens'),
 (10014,15,1,'Amores Perros'),
 (10014,16,2,'Anger Management'),
 (10014,44,3,'Carne Trémula'),
 (10015,10,1,'Always Outnumbered'),
 (10015,12,7,'American Beauty'),
 (10015,19,8,'Arlington Road'),
 (10015,26,9,'Bang Bang You\'re Dead'),
 (10015,41,2,'Buffalo \'66'),
 (10015,42,3,'Carandiru'),
 (10015,43,4,'Carltio\'s Way'),
 (10015,44,5,'Carne Trémula'),
 (10015,45,6,'Casino'),
 (10016,27,1,'Basic'),
 (10016,28,2,'Basic Instinct'),
 (10017,29,3,'Before Sunset'),
 (10018,30,4,'Being John Malkovich'),
 (10018,41,5,'Buffalo \'66'),
 (10018,42,6,'Carandiru'),
 (10018,43,7,'Carltio\'s Way'),
 (10019,5,9,'A Bronx Tale'),
 (10019,11,8,'Amadeus'),
 (10019,31,3,'Best Laid Plans'),
 (10019,32,4,'Bicentennial Man'),
 (10019,33,5,'Big Fish'),
 (10019,34,6,'Birdy'),
 (10019,35,7,'Birthday Girl'),
 (10019,44,1,'Carne Trémula'),
 (10019,45,2,'Casino'),
 (10020,9,2,'Aliens');

--
-- Definition for table `checkedout`
--
 
 DROP TABLE IF EXISTS `checkedout`;
CREATE TABLE `checkedout` (
  `memberID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL,
  PRIMARY KEY USING BTREE (`memberID`,`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `checkedout`
--
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `memberID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`memberID`,`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `favorite` (`memberID`,`movieID`) VALUES 
 (10001,8),
 (10002,22),
 (10002,27),
 (10002,31),
 (10002,33),
 (10003,5),
 (10003,6),
 (10003,7),
 (10003,8),
 (10003,15),
 (10003,16),
 (10003,17),
 (10003,18),
 (10003,19),
 (10004,6);

SELECT favorite.movieID FROM favorite
WHERE favorite.memberID = 10002;

SELECT * FROM movie;

SELECT * FROM queue
WHERE queue.memberID = 10002
ORDER BY queueSequence;