-- Comments in SQL Start with dash-dash --
-- Find the app with an ID of 1880. 
playstore=# SELECT app_name FROM analytics 
playstore-# WHERE id = 1800; 
          app_name           
-----------------------------
 Learn Top 300 English Words
(1 row)

--Find the ID and app name for all apps that were last updated on August 01, 2018.
playstore=# SELECT id, app_name FROM analytics        
WHERE last_updated = '2018-08-01';
  id  |                                     app_name                                      
------+-----------------------------------------------------------------------------------
   10 | Clash Royale
   11 | Candy Crush Saga
   12 | UC Browser - Fast Download Private & Secure
   74 | Score! Hero
  101 | Tiny Flashlight + LED
  102 | Crossy Road
  103 | SimCity BuildIt
  111 | FIFA Soccer
  112 | Angry Birds 2
  125 | Need for Speed™ No Limits
  126 | YouCam Makeup - Magic Selfie Makeovers
  152 | Fallout Shelter
  159 | DU Recorder – Screen Recorder, Video Editor, Live
  160 | Bike Race Free - Top Motorcycle Racing Games
  161 | KakaoTalk: Free Calls & Text
  162 | Dolphin Browser - Fast, Private & Adblock🐬
  163 | Opera Browser: Fast and Secure
  164 | MARVEL Contest of Champions
  184 | Video Editor Music,Cut,No Crop
  226 | Frozen Free Fall
  260 | Chess Free
  276 | ► MultiCraft ― Free Miner! 👍
  277 | Vlogger Go Viral - Tuber Game
  300 | Bad Piggies
  301 | Skater Boy
  356 | S Photo Editor - Collage Maker , Photo Collage
  357 | Magisto Video Editor & Maker
  358 | Itau bank
  359 | DEER HUNTER 2018
  360 | Mobizen Screen Recorder for SAMSUNG
  362 | Bike Racing 3D
  425 | Bomber Friends
  426 | Lep’s World 3 🍀🍀🍀
  431 | MakeupPlus - Your Own Virtual Makeup Artist
  436 | Photo Collage Maker
  465 | ivi - movies and TV shows in HD
  466 | Calculator Plus Free
  467 | Indeed Job Search
  507 | MakeMyTrip-Flight Hotel Bus Cab IRCTC Rail Booking
  569 | Waplog - Free Chat, Dating App, Meet Singles
  570 | ESPN
  580 | Galaxy Attack: Alien Shooter
  620 | HD Camera Ultra
:

--Count the number of apps in each category, e.g. “Family | 1972”.
playstore=# SELECT category COUNT(*) FROM analytics
playstore-# GROUP BY category;
ERROR:  syntax error at or near "("
LINE 1: SELECT category COUNT(*) FROM analytics
                             ^
playstore=# SELECT category, COUNT(*) FROM analytics                                                GROUP BY category;
      category       | count 
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
 MAPS_AND_NAVIGATION |   129
 LIBRARIES_AND_DEMO  |    80
 FOOD_AND_DRINK      |   110
 FAMILY              |  1789
 VIDEO_PLAYERS       |   165
 AUTO_AND_VEHICLES   |    75
(33 rows)

--  Find the top 5 most-reviewed apps and the number of reviews for each.

playstore=# SELECT * FROM analytics
playstore-# ORDER BY reviews DESC
playstore-# LIMIT = 5; 
ERROR:  syntax error at or near "="
LINE 3: LIMIT = 5;
              ^
playstore=# SELECT * FROM analytics                                                                 ORDER BY reviews DESC                                                                               LIMIT 5;
 id |                 app_name                 |   category    | rating | reviews  |        size        | min_installs | price | content_rating |     genres      | last_updated |  current_version   |  android_version   
----+------------------------------------------+---------------+--------+----------+--------------------+--------------+-------+----------------+-----------------+--------------+--------------------+--------------------
  1 | Facebook                                 | SOCIAL        |    4.1 | 78158306 | Varies with device |   1000000000 |     0 | Teen           | {Social}        | 2018-08-03   | Varies with device | Varies with device
  2 | WhatsApp Messenger                       | SOCIAL        |    4.1 | 78128208 | Varies with device |   1000000000 |     0 | Teen           | {Social}        | 2018-08-03   | Varies with device | Varies with device
  3 | Instagram                                | COMMUNICATION |    4.4 | 69119316 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
  4 | Messenger – Text and Video Chat for Free | COMMUNICATION |    4.4 | 69119316 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
  5 | Clash of Clans                           | COMMUNICATION |    4.4 | 69109672 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
(5 rows)

--Find the full record of the app that has the most reviews with a rating greater than equal to 4.8.

playstore=# SELECT * FROM analytics 
playstore-#   WHERE rating >= 4.8 
playstore-#   ORDER BY reviews DESC
playstore-#   LIMIT 1;
 id  |  app_name  |      category      | rating | reviews |        size        | min_installs | price | content_rating |        genres        | last_updated |  current_version   |  android_version   
-----+------------+--------------------+--------+---------+--------------------+--------------+-------+----------------+----------------------+--------------+--------------------+--------------------
 260 | Chess Free | HEALTH_AND_FITNESS |    4.8 | 4559407 | Varies with device |    100000000 |     0 | Everyone       | {"Health & Fitness"} | 2018-08-01   | Varies with device | Varies with device
(1 row)

-- Find the average rating for each category ordered  by the highest rated to lowest rated.

playstore=# SELECT category, AVG(rating) FROM analytics 
playstore-#   GROUP BY category 
playstore-#   ORDER BY avg DESC;
      category       |        avg         
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
 TRAVEL_AND_LOCAL    |   4.10179372753263
 LIFESTYLE           |  4.077076400237226
 VIDEO_PLAYERS       |  4.059748438919115
 MAPS_AND_NAVIGATION |  4.058196711735647
 TOOLS               |  4.050627608678331
 DATING              |  3.993684190825412
(33 rows)

-- Find the name, price, and rating of the most expensive app with a rating that's less than 3

playstore=# SELECT app_name, price, rating FROM analytics 
playstore-#   WHERE rating < 3 
playstore-#   ORDER BY price DESC 
playstore-#   LIMIT 1;
      app_name      | price  | rating 
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)

--Find all records with a min install not exceeding 50, that have a rating.  Order your results by highest rated first.

playstore=# SELECT * FROM analytics 
playstore-#   WHERE min_installs <= 50 
playstore-#     AND rating IS NOT NULL 
playstore-#   ORDER BY rating DESC;
  id  |                    app_name                    |      category       | rating | reviews | size | min_installs | price | content_rating |        genres         | last_updated |  current_version   | android_version 
------+------------------------------------------------+---------------------+--------+---------+------+--------------+-------+----------------+-----------------------+--------------+--------------------+-----------------
 9468 | DT                                             | FAMILY              |      5 |       4 | 52M  |           50 |     0 | Everyone       | {Education}           | 2018-04-03   | 1.1                | 4.1 and up
 9464 | DQ Akses                                       | PERSONALIZATION     |      5 |       4 | 31M  |           50 |  0.99 | Everyone       | {Personalization}     | 2018-04-27   | 1.1                | 4.1 and up
 9453 | DM Adventure                                   | MEDICAL             |      5 |       4 | 25M  |            1 |     0 | Everyone       | {Medical}             | 2018-08-02   | 1.0.72             | 4.0.3 and up
 9427 | db Meter - sound level meter with data logging | GAME                |      5 |       5 | 4.6M |           10 |     0 | Everyone       | {Racing}              | 2018-08-01   | 1.11               | 4.0.3 and up
 9452 | Otto DM                                        | MEDICAL             |      5 |       4 | 2.5M |            5 |     0 | Everyone       | {Medical}             | 2018-08-03   | 1                  | 4.1 and up
 9431 | ElejaOnline DF                                 | FAMILY              |      5 |       5 | 15M  |           50 |     0 | Everyone       | {Education}           | 2017-10-06   | 2.3.3              | 4.4 and up
 8785 | Labs on Demand                                 | BUSINESS            |      5 |      14 | 3.3M |           50 |     0 | Everyone       | {Business}            | 2018-02-01   | 1                  | 4.0 and up
 9602 | FK Events                                      | MEDICAL             |      5 |       3 | 53M  |           10 |     0 | Everyone       | {Medical}             | 2018-07-13   | 0.1                | 4.1 and up
 8926 | My CW                                          | GAME                |      5 |      11 | 6.1M |           10 |     0 | Everyone       | {Arcade}              | 2017-03-11   | 0.1                | 2.3 and up
 8629 | Dr.Dice - Sic bo analyzer                      | FAMILY              |      5 |      18 | 1.3M |           50 |     0 | Everyone       | {Casual}              | 2018-02-13   | 1                  | 4.3 and up
 9021 | BTK-FH Online Campus                           | SHOPPING            |      5 |       9 | 169k |           10 |     0 | Everyone       | {Shopping}            | 2018-06-01   | 18060104           | 2.2 and up
 9552 | EU Whoiswho                                    | HEALTH_AND_FITNESS  |      5 |       4 | 15M  |           50 |     0 | Everyone       | {"Health & Fitness"}  | 2018-03-23   | 7.7.3              | 4.1 and up
 9057 | Wifi Mingle                                    | PRODUCTIVITY        |      5 |       9 | 25M  |           50 |     0 | Everyone       | {Productivity}        | 2018-02-11   | 1.7.8              | 4.0.3 and up
:

--Find the names of all apps that are rated less than 3 with at least 10000 reviews.

playstore=# SELECT app_name FROM analytics
playstore-#   WHERE rating < 3 AND reviews >= 10000;
                    app_name                     
-------------------------------------------------
 The Wall Street Journal: Business & Market News
 Vikings: an Archer’s Journey
 Shoot Em Down Free
(3 rows)

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
playstore=# SELECT * FROM analytics
playstore-#   WHERE price BETWEEN 0.1 and 1 
playstore-#   ORDER BY reviews DESC 
playstore-#   LIMIT 10;
  id  |                  app_name                   |    category     | rating | reviews | size | min_installs | price | content_rating |            genres             | last_updated | current_version | android_version 
------+---------------------------------------------+-----------------+--------+---------+------+--------------+-------+----------------+-------------------------------+--------------+-----------------+-----------------
 1144 | Free Slideshow Maker & Video Editor         | GAME            |    4.6 |  408292 | 29M  |     10000000 |  0.99 | Mature 17+     | {Action}                      | 2018-07-12   | 1.7.110758      | 4.1 and up
 2298 | Couple - Relationship App                   | GAME            |    4.3 |   85468 | 36M  |      1000000 |  0.99 | Everyone       | {Arcade}                      | 2018-06-08   | 2.4.1.485300    | 4.0.3 and up
 2315 | Anime X Wallpaper                           | FAMILY          |    4.6 |   84114 | 23M  |       500000 |  0.99 | Everyone 10+   | {Puzzle}                      | 2018-07-05   | 1.13.108869     | 2.3.3 and up
 2603 | Dance On Mobile                             | FAMILY          |    4.6 |   61264 | 43M  |      1000000 |  0.99 | Everyone       | {Puzzle}                      | 2018-06-19   | 3.7.0           | 4.1 and up
 2645 | Marvel Unlimited                            | PERSONALIZATION |    4.3 |   58617 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2646 | FastMeet: Chat, Dating, Love                | PERSONALIZATION |    4.3 |   58614 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
 2811 | IHG®: Hotel Deals & Rewards                 | FAMILY          |    4.5 |   48754 | 9.3M |       100000 |  0.99 | Everyone       | {Arcade,"Action & Adventure"} | 2014-10-07   | 1.5.2           | 2.3 and up
 3050 | Live Weather & Daily Local Weather Forecast | GAME            |    4.4 |   38419 | 100M |      1000000 |  0.99 | Everyone 10+   | {Action}                      | 2018-08-03   | 2.3.24          | 4.1 and up
 3214 | DreamMapper                                 | GAME            |    4.4 |   32496 | 99M  |      1000000 |  0.99 | Teen           | {Action}                      | 2018-07-03   | 5.3.3           | 2.3 and up
 3227 | Můj T-Mobile Business                       | GAME            |    4.5 |   32344 | 29M  |      1000000 |  0.99 | Everyone       | {Adventure}                   | 2016-10-21   | 1.3.12          | 3.0 and up
(10 rows)

--Find the most out of date app. 
playstore=# SELECT * FROM analytics 
playstore-# ORDER BY last-updated
playstore-# LIMIT 1;
ERROR:  column "last" does not exist
LINE 2: ORDER BY last-updated
                 ^
playstore=# SELECT * FROM analytics                                                                 
playstore-# ORDER BY last_updated
playstore-# LIMIT 1; 
  id  |  app_name  | category | rating | reviews | size | min_installs | price | content_rating |     genres      | last_updated | current_version | android_version 
------+------------+----------+--------+---------+------+--------------+-------+----------------+-----------------+--------------+-----------------+-----------------
 5701 | CP Clicker | FAMILY   |    4.2 |    1415 | 209k |       100000 |     0 | Everyone       | {Entertainment} | 2010-05-21   | 3.1             | 1.5 and up
(1 row)

-- Find the most expensive app 
playstore=# SELECT * FROM analytics
playstore-# ORDER BY price DESC
playstore-# LIMIT 1; 

  id  |      app_name      | category  | rating | reviews | size | min_installs | price | content_rating |   genres    | last_updated | current_version | android_version 
------+--------------------+-----------+--------+---------+------+--------------+-------+----------------+-------------+--------------+-----------------+-----------------
 6766 | Cardi B Piano Game | LIFESTYLE |    3.6 |     275 | 7.3M |        10000 |   400 | Everyone       | {Lifestyle} | 2018-05-03   | 1.0.1           | 4.1 and up
(1 row)

--Count all the reviews in the Google Play Store.

playstore=# SELECT SUM(reviews) AS 'Number of Reviews' FROM analytics;
ERROR:  syntax error at or near "'Number of Reviews'"
LINE 1: SELECT SUM(reviews) AS 'Number of Reviews' FROM analytics;
playstore=# SELECT SUM(reviews) AS "Number of Reviews" FROM analytics;
 Number of Reviews 
-------------------
        4814575866
(1 row)

--Find all the categories that have more than 300 apps in them.
playstore=# SELECT category FROM analytics
playstore-# HAVING COUNT(*) > 300; 
ERROR:  column "analytics.category" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: SELECT category FROM analytics
               ^
playstore=# SELECT category FROM analytics                                                          GROUP BY category HAVING COUNT(*) > 300;
    category     
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)


--Find the app that has the highest proportion of reviews to min_installs, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.


