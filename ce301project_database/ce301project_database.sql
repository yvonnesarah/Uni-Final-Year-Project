DROP DATABASE IF EXISTS ya17580_ce301_project;
CREATE DATABASE ya17580_ce301_project;
USE ya17580_ce301_project;

CREATE TABLE age_groups (
  age_groups VARCHAR (30),
  PRIMARY KEY(age_groups)
);
INSERT INTO age_groups VALUES ("Baby");
INSERT INTO age_groups VALUES ("1 years");
INSERT INTO age_groups VALUES ("2-3 years");
INSERT INTO age_groups VALUES ("4-5 years");
INSERT INTO age_groups VALUES ("6-11 years");
INSERT INTO age_groups VALUES ("12-14 years");
INSERT INTO age_groups VALUES ("15-18 years");

CREATE TABLE categories(
 categories_name VARCHAR(100),
 PRIMARY KEY(categories_name)
);
INSERT INTO categories VALUES ("Clothing");
INSERT INTO categories VALUES ("Books");
INSERT INTO categories VALUES ("Toys");
INSERT INTO categories VALUES ("Travel and Feeding");
INSERT INTO categories VALUES ("Arts and Crafts");
INSERT INTO categories VALUES ("Film DVDs");
INSERT INTO categories VALUES ("Games");


CREATE TABLE product_groups_code(
 group_code INT NOT NULL,
 PRIMARY KEY(group_code)
);
INSERT INTO product_groups_code VALUES (1000);
INSERT INTO product_groups_code VALUES (1001);
INSERT INTO product_groups_code VALUES (1002);
INSERT INTO product_groups_code VALUES (1003);


INSERT INTO product_groups_code VALUES (2000);
INSERT INTO product_groups_code VALUES (2001);
INSERT INTO product_groups_code VALUES (2002);
INSERT INTO product_groups_code VALUES (2003);

INSERT INTO product_groups_code VALUES (3000);
INSERT INTO product_groups_code VALUES (3001);
INSERT INTO product_groups_code VALUES (3002);
INSERT INTO product_groups_code VALUES (3003);
INSERT INTO product_groups_code VALUES (3004);

INSERT INTO product_groups_code VALUES (4000);
INSERT INTO product_groups_code VALUES (4001);
INSERT INTO product_groups_code VALUES (4002);
INSERT INTO product_groups_code VALUES (4003);
INSERT INTO product_groups_code VALUES (4004);

INSERT INTO product_groups_code VALUES (5000);
INSERT INTO product_groups_code VALUES (5001);
INSERT INTO product_groups_code VALUES (5002);
INSERT INTO product_groups_code VALUES (5003);
INSERT INTO product_groups_code VALUES (5004);

INSERT INTO product_groups_code VALUES (6000);
INSERT INTO product_groups_code VALUES (6001);
INSERT INTO product_groups_code VALUES (6002);
INSERT INTO product_groups_code VALUES (6003);

INSERT INTO product_groups_code VALUES (7000);
INSERT INTO product_groups_code VALUES (7001);
INSERT INTO product_groups_code VALUES (7002);
INSERT INTO product_groups_code VALUES (7003);


CREATE TABLE product_groups (
  group_code INT,
  categories_name VARCHAR(100),
  age_groups VARCHAR (30),
  FOREIGN KEY(group_code) REFERENCES product_groups_code(group_code),
  FOREIGN KEY(categories_name) REFERENCES categories(categories_name),
  FOREIGN KEY(age_groups) REFERENCES age_groups(age_groups)
);
INSERT INTO product_groups VALUES (1000,"Clothing","Baby");
INSERT INTO product_groups VALUES (1001,"Books","Baby");
INSERT INTO product_groups VALUES (1002,"Toys","Baby");
INSERT INTO product_groups VALUES (1003,"Travel and Feeding","Baby");

INSERT INTO product_groups VALUES (2000,"Clothing","1 years");
INSERT INTO product_groups VALUES (2001,"Books", "1 years");
INSERT INTO product_groups VALUES (2002,"Toys", "1 years");
INSERT INTO product_groups VALUES (2003,"Arts and Crafts", "1 years");

INSERT INTO product_groups VALUES (3000,"Clothing","2-3 years");
INSERT INTO product_groups VALUES (3001,"Books", "2-3 years");
INSERT INTO product_groups VALUES (3002,"Toys", "2-3 years");
INSERT INTO product_groups VALUES (3003,"Film DVDs", "2-3 years");
INSERT INTO product_groups VALUES (3004,"Arts and Crafts", "2-3 years");

INSERT INTO product_groups VALUES (4000,"Clothing", "4-5 years");
INSERT INTO product_groups VALUES (4001,"Books", "4-5 years");
INSERT INTO product_groups VALUES (4002,"Toys", "4-5 years");
INSERT INTO product_groups VALUES (4003,"Arts and Crafts", "4-5 years");
INSERT INTO product_groups VALUES (4004,"Film DVDs", "4-5 years");

INSERT INTO product_groups VALUES (5000,"Clothing", "6-11 years");
INSERT INTO product_groups VALUES (5001,"Books", "6-11 years");
INSERT INTO product_groups VALUES (5002,"Toys", "6-11 years");
INSERT INTO product_groups VALUES (5003,"Film DVDs", "6-11 years");
INSERT INTO product_groups VALUES (5004,"Games", "6-11 years");

INSERT INTO product_groups VALUES (6000,"Clothing", "12-14 years");
INSERT INTO product_groups VALUES (6001,"Books", "12-14 years");
INSERT INTO product_groups VALUES (6002,"Film DVDs", "12-14 years");
INSERT INTO product_groups VALUES (6003,"Games", "12-14 years");

INSERT INTO product_groups VALUES (7000,"Clothing", "15-18 years");
INSERT INTO product_groups VALUES (7001,"Books", "15-18 years");
INSERT INTO product_groups VALUES (7002,"Film DVDs", "15-18 years");
INSERT INTO product_groups VALUES (7003,"Games", "15-18 years");

CREATE TABLE customers (
  customer_id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(50),
  email_address VARCHAR(50) NOT NULL,
  address VARCHAR(60),
  city VARCHAR(30),
  country VARCHAR(30),
  postcode VARCHAR(8),
  password VARCHAR(128),
  PRIMARY KEY(customer_id)
);

CREATE TABLE admin (
  admin_id INT(100) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(50),
  email_address VARCHAR(100) NOT NULL,
  password VARCHAR(200) NOT NULL,
  PRIMARY KEY(admin_id)
);

CREATE TABLE products(
  product_id CHAR(11) NOT NULL,
  product_name VARCHAR(300),
  group_code INT,
  categories_name VARCHAR(100),
  age_groups VARCHAR (30),
  product_description VARCHAR(300),
  product_author VARCHAR (60),
  product_image VARCHAR(140), 
  product_price DECIMAL(10,2),   
  PRIMARY KEY(product_id,product_price),
  FOREIGN KEY(categories_name) REFERENCES product_groups(categories_name),
  FOREIGN KEY(group_code) REFERENCES product_groups(group_code) ON DELETE SET NULL,
  FOREIGN KEY(age_groups) REFERENCES product_groups(age_groups) ON DELETE SET NULL
  );
  
INSERT INTO products VALUES ("CLG10-011","Girls Dungaree Dress & Top Set",1000,"Clothing","Baby","Create a sweet everyday outfit for your little lady with this dungaree dress set. In ochre, it's made from our soft and stretchy sweater knit fabric and comes with bow detailing to the straps, plus a long-sleeved top to layer underneath.", "Matalan","CLG10-011.jpg",10.00);
INSERT INTO products VALUES ("CLG10-012","Girls Bow Top & Leggings Set",1000,"Clothing","Baby","Kit your little one out for cooler days in this sweet two-piece set. It includes a long-sleeved pink top and matching pair of leggings, each made from a soft and stretchy blend to keep her feeling comfy. Bows to the top and leggings give this set an added dose of cuteness.", "Matalan","CLG10-012.jpg",9.00);
INSERT INTO products VALUES ("CLG10-013","Girls Tunic Dress & Leggings Set",1000,"Clothing","Baby","Baby's first outfit pairings are a doddle with this pretty two-piece set. It includes a long-sleeved pink tunic with a frill collar and all-over spot print, accompanied by a matching pair of leggings with a sweet frill detail to the back.", "Matalan","CLG10-013.jpg",6.00);
INSERT INTO products VALUES ("CLG10-014","Girls 101 Dalmatians Outfit Set",1000,"Clothing","Baby","Dressing your little dalmatian just got easy with this sweet three piece outfit set. Made from comfy grey cotton jersey, the trio includes a pair of leggings, long sleeved top and headband, all printed with designs inspired by the beloved 101 Dalmatians.", "Matalan","CLG10-014.jpg",15.00);
INSERT INTO products VALUES ("CLG10-015","Boys Dungaree & Top Set",1000,"Clothing","Baby","Kit your little lad out for all his first adventures in this sweet 2-piece set. It includes a pair of soft blue cotton dungarees, accompanied by a matching long-sleeved top to layer underneath.", "Matalan","CLG10-015.jpg",10.00);
INSERT INTO products VALUES ("CLG10-016","Boys Check Velvet Check Dungarees & T-Shirt Set",1000,"Clothing","Baby","Make outfit building easy-peasy with this adorable duo. Crafted from sumptuously soft velveteen fabric, the blue check dungarees are trimmed with buttons for a classic finish. A beige short sleeve t-shirt is also included to be layered beneath.", "Matalan","CLG10-016.jpg",6.00);
INSERT INTO products VALUES ("CLG10-017","Boys Dungarees & Farm T-Shirt Set",1000,"Clothing","Baby","Make outfit building a doddle with this adorable duo. Crafted from double cloth cotton for maximum comfort, the blue dungarees are cut with long legs and feature classic single pocket detailing. A colourful farm printed t-shirt is also included to be layered beneath.", "Matalan","CLG10-017.jpg",10.00);
INSERT INTO products VALUES ("CLG10-018","Boys Top & Bottoms Set",1000,"Clothing","Baby","Create a cute all-in-one outfit for baby with this two-piece set. It includes a long-sleeved top with a button collar and a matching pair of joggers, each made in a soft and stretchy fabric to keep him feeling comfy and cosy.", "Matalan","CLG10-018.jpg",9.00);
INSERT INTO products VALUES ("CLG10-019","Girls 3 Pack Mouse Baby Grows",1000,"Clothing","Baby","Made for comfy and cosy slumbers, these pink sleepsuits are a cute and practical addition to baby's first wardrobe. Each comes with handy popper fastenings for easy changing, and built-in scratch mitts", "Matalan","CLG10-019.jpg",12.00);
INSERT INTO products VALUES ("CLG10-020","Girls 3 Pack Panda Baby Grows",1000,"Clothing","Baby","The pack includes an array of designs, including an all-over heart star print and a super-sweet panda motif. ", "Matalan","CLG10-020.jpg",12.00);
INSERT INTO products VALUES ("CLG10-021","Girls 5 Pack Short Sleeve Bodysuits",1000,"Clothing","Baby","Stock up on baby's everyday essentials with this adorable 5 pack. Crafted from 100% cotton with delicate skin in mind, the bodysuits feature pretty pink and white designs. Practical functions include lapped shoulder and popper fastenings for ease of changing.", "Matalan","CLG10-021.jpg",6.50);
INSERT INTO products VALUES ("CLG10-022","Boys Dinosaur Zip Up Baby Grow",1000,"Clothing","Baby","Dress your little one for cosy slumbers in this navy sleepsuit. Made from soft 100% cotton, it comes with an all-over dino print together with a practical front zip fastening for easy changing.", "Matalan","CLG10-022.jpg",6.00);
INSERT INTO products VALUES ("CLG10-023","Boys 2 Pack Star Baby Grows",1000,"Clothing","Baby","These cosy sleepsuits make a super-cute addition to baby's first wardrobe. In blue and white, the pack includes one stripy suit and one with an all-over star print, each made from 100% cotton with practical popper fastenings for easy changing.", "Matalan","CLG10-023.jpg",7.00);
INSERT INTO products VALUES ("CLG10-024","Boys 2 Pack Cars Baby Grows",1000,"Clothing","Baby","Stock up on baby's everyday essentials with this cute duo. Crafted from soft cotton with delicate skin in mind, the blue and white baby grows feature a combination of car and stripe designs.", "Matalan","CLG10-024.jpg",6.00);
INSERT INTO products VALUES ("CLG10-025","Girls Cuddles Slogan T-Shirt",1000,"Clothing","Baby","Crafted from soft cotton, the pink t-shirt is cut with cosy long sleeves trimmed with frill shoulder detailing and features a handy button fastening to one side. The design is finished with a sweet slogan graphic to the front captioned 'I Love Cuddles'.", "Matalan","CLG10-025.jpg",2.50);
INSERT INTO products VALUES ("CLG10-026","Girls Rainbow Long Sleeve T-Shirt",1000,"Clothing","Baby","Crafted from soft grey jersey fabric, the design is cut with long sleeves trimmed with elasticated cuffs and button fastenings on one shoulder. A vibrant rainbow graphic adds a pop of bold colour.", "Matalan","CLG10-026.jpg",3.00);
INSERT INTO products VALUES ("CLG10-027","Girls 2 Pack Long Sleeve T-Shirts",1000,"Clothing","Baby","Made from soft cotton in red and white, each comes with long sleeves and a frill collar with contrast stitch detailing for a pretty finishing touch.", "Matalan","CLG10-027.jpg",3.50);
INSERT INTO products VALUES ("CLG10-028","Boys 3 Pack Long Sleeve Dinosaur T-Shirts",1000,"Clothing","Baby","Time to stock up on essentials! These super-cute T-shirts come in a handy pack of three, with cute slogans and prints that are perfect for baby's everyday wardrobe.", "Matalan","CLG10-028.jpg",7.00);
INSERT INTO products VALUES ("CLG10-029","Boys 3 Pack Panda Stripe T-Shirts",1000,"Clothing","Baby","It includes three fun designs, including panda prints and stripes, each with short sleeves and button fastenings to the neck for easy changing.", "Matalan","CLG10-029.jpg",3.00);

INSERT INTO products VALUES ("BKS11-011","Cuddly Bear Board Book",1001,"Books","Baby","Use the snuggly puppet arms to bring the story to life, as Cuddly Bear waves, claps and hugs in this interactive book full of fun.", "Igloo Books Ltd","BKS11-011.jpg",4.00);
INSERT INTO products VALUES ("BKS11-012","Incy Wincy Spider",1001,"Books","Baby","Join Incy Wincy Spider for a day of creepy-crawly fun in this bright, interactive hand-puppet book.", "Igloo Books Ltd","BKS11-012.jpg",5.00);
INSERT INTO products VALUES ("BKS11-013","One Rainy Day",1001,"Books","Baby","Little Hedgehog is delighted when he wakes up to find it is raining. At last he can try out his lovely new raincoat, hat and boots, and his wonderful sparkly umbrella.", "M. Christina Butler","BKS11-013.jpg",2.00);
INSERT INTO products VALUES ("BKS11-014","Squeak-A-Boo Baby!",1001,"Books","Baby","Lift the flaps and squeak with this adorable Squeak-A-Boo Baby Book!", "iSeek Ltd","BKS11-014.jpg",4.00);
INSERT INTO products VALUES ("BKS11-015","DK A First Book of Fairy Tales",1001,"Books","Baby","Dive into this beautiful collection of fourteen classic fairy tales. Paired with stunning illustrations and a dusting of magic", "Mary Hoffman","BKS11-015.jpg",6.00);
INSERT INTO products VALUES ("BKS11-016","My First JCB: Mega Diggers",1001,"Books","Baby","Complete with a fold-out track and your own wind-up Dan Dozer, this book is guaranteed to provide you with plenty of digger fun.", "Bonnier Books","BKS11-016.jpg",6.00);
INSERT INTO products VALUES ("BKS11-017","Too Clumsy to Climb",1001,"Books","Baby","Will Little Monkey learn from his friends and be able to join his family in the treetops, or is he simply too clumsy to climb?", "Hinkler Books","BKS11-017.jpg",3.00);
INSERT INTO products VALUES ("BKS11-018","Sam Who Went to Sea",1001,"Books","Baby","His neighbours tell him to think of practical matters like fixing his fence and getting his garden in order.", "Phyllis Root","BKS11-018.jpg",6.00);

INSERT INTO products VALUES ("TYS12-011","Pile & Play Cups",1002,"Toys","Baby","Simple toys are very often the most popular, which is why these colourful cups  make a great addition to your child's toy box. Whether they stack, nest, count, hide things underneath or pour water out of them at bathtime, you can guarantee they'll have endless fun.", "Lamaze","TYS12-011.jpg",4.00);
INSERT INTO products VALUES ("TYS12-012","Hide & Squeak Eggs",1002,"Toys","Baby","Cheep Cheep! Let's play hide and squeak! See if your little one can match the egg shapes to the carton. The eggs have lots of silly faces that are sure to delight little ones, and chicks will give a little squeak when you push the eggs down for added entertainment.", "Tomy","TYS12-012.jpg",10.00);
INSERT INTO products VALUES ("TYS12-013","Tap and Twist Bench",1002,"Toys","Baby","The double sided toy bench has colourful shapes for your little builder to grasp, twist, or tap with the easy-grasp play hammer.", "Fisher-Price","TYS12-013.jpg",10.00);
INSERT INTO products VALUES ("TYS12-014","Rotating Music Box",1002,"Toys","Baby","The colourful rotating shapes will engage little ones, while soothing and gentle sounds keep them entertained.", "Hape","TYS12-014.jpg",17.00);
INSERT INTO products VALUES ("TYS12-015","Glow & Discover Light Bar™ Activity Station",1002,"Toys","Baby","Great minds start little. Colours, animals, lights and melodies are right at baby's fingertips during tummy time or sitting play!", "Baby Einstein","TYS12-015.jpg",20.00);
INSERT INTO products VALUES ("TYS12-016","Mini Moon Rattle",1002,"Toys","Baby","Delight your little one with this beautifully designed Mini Moon Rattle, designed to encourage hand-eye co-ordination.", "Taf Toys","TYS12-016.jpg",6.00);
INSERT INTO products VALUES ("TYS12-017","Rock-a-Stack Stackable Rings",1002,"Toys","Baby","Tailor made for little hands. The littlest ring has a shiny, reflective surface for babies to discover, plus swirling beads that make fun rattle sounds!", "Fisher-Price","TYS12-017.jpg",10.00);
INSERT INTO products VALUES ("TYS12-018","Fun Gadget Set",1002,"Toys","Baby","This set is great for building your child's imagination and letting them express themselves through playing.", "Chad Valley","TYS12-018.jpg",9.00);

INSERT INTO products VALUES ("TFG13-011","Baby Bottles Microwave Steriliser",1003,"Travel and Feeding","Baby","Having sterilised bottles ready for every feed is an essential part of caring for your baby. The Tommee Tippee Microwave Steriliser gives you a quick, easy and portable way to protect your baby's tummy from harmful bacteria.", "Tommee Tippee","TFG13-011.jpg",33.00);
INSERT INTO products VALUES ("TFG13-012","6 x 260ml Decorated Bottles",1003,"Travel and Feeding","Baby","In fact, our Closer to Nature baby bottle has guaranteed acceptance and an anti-colic valve making it the best thing for baby since you are making feeding easier for everyone.", "Tommee Tippee","TFG13-012.jpg",8.50);
INSERT INTO products VALUES ("TFG13-013","Complete Feeding Set - White",1003,"Travel and Feeding","Baby","The Tommee Tippee Closer to Nature Complete Feeding Set contains everything you need to make baby feeding simple at home or on the go.", "Tommee Tippee","TFG13-013.jpg",75.00);
INSERT INTO products VALUES ("TFG13-014","Breastfeeding Starter Kit",1003,"Travel and Feeding","Baby","The Medela Breastfeeding Starter Kit contains a range of products to get you off to a right start on your breastfeeding journey – whether you are breastfeeding exclusively or pumping milk alongside breastfeeding. It is an easy solution for collecting, storing and feeding breast milk.", "Medela","TFG13-014.jpg",12.50);
INSERT INTO products VALUES ("TFG13-015","Closer to Nature Perfect Prep Filters",1003,"Travel and Feeding","Baby","Your Perfect Prep machine is designed for use with water straight from the tap so there is no need to pre-boil the water using a kettle or use bottled water to prepare baby's feed.", "Tommee Tippee","TFG13-015.jpg",12.00);
INSERT INTO products VALUES ("TFG13-016","Mini-Blend Baby Food Blender",1003,"Travel and Feeding","Baby","Whizz up fabulous fresh food for your little one with this handy compact mini baby food blender. Perfect for small portions, it's easy to blend fruit, vegetables, meat and fish for a variety of healthy and nutritious meals.", "Tommee Tippee","TFG13-016.jpg",25.00);
INSERT INTO products VALUES ("TFG13-017","Perfect Prep Day & Night - Black", 1003,"Travel and Feeding","Baby","Perfect Prep Day & Night from Tommee Tippee is a dream machine to help you do just that. Not only does it prep the perfect bottle in two minutes, it's also sleep friendly with added features specifically designed to make night feeding so much easier.", "Tommee Tippee","TFG13-017.jpg",130.00);
INSERT INTO products VALUES ("TFG13-018","Insulated Bottle Bags",1003,"Travel and Feeding","Baby","Our Insulated Bottle Carriers are lightweight, compact and convenient, perfect for feeding when you're on the go. They make individual feeds on the go so much easier. Store sealed water in a flask and just add formula powder at feed time.", "Tommee Tippee","TFG13-018.jpg",12.00);
INSERT INTO products VALUES ("TFG13-019","Thermo Express Bottle Warmer",1003,"Travel and Feeding","Baby", "The NUK Thermo Express Bottle Warmer warms baby food quickly and gently with steam in just 90 Seconds, ensuring all important nutrients and vitamins retained, removing worry about whether your baby's milk is at the correct temperature.", "Nuk","TFG13-019.jpg",20.00);
INSERT INTO products VALUES ("TFG13-020","Easi-Warm Bottle & Food Warmer",1003,"Travel and Feeding","Baby","Warming baby's feeds to body temperature before feeding helps create a more natural experience for parents and babies. It's gentler on your baby's tummy too. With the Tommee Tippee Food and Bottle Warmer you can quickly and gently warm breast milk, formula and a range of baby food.", "Tommee Tippee","TFG13-020.jpg",28.00);
INSERT INTO products VALUES ("TFG13-021","Polly Magic Relax Highchair - Graphite",1003,"Travel and Feeding","Baby","The Polly Magic Relax is the multi-functional solution with an elegant design, suitable from birth as a recliner and from 6 months as a first highchair. Whilst in recline the cocooning and snug seat with seasonal reducer and toy bar with fabric pendants simultaneously cuddle and entertain your baby.", "Chicco","TFG13-021.jpg",144.00);
INSERT INTO products VALUES ("TFG13-022","Fox High Chair",1003,"Travel and Feeding","Baby", "Grow with me, 3-in-1, convertible high chair. It transforms into a chair booster and toddler chair. Features a dishwasher safe silicone meal mat and removable food tray. Food tray and seat back are adjustable to ideal positioner from tiny to toddler.", "Infantino","TFG13-022.jpg",110.00);
INSERT INTO products VALUES ("TFG13-023","Baby Car Seat - Black", 1003,"Travel and Feeding","Baby","The Joie Juva Classic Group 0+ Car Seat is suitable for children from 12-15 months old (up to 13kg). Ideal to be used rear facing, its side impact protection provides wrap-around coverage to protect your baby's head and body.", "Joie Juva Classic Group 0+","TFG13-023.jpg",40.00);
INSERT INTO products VALUES ("TFG13-024","Baby Car Seat - Black",1003,"Travel and Feeding","Baby", "Give your baby a safe and comfortable place to travel and sleep with the Cuggl Dove Car Seat. This baby car seat has a 3-point harness system to keep them safe and a head hugger with soft fabric to help keep their head from moving around too much during a car journey.", "Cuggl Dove Group 0+","TFG13-024.jpg",30.00);
INSERT INTO products VALUES ("TFG13-025","Baby Car Seat - Pure Black",1003,"Travel and Feeding","Baby", "The Cybex Aton offers safety, design and functionality, the ultra light and spacious infant car seat is perfect for parents on the go. The energy-absorbing shell absorbs the forces of an impact.", "Cybex Aton Group 0+","TFG13-025.jpg",100.00);
INSERT INTO products VALUES ("TFG13-026","Moon 3-in-1 Travel System",1003,"Travel and Feeding","Baby","Suitable from birth to toddler, this multifunctional travel system adapts as your child grows from carrycot to pushchair and includes a choice of car seats suitable from birth to suit your vehicle and lifestyle. With its all-round suspension and lockable front wheel function.", "Ickle Bubba","TFG13-026.jpg",120.00);
INSERT INTO products VALUES ("TFG13-027","Acacia DLX Travel System - Navy",1003,"Travel and Feeding","Baby","High cost-effective travel system; removable bumper bar; adjustable handle height; adjustable foot rest; quick install & detach wheels, swivel & lockable front wheels, suspension wheels", "Cuggl","TFG13-027.jpg",132.00);
INSERT INTO products VALUES ("TFG13-028","Travel System",1003,"Travel and Feeding","Baby","A simple system for easy-breezy travel, ready to face the day with you, lightweight and carefree. The Juva travel system is packed with thoughtful details including the ShoeSaver scuff free brake system, SoftTouch harness, and shop till you drop basket.", "Joie Juva","TFG13-028.jpg",100.00);
INSERT INTO products VALUES ("TFG13-029","Grey Travel Cot",1003,"Travel and Feeding","Baby","This travel cot from Cuggl offers the ideal sleeping solution for your baby when you're away from home or staying with relatives. The travel cot folds compactly into a carry bag for travel and storage, making it easy to take with you on the go.", "Cuggl","TFG13-029.jpg",30.00);
INSERT INTO products VALUES ("TFG13-030","Travel Cot with Bassinet",1003,"Travel and Feeding","Baby","Meet allura. A convenient tag-along designed and engineered for secure sleep and play. Everything you need for effortless travel including a compact fold and convenient carry bag.", "Joie Allura","TFG13-030.jpg",60.00);
INSERT INTO products VALUES ("TFG13-031","Sleep Compact Travel Cot",1003,"Travel and Feeding","Baby","This Joie Travel Cot has a drop down side so you can enjoy co-sleeping with your little ones. It's quick and easy to pop up and has an extra secure double safety latch system so you'll be assured they will stay safe at night, or during nap time.", "Joie Kubbie","TFG13-031.jpg",100.00);
INSERT INTO products VALUES ("TFG13-032","Deluxe Travel Cot and Changer Unit",1003,"Travel and Feeding","Baby","This set is the perfect all-rounder for parents on the move. The deluxe travel cot is great to set your baby down wherever you are and then when they need to be changed you can attach the removable changer and bassinet to the top at the perfect height.", "Cuggl","TFG13-032.jpg",60.00);
INSERT INTO products VALUES ("TFG13-033","Baby Elegance Foldable Bedside Sleeper - Grey",1003,"Travel and Feeding","Baby","The Kangu crib is designed to fold in one simple action and be moved from room to room. And when it's time to set up in your new location it simply pops back into place as easily as it folded.", "Kangu","TFG13-033.jpg",90.00);
INSERT INTO products VALUES ("TFG13-034","Travel Cot - Black", 1003,"Travel and Feeding","Baby","The BabyDan travel cot is a full size, spacious cot measuring 60 x 120cm . The cot comes complete with a padded mattress and travel bag so it can easily be transported. The travel cot features a large storage pouch and clear sides so it can be used as a play pen.", "BabyDan","TFG13-034.jpg",70.00);

INSERT INTO products VALUES ("CLG20-011","All In One",2000,"Clothing","1 years","Striped cotton/viscose popeline short overalls, waist flounce, pompoms tape, snap fastener at straps, waist and crotch, ananas patch.", "Billiblush","CLG20-011.jpg",22.50);
INSERT INTO products VALUES ("CLG20-012","Shooting Star T-Shirt",2000,"Clothing","1 years","This pink T Shirt from Billieblush features a shooting star themed graphic, using glittery effects for a magical finish. The top features a crew neck, long sleeves and a regular fitting construction.", "Billieblush","CLG20-012.jpg",9.50);
INSERT INTO products VALUES ("CLG20-013","Toddler Girl White T-shirt",2000,"Clothing","1 years","The cute, soft print on this Billieblush top lends a touch of sparkle to your little girl's look. The frilled base adds to the charm.", "Billieblush","CLG20-013.jpg",12.50);
INSERT INTO products VALUES ("CLG20-014","Logo T-Shirt",2000,"Clothing","1 years","Crafted with short sleeves and a crew neck for a classic look, it features ribbed trims for comfort.", "Billieblush","CLG20-014.jpg",14.00);
INSERT INTO products VALUES ("CLG20-015","T Shirt Girls",2000,"Clothing","1 years","This Puma Heart QT T Shirt is crafted with short sleeves and a crew neck for a classic look. It features a ribbed trim for comfort and is a lightweight construction. This t shirt is designed with a signature logo and is complete with Puma branding.", "Puma","CLG20-015.jpg",2.50);
INSERT INTO products VALUES ("CLG20-016","Velour Leg Gi93",2000,"Clothing","1 years","Complete with a metallic thread construction to the waistband, these leggings are not one to be missed.", "Benetton","CLG20-016.jpg",14.00);
INSERT INTO products VALUES ("CLG20-017","Button Sweatshirt",2000,"Clothing","1 years","This piece features a popper button design to the sides for a stylish look. Complete with Benetton branding, this sweatshirt is not one to be missed.", "Benetton","CLG20-017.jpg",12.00);
INSERT INTO products VALUES ("CLG20-018","Junior Girls Jersey Shirt", 2000,"Clothing","1 years","A blouse type of shirt fashioned with short sleeves, frilly detailing and a back of the neck button closure.", "Benetton","CLG20-018.jpg",10.00);
INSERT INTO products VALUES ("CLG20-019","Cord Trousers", 2000,"Clothing","1 years","Crafted with a bonded waistband, belt loops and a 4 pockets design, this pair feature a zip fly closure.", "Benetton","CLG20-019.jpg",15.00);
INSERT INTO products VALUES ("CLG20-020","Cat T-Shirt", 2000,"Clothing","1 years","A printed iconic design of the big cat presented on the front of the T Shirt, this is a must have.", "Puma","CLG20-020.jpg",6.00);
INSERT INTO products VALUES ("CLG20-021","No1 Logo Shorts",2000,"Clothing","1 years","Crafted with an elasticated waist and drawstring for adjustment, these shorts are a 3 pockets style.", "Hackett","CLG20-021.jpg",28.00);
INSERT INTO products VALUES ("CLG20-022","Boys Topped Sweater",2000,"Clothing","1 years","This boy's sweater has an embossed Hackett logo on the front of the shirt to boldly stand out from the crowd.", "Hackett","CLG20-022.jpg",42.00);
INSERT INTO products VALUES ("CLG20-023","Crew Jogger Tracksuit Infant Boys",2000,"Clothing","1 years","Both have a soft fleece lining for a comfortable fit and Puma branding for a stylish finish.", "Puma","CLG20-023.jpg",20.00);
INSERT INTO products VALUES ("CLG20-024","Checked Shirt",2000,"Clothing","1 years","It features long sleeves and a chest pocket for a classic look. This shirt is a checked design and is complete with Benetton branding.", "Benetton","CLG20-024.jpg",10.00);
INSERT INTO products VALUES ("CLG20-025","Boys Short Sleeved Shark T-Shirt",2000,"Clothing","1 years","This comes with a deadly shark image on the front and is crafted entirely from cotton for a comfortable fit.", "Hackett","CLG20-025.jpg",18.00);
INSERT INTO products VALUES ("CLG20-026","Dino Football T-Shirt Junior Boys",2000,"Clothing","1 years","Crafted with short sleeves and a crew neck, this lightweight tee is perfect for everyday wear. Design is complete with a ribbed neck and dinosaur print.", "Joules","CLG20-026.jpg",10.00);

INSERT INTO products VALUES ("BKS21-011","Goodnight Moon",2001,"Books","1 years","In a great green room, tucked away in bed, is a little bunny.Goodnight room, goodnight moon", "Margaret Wise Brown","BKS21-011.jpg",7.00);
INSERT INTO products VALUES ("BKS21-012","Hop on Pop",2001,"Books","1 years","House, Mouse! Hop, Pop! Cup, Pup! Learning about words that rhyme has never been more fun - simply change the first letter and the whole word changes!", "Dr. Seuss ","BKS21-012.jpg",5.94);
INSERT INTO products VALUES ("BKS21-013","Ten Little Fingers and Ten Little Toes",2001,"Books","1 years","Nothing is sweeter, as everyone knows, than tiny baby fingers and chubby baby toes!", "Mem Fox","BKS21-013.jpg",8.00);
INSERT INTO products VALUES ("BKS21-014","The Very Hungry Caterpillar",2001,"Books","1 years","One sunny Sunday, the caterpillar was hatched out of a tiny egg. He was very hungry.", "Eric Carle","BKS21-014.jpg",8.00);
INSERT INTO products VALUES ("BKS21-015","Guess How Much I Love You",2001,"Books","1 years","Guess how much I love you, says Little Nutbrown Hare. Little Nutbrown Hare shows his daddy how much he loves him: as wide as he can reach and as far as he can hop.", "Sam McBratney","BKS21-015.jpg",20.00);
INSERT INTO products VALUES ("BKS21-016","Dear Zoo",2001,"Books","1 years","Dear Zoo is a must for every child's bookshelf - and the thick card pages, chunky cased cover and sturdy flaps make it perfect for small hands.", "Rod Campbell","BKS21-016.jpg",4.00);
INSERT INTO products VALUES ("BKS21-017","Where the Wild Things Are",2001,"Books","1 years","Max is being naughty. His mother calls him a 'wild thing' and, when he is cheeky to her, she sends him to bed without his dinner. Dressed in pyjamas that make him look rather like a wolf, Max feels very cross up in his room and either dreams or imagines that his bedroom turns into a jungle.", "Maurice Sendak","BKS21-017.jpg",7.00);
INSERT INTO products VALUES ("BKS21-018","Brown Bear, Brown Bear What Do You See?",2001,"Books","1 years","An all-time favourite that introduces different colours through simple text, presented in a satisfyingly repetitive pattern. The book offers rhythmic, rhyming text and an ideal starting point for craft activities.", "Bill Martin and Eric Carle","BKS21-018.jpg",8.00);

INSERT INTO products VALUES ("TYS22-011","Large Jumbo Knob Bundle",2002,"Toys","1 years","Colorful farm and geometric artwork;Extra-thick wooden puzzle features jumbo wooden knobs for easy grasping.;Bright colors and sweet illustrations of familiar objects.;Full-color, matching pictures appear underneath each piece.", "Melissa & Doug","TYS22-011.jpg",26.00);
INSERT INTO products VALUES ("TYS22-012","Basket of Babies",2002,"Toys","1 years","Love taking after their parents and taking care of their own babies. With this set of six dolls, there's a lot here to love! Each snuggly soft babe comes with a removable outfit, so your toddlers can mix and match.", "Creative Minds","TYS22-012.jpg",31.00);
INSERT INTO products VALUES ("TYS22-013","Dimpl Digits",2002,"Toys","1 years","There are different, colored bubbles, numbered from one to ten, that give a satisfying pop when you push them in.", "Fat Brain Toys","TYS22-013.jpg",15.00);
INSERT INTO products VALUES ("TYS22-014","Smart Shots Sports Center",2002,"Toys","1 years","The set lights up and makes sounds while also keeping track of the baskets and goal on a light-up scoreboard.", "Vtech","TYS22-014.jpg",30.00);
INSERT INTO products VALUES ("TYS22-015","Busy Buggy",2002,"Toys","1 years","There are also lots of little features that spin, click and otherwise make noise.", "Radio Flyer","TYS22-015.jpg",31.00);
INSERT INTO products VALUES ("TYS22-016","Sweet Smiles Doll", 2002,"Toys","1 years","To encourage empathy and pretend play, these dolls come with Madame Alexander-quality molded faces and soft, huggable bodies. They come in a range of skin tones, they're also weighted, so they feel more lifelike.", "Madame Alexander","TYS22-016.jpg",26.00);
INSERT INTO products VALUES ("TYS22-017","Mega Bloks",2002,"Toys","1 years","Because of their bright colors and easy-to-hold shape, these classic large blocks are especially perfect for kids just past their first birthday. You can even get them to help clean up by making a game of putting the 80 blocks back into the zip-up storage bag.", "Mega Brands","TYS22-017.jpg",11.00);
INSERT INTO products VALUES ("TYS22-018","Go! Go! Smart Wheels Launch and Chase Police Tower",2002,"Toys","1 years","This playset features a police car and a getaway car that race around on the colorful track. Less-than-gentle toddlers were entertained by the lights, noises and sounds the cars make as they travel along the sturdy tracks.", "Vtech","TYS22-018.jpg",40.00);

INSERT INTO products VALUES ("ACS23-011","Washable Fingerpaint Kit",2003,"Arts and Crafts","1 years","Provides hours of substantial fun, experimenting with colors beside each other, mixing colors creating new ones, and having all-around artistic fun. Containing 10 sheets of glossy painting paper and 4 Crayola washable finger paints in red, blue, yellow, and green.", "Crayola","ACS23-011.jpg",48.13);
INSERT INTO products VALUES ("ACS23-012","Washable Palm-Grasp Crayons",2003,"Arts and Crafts","1 years","Feature an ergonomically designed egg-shaped crayon which makes it super easy for toddlers to hold comfortably and scribble with. The contents of the set feature 6 Palm-Grip Crayons for babies in Red, Orange, Yellow, Green, Blue, and Purple.", "Crayola","ACS23-012.jpg",24.98);
INSERT INTO products VALUES ("ACS23-013","Aqua Magic Mat",2003,"Arts and Crafts","1 years","Just add water to the pen and watch your children draw anything they can think of, before it appears in just a second. ", "Chad Valley ","ACS23-013.jpg",8.00);
INSERT INTO products VALUES ("ACS23-014","Curiosity Table",2003,"Arts and Crafts","1 years","The two-sided art and science table will have your little one’s attention for hours, with removable, spinning gears to color-discovery circuits and flashing lights. Turn light bulbs on by connecting gears, and experiment with mixing color by using the mess-free paint pots.", "Einstein’s","ACS23-014.jpg",70.00);
INSERT INTO products VALUES ("ACS23-015","Doodle Board",2003,"Arts and Crafts","1 years","On one side there is a sealed gel surface for a mess-free creative session and physical play. The reverse side has a reusable sketch area for producing scribbles with the Ultra Clean washable crayons that are included.", "Crayola","ACS23-015.jpg",8.00);
INSERT INTO products VALUES ("ACS23-016","Jumbo Paint Brushes",2003,"Arts and Crafts","1 years","Featuring four paintbrushes with easy-grip handles and jumbo tips all stored in an easy-to-store pouch. Quick and simple to clean, simply wash with warm water and soap.", "Melissa And Doug","ACS23-016.jpg",5.00);
INSERT INTO products VALUES ("ACS23-017","My Best Toddler Coloring Book",2003,"Arts and Crafts","1 years","Fun with Numbers, Letters, Shapes, Colors, Animals: Big Activity Workbook", "Happy Toddlerz","ACS23-017.jpg",5.00);
INSERT INTO products VALUES ("ACS23-018","Wonder Wheel Activity Center",2003,"Arts and Crafts","1 years","Enclosed within the transparent structure are colorful beads, aiding your child to connect sound to sight, and the spinning central sections give a higher level of visual tracking and increase fine motor skills.", "Sassy","ACS23-018.jpg",25.00);

INSERT INTO products VALUES ("CLG30-011","Originals Girls' Trefoil All Over Print SS Tracksuit Infant",3000,"Clothing","2-3 years","In a black and Rose Gold colourway, this two-piece set is made from a soft poly cotton for all-day comfort. With a full zip track top and matching joggers with an elasticated waist, this tracksuit has ribbed trims for a snug feel. Finished with adi's legendary 3-Stripes and Trefoil branding.", "Adidas","CLG30-011.jpg",40.00);
INSERT INTO products VALUES ("CLG30-012","Badge of Sport Crew Tracksuit Infant",3000,"Clothing","2-3 years","In a grey colourway, this suit is made from soft poly cotton to keep them feelin' comfy. The sweatshirt has ribbed trims and a crew neckline for a cosy wear, while the matching track pants have an elasticated waist for the perfect fit.", "Adidas","CLG30-012.jpg",20.00);
INSERT INTO products VALUES ("CLG30-013","Girls' Badge of Sport T-Shirt/Shorts Set Infant",3000,"Clothing","2-3 years","Made from 100% organic cotton fabric, which is soft and durable, this downsized set features a pink tee with a crew neckline and short sleeves with grey shorts to match.", "Adidas","CLG30-013.jpg",8.00);
INSERT INTO products VALUES ("CLG30-014","Micro Oaky Full Zip Tracksuit Infant",3000,"Clothing","2-3 years","In a marled Grey colourway with tonal and white chest panels, this downsized suit is made from soft polycotton fleece with a brushed inner for snug warmth.", "McKenzie","CLG30-014.jpg",12.00);
INSERT INTO products VALUES ("CLG30-015","Disney Mickey Mouse T-Shirt",3000,"Clothing","2-3 years","This kids' adidas t-shirt shows off Disney's Mickey Mouse along with retro-style cartoon graphics. The soft cotton fabric has a loose, comfortable fit.", "Adidas","CLG30-015.jpg",17.00);
INSERT INTO products VALUES ("CLG30-016","Performance Disney Minnie Mouse Summer Set",3000,"Clothing","2-3 years","Cool them down on a hot day with a little help from Disney's Minnie Mouse. This infants' adidas summer set includes a top made from cotton to keep them comfortable.", "Adidas","CLG30-016.jpg",25.00);
INSERT INTO products VALUES ("CLG30-017","England 2020 Away Kit Infant",3000,"Clothing","2-3 years","In a Mega Blue colourway, this kit has a tonal, all-over print that sports the legendary Three Lions crest.", "Nike","CLG30-017.jpg",40.00);
INSERT INTO products VALUES ("CLG30-018","Liverpool FC 2020/21 Third Kit Infant",3000,"Clothing","2-3 years","It features a checkerboard V-neck shirt with contrasting red trims, as well as matching shorts and socks for a look like the pros.", "Nike","CLG30-018.jpg",40.00);
INSERT INTO products VALUES ("CLG30-019","Baby tweed coat pink",3000,"Clothing","2-3 years","This beautiful tweed coat is sure to become her favourite this season. Featuring a pretty bow to the front and soft faux fur collar, this is the sweetest autumn addition.", "Monsoon","CLG30-019.jpg",23.00);
INSERT INTO products VALUES ("CLG30-020","Baby pearl puffball dress ivory",3000,"Clothing","2-3 years","She will look adorable in our Baby Pearl Puffball Dress. Featuring a pink corsage and bow, the piece flows beautifully from a bodice into a puffball-style skirt. Designed in soft twill fabric, creating a slight surface sheen. Concealed zip to the rear.", "Monsoon","CLG30-020.jpg",40.00);
INSERT INTO products VALUES ("CLG30-021","Baby cynthia corsage dress green",3000,"Clothing","2-3 years", "In duchess twill, it features a pink rose corsage and cap sleeves. On the reverse is a statement bow and a concealed zip.", "Monsoon","CLG30-021.jpg",45.00);
INSERT INTO products VALUES ("CLG30-022","Baby rose print padded coat pink",3000,"Clothing","2-3 years","A beautiful print of blooming roses decorates this pretty coat for baby girls. The softly padded design features a hooded neck with a luxurious faux fur trim, fastening with a zip through the front.", "Monsoon","CLG30-022.jpg",40.00);
INSERT INTO products VALUES ("CLG30-023","Benjamin tuxedo suit set black",3000,"Clothing","2-3 years","Perfectly tailored, this four-piece outfit features sharp trousers and a matching blazer with satin lapels. Its crisp, white shirt has a stylish dobby weave and it comes complete with a pretied bowtie.", "Monsoon","CLG30-023.jpg",70.00);
INSERT INTO products VALUES ("CLG30-024","Dinosaur long-sleeve t-shirt yellow",3000,"Clothing","2-3 years","Add this sweatshirt to your little boy's wardrobe for styling throughout seasons. It features a statement dinosaur in patchwork fabric which can add print and colour to any outfit.", "Monsoon","CLG30-024.jpg",13.00);
INSERT INTO products VALUES ("CLG30-025","Striped shirt and bow tie set blue",3000,"Clothing","2-3 years","Smart yet charming, this colourful set features a striped shirt with matching bow tie – perfect for summer events. The shirt has a point collar, button placket and single chest pocket, and the bow tie is adjustable to ensure a comfy fit.", "Monsoon","CLG30-025.jpg",19.00);
INSERT INTO products VALUES ("CLG30-026","Tiger printed t-shirt camel",3000,"Clothing","2-3 years","Take a walk on the wild side with this adventure-ready T-shirt. It's crafted from soft, lightweight jersey with a crew neckline and colourful tiger print across the front.", "Monsoon","CLG30-026.jpg",14.00);

INSERT INTO products VALUES ("BKS31-011","Giraffes Can’t Dance Board book",3001,"Books","2-3 years","Is a touching tale of Gerald the giraffe, who wants nothing more than to dance.", "Giles Andreae Guy Parker-Rees","BKS31-011.jpg",5.00);
INSERT INTO products VALUES ("BKS31-012","Grumpy Monkey",3001,"Books","2-3 years","Some days we just wake up on the wrong side of the bed. Jim’s friends can’t understand why he’s acting so grumpy, but as this comical story teaches, feeling our feelings is often the best way through them.", "Suzanne Lang","BKS31-012.jpg",12.00);
INSERT INTO products VALUES ("BKS31-013","Duck & Goose, 1, 2, 3",3001,"Books","2-3 years","Count clouds, feet, and eyes with the help of Duck and Goose. These little birds have won over the hearts of many toddlers, including mine.", "Tad Hills","BKS31-013.jpg",6.49);
INSERT INTO products VALUES ("BKS31-014","Just for Me",3001,"Books","2-3 years","This sweet primer on sharing may feel especially timely as you reach the twos. Ruby’s quick to learn that sharing with friends is way more fun.", "Jennifer Hansen Rolli","BKS31-014.jpg",18.69);
INSERT INTO products VALUES ("BKS31-015","Llama Llama Red Pajama",3001,"Books","2-3 years","A rhyming read-aloud that finds young Llama Llama feeling nervous about falling asleep by himself - and Mama Llama coming to the rescue.", "Anna Dewdney","BKS31-015.jpg",17.00);
INSERT INTO products VALUES ("BKS31-016","Dragons Love Tacos",3001,"Books","2-3 years","Dragons love tacos. They love chicken tacos, beef tacos, great big tacos, and teeny tiny tacos. So if you want to lure a bunch of dragons to your party, you should definitely serve tacos. ", "Adam Rubin","BKS31-016.jpg",11.00);
INSERT INTO products VALUES ("BKS31-017","The Wonderful Things You Will Be",3001,"Books","2-3 years","Filled with beautiful, quirky illustrations and clever rhyme, grown-ups will love reading this book to their children at any age as they lovingly consider all the possibilities that lie ahead.", "Emily Winfield Martin","BKS31-017.jpg",15.00);
INSERT INTO products VALUES ("BKS31-018","The Incredible Book Eating Boy",3001,"Books","2-3 years","Henry loves books. However, his pleasure isn't derived from reading them but from eating them instead. He gulps down all kinds of books, from storybooks to dictionaries and discovers that the more he eats, the smarter he gets.", "Oliver Jeffers","BKS31-018.jpg",3.20);

INSERT INTO products VALUES ("TYS32-011","DUPLO Town Submarine Adventure Bath Toy",3002,"Toys","2-3 years","A chunky 24-piece set that fits together to make an underwater arch with seaweed and a submarine that you can submerge in the bath. Comes with 2 diver figures, a clownfish, a whale, a seagull and snorkel, flippers and underwater camera for the divers.", "Lego","TYS32-011.jpg",18.00);
INSERT INTO products VALUES ("TYS32-012","Scoop and Learn Ice Cream Cart",3002,"Toys","2-3 years","An interactive push-along 63cm-high trolley stacked with ice cream combos for your child to create and serve. Comes with 6 activity cards you can insert into the cart to hear ice-cream orders to make and then ring through the till. Requires 3 AAA batteries (included).", "LeapFrog","TYS32-012.jpg",50.00);
INSERT INTO products VALUES ("TYS32-013","Animal Rescue Shape Sorting Truck",3002,"Toys","2-3 years","A 26cm x 17cm x 11cm wooden safari truck with 2 rangers, and 7 animals that each fit into to the truck, each though a differently-shaped hole in the side.", "Melissa & Doug","TYS32-013.jpg",17.00);
INSERT INTO products VALUES ("TYS32-014","Cleaning Set",3002,"Toys","2-3 years","A colourful, toddler-sized cleaning playset, including a mop and bucket, broom and dustpan and brush.", "John Lewis","TYS32-014.jpg",12.00);
INSERT INTO products VALUES ("TYS32-015","Pick-up & Count Vacuum",3002,"Toys","2-3 years","A 58cm-high plastic pretend vacuum cleaner that lights up, counts and sings as it sucks up 10 colourful plastic dust pieces. It has 3 modes of play that teach colours and numbers, and a music button that activates songs about counting, colours and cleaning up.", "LeapFrog","TYS32-015.jpg",33.00);
INSERT INTO products VALUES ("TYS32-016","Wooden Make a Cake Mixer Set",3002,"Toys","2-3 years","Mix up some delicious pretend-play fun with this realistic wooden mixer. Turn dials to adjust speed and use the crank to turn the bowl that fits the mixer. ", "Melissa & Doug","TYS32-016.jpg",23.00);
INSERT INTO products VALUES ("TYS32-017","120 Piece Play Food Set",3002,"Toys","2-3 years","120 varieties of play food including all you need for pretend picnics, dinner parties or to use with play kitchens.", "Chad Valley","TYS32-017.jpg",10.00);
INSERT INTO products VALUES ("TYS32-018","Pick and Mix Sweet Shop",3002,"Toys","2-3 years","This enchanting sweet shop features a display counter with cash drawer, working scales, two sweet jars (containing real sweets), coins and bank notes plus a large selection of real sweets and lollipops.", "Chad Valley","TYS32-018.jpg",10.00);

INSERT INTO products VALUES ("FS33-011","Frozen 2",3003,"Film DVDs","2-3 years","Why was Elsa born with magical powers? The answer is calling her and threatening her kingdom. Together with Anna, Kristoff, Olaf and Sven, she'll set out on a dangerous but remarkable journey.", "Disney","FS33-011.jpg",13.00);
INSERT INTO products VALUES ("FS33-012","Moana",3003,"Film DVDs","2-3 years","From Walt Disney Animation Studios comes Moana, an epic adventure about a spirited teen who sets sail on a daring mission to save her people.", "Disney","FS33-012.jpg",17.00);
INSERT INTO products VALUES ("FS33-013","Pinocchio",3003,"Film DVDs","2-3 years","The legendary masterpiece that inspired millions to believe in their dreams has reawakened with start-of-the-art digital restoration that shines brilliantly on DVD.", "Disney","FS33-013.jpg",15.00);
INSERT INTO products VALUES ("FS33-014","Peter Pan",3003,"Film DVDs","2-3 years","Let your dreams take flight with the film that taught us to believe", "Disney","FS33-014.jpg",20.00);
INSERT INTO products VALUES ("FS33-015","Jungle Book",3003,"Film DVDs","2-3 years","Meet the most unforgettable characters and embark on a thrilling adventure with Mowgli, as he journeys deep into the jungle and learns ''The Bare Necessities'' of life from happy-go-lucky Baloo the bear.", "Disney","FS33-015.jpg",12.00);
INSERT INTO products VALUES ("FS33-016","Christopher Robin", 3003,"Film DVDs","2-3 years","Winnie the Pooh and friends embark on a new adventure to help remind a grown-up Christopher Robin how to laugh again", "Disney","FS33-016.jpg",5.00);
INSERT INTO products VALUES ("FS33-017","A Goofy Movie",3003,"Film DVDs","2-3 years","This rockin' and rollin' tale finds Goofy and his teenage son, Max, up to their floppy ears in misadventure.", "Disney","FS33-017.jpg",3.00);
INSERT INTO products VALUES ("FS33-018","Ultimate Spider-Man Collection",3003,"Film DVDs","2-3 years","Four-volume collection of episodes from the children's animated series following the Marvel Comics superhero. Midtown High student Peter Parker (voice of Drake Bell) works as his web-slinging alter ego Spider-Man, alongside a group of teenagers with superpowers of their own, to protect the world from notorious villains.", "Marvel","FS33-018.jpg",19.00);

INSERT INTO products VALUES ("ACS34-011","PlaySmart Interactive Magnetic Easel",3004,"Arts and Crafts","2-3 years","This magnetic easel is perfect for fuelling your child's creativity as they draw and write anything and everything they could imagine.", "Chad Valley","ACS34-011.jpg",20.00);
INSERT INTO products VALUES ("ACS34-012","Large Tools and Storage",3004,"Arts and Crafts","2-3 years","It's got over 20 classic Play-Doh tools, 8 colours, and a storage case that doubles as a play surface. Assorted tools that let them cut, roll, and shape Play-Doh compound provide lots of options to get kids thinking and creating.", "Play-Doh","ACS34-012.jpg",10.00);
INSERT INTO products VALUES ("ACS34-013","Reversible Craft Kit - Kids Craft Set",3004,"Arts and Crafts","2-3 years","A wonderful educational toy designed to allow your child to express their creativity and use their imagination.", "Jaques London","ACS34-013.jpg",9.99);
INSERT INTO products VALUES ("ACS34-014","Giant Box of Craft 1000 Pieces",3004,"Arts and Crafts","2-3 years","Be amazed by this Giant Box of Craft! From crafty monsters to sparkling accessories, blossoming young imaginations can finally make as many different crafts as they like!", "Play House","ACS34-014.jpg",14.00);
INSERT INTO products VALUES ("ACS34-015","Bumper Craft Creativity Pack",3004,"Arts and Crafts","2-3 years","A bumper craft pack of assorted card, paper, stickers and more! Children can get crafty and design their own cards, boxes and decorations.", "Folia","ACS34-015.jpg",10.00);
INSERT INTO products VALUES ("ACS34-016","Colour Wonder Mess Free Colouring Set Paw Patrol",3004,"Arts and Crafts","2-3 years", "Magically mess-free colouring adventures with Paw Patrol! Color Wonder products are non-toxic and won't colour on skin, furniture or fabrics! The special ink in Colour Wonder Markers is clear on most surfaces, yet each marker 'magically' shows up a different color on Color Wonder Paper.", "Crayola","ACS34-016.jpg",6.77);
INSERT INTO products VALUES ("ACS34-017","31Pcs Sponge Painting Brushes Kits Kids Paintbrushes Children Drawing Tool",3004,"Arts and Crafts","2-3 years","High-end Material: The toddler paint set made from premium non-toxic EVA foam, plastic handle and sponge brush head, easy for children to master and control.", "Yolispa","ACS34-017.jpg",9.30);
INSERT INTO products VALUES ("ACS34-018","4 Pieces Spill Proof Paint Cups and Paint Brushes for Colored Paintbrushes",3004,"Arts and Crafts","2-3 years","Smallones 4 Pieces No Spill Paint Cups in 4 Colors and 4 Pieces Assorted Colored Brushes Set", "Jatidne Smallones","ACS34-018.jpg",9.98);

INSERT INTO products VALUES ("CLG40-011","5-pack jersey tops",4000,"Clothing","4-5 years","Long-sleeved tops in soft organic cotton jersey.", "H&M","CLG40-011.jpg",18.00);
INSERT INTO products VALUES ("CLG40-012","5-pack jersey leggings",4000,"Clothing","4-5 years","Leggings in soft organic cotton jersey with an elasticated waist.", "H&M","CLG40-012.jpg",20.00);
INSERT INTO products VALUES ("CLG40-013","4-pack printed T-shirts",4000,"Clothing","4-5 years","Classic T-shirts in printed cotton jersey with a ribbed neckline.", "H&M","CLG40-013.jpg",18.00);
INSERT INTO products VALUES ("CLG40-014","Printed hooded top",4000,"Clothing","4-5 years","Top in soft, printed sweatshirt fabric with a jersey-lined, wrapover hood, long sleeves and ribbing at the cuffs and hem. Soft brushed inside.", "H&M","CLG40-014.jpg",19.00);
INSERT INTO products VALUES ("CLG40-015","Velvet Trim Coat with Brooch Blue",4000,"Clothing","4-5 years","Keep her smart and snug in this long coat, designed in soft, felt-like fabric with velvet trims. The piece features a collared neckline, button fastenings and side pockets, with a velvet brooch detail to the left-hand side.", "Monsoon","CLG40-015.jpg",27.50);
INSERT INTO products VALUES ("CLG40-016","Be Magical Unicorn Sweat Dress Blue",4000,"Clothing","4-5 years","Add a touch of magic to her everyday wardrobe with this sparkly tunic dress. Created in soft sweat fabric, it features a printed unicorn motif with shimmering gem and sequin embellishments.", "Monsoon","CLG40-016.jpg",28.00);
INSERT INTO products VALUES ("CLG40-017","Colour-Block Sequin Skirt Pink",4000,"Clothing","4-5 years","Think pretty polka dots and sparkly stripes when styling your little one in this perfect party skirt. Featuring a sequin-embellished mesh overlay to the skirt, the waistband also features a metallic thread to add more sparkle than they could ever imagine!", "Monsoon","CLG40-017.jpg",24.00);
INSERT INTO products VALUES ("CLG40-018","Rainbow Sequin T-shirt Blue",4000,"Clothing","4-5 years","Add some sparkle to their casual collection with this fun T-shirt. It features an artistic design on the front including a sequin rainbow and metallic detailing.", "Monsoon","CLG40-018.jpg",16.00);
INSERT INTO products VALUES ("CLG40-019","Niamh Sparkle Knit Cardigan with Crystal Button Ivory",4000,"Clothing","4-5 years","This shimmery cardigan is perfect for layering over occasion dresses. It features scalloped edges, a cropped length and a crystal button to fasten.", "Monsoon","CLG40-019.jpg",20.00);
INSERT INTO products VALUES ("CLG40-020","Candy Stripe Dress Multi",4000,"Clothing","4-5 years","Elevate their daytime dressing in sweet stripes and floaty frills. Belted with a ribbon bow, the shoulders and skirt both feature frilled layered hems which adds a sweet finishing touch to the candy-inspired dress. To the reverse is a button closure, making getting them changed even easier.", "Monsoon","CLG40-020.jpg",28.00);
INSERT INTO products VALUES ("CLG40-021","Rocket Knit Jumper in Organic Cotton Blue",4000,"Clothing","4-5 years","Pair this soft-knit jumper with jeans on chilly days. The charming piece features a classic crew neckline, ribbed trims and an all-over rocket ship pattern.", "Monsoon","CLG40-021.jpg",11.50);
INSERT INTO products VALUES ("CLG40-022","London Animal Long Sleeve T-Shirt Grey",4000,"Clothing","4-5 years","This playful piece features imagines London landmarks overtaken by wild animals! It's designed in soft, lightweight jersey and has a crew neckline and long sleeves. Team with his favourite pair of jeans.", "Monsoon","CLG40-022.jpg",14.00);
INSERT INTO products VALUES ("CLG40-023","Embroidered Fox Knit Jumper in Organic Cotton Teal",4000,"Clothing","4-5 years","Pair this soft-knit jumper with jeans on chilly days. The charming piece features a classic crew neckline, ribbed trims and an all-over embroidered fox design.", "Monsoon","CLG40-023.jpg",23.00);
INSERT INTO products VALUES ("CLG40-024","Blake Blue Shorts and Belt Set Blue",4000,"Clothing","4-5 years","These smart shorts pair perfectly with both shirts and tees. They are designed in a light cotton twill and feature side pockets, turn-up cuffs and a detachable D-ring belt.", "Monsoon","CLG40-024.jpg",19.00);
INSERT INTO products VALUES ("CLG40-025","Stone Belted Chino Trouser Natural",4000,"Clothing","4-5 years","He will stay looking smart and feeling comfy in the Stone chino trousers for boys. With belt loops, turned hems and essential pockets at the front and rear.", "Monsoon","CLG40-025.jpg",18.00);
INSERT INTO products VALUES ("CLG40-026","Rufus Shorts with Dinosaur Trim Red",4000,"Clothing","4-5 years","Our Rufus shorts are crafted from lightweight twill and feature belt loops, a concealed fly, functional pockets and contrast turn-up cuffs with a dinosaur pattern.", "Monsoon","CLG40-026.jpg",17.00);

INSERT INTO products VALUES ("BKS41-011","The Perfect Sofa",4001,"Books","4-5 years","Panda and Penguin love their old sofa, but decide it's time to go shopping for a new one when the springs start to poke through. Fifi Kuo’s illustrations bring warmth and humour to the story of learning to appreciate and love what we already have in our lives.", "Fifi Kuo","BKS41-011.jpg",11.72);
INSERT INTO products VALUES ("BKS41-012","We Eat Bananas",4001,"Books","4-5 years","Animal friends chomp their way through a variety of different meals in this cheerful celebration of food. Bright, bold illustrations are full of humorous detail and the book is a delight to share with young children.", "Katie Abey","BKS41-012.jpg",5.80);
INSERT INTO products VALUES ("BKS41-013","Ravi’s Roar",4001,"Books","4-5 years","When being the youngest and smallest gets too annoying, Ravi roars and turns into a tiger! But who wants to play with a tiger? An entertaining book about losing your temper and recovering from it.", "Tom Percival","BKS41-013.jpg",5.66);
INSERT INTO products VALUES ("BKS41-014","Hair, it’s a Family Affair!",4001,"Books","4-5 years","This celebration of black hair, demonstrating the variety of hairstyles found in a single family, is another delightful read, full of vibrant illustration and some simple text about elements of everyday life.", "Mylo Freeman","BKS41-014.jpg",9.93);
INSERT INTO products VALUES ("BKS41-015","Mini Rabbit: Not Lost",4001,"Books","4-5 years","Mini Rabbit helps Mother Rabbit to bake a cake, but they run out of berries, so he embarks on an enthusiastic search for the missing ingredient. A delightfully funny picture book, bursting with distinctive, vibrant illustrations.", "John Bond","BKS41-015.jpg",14.17);
INSERT INTO products VALUES ("BKS41-016","Have You Seen My Blankie?",4001,"Books","4-5 years","A princess loses her blankie. Who could have taken it? Her brother, a witch, a giant… or someone more fiery? A charming book that stresses the pleasure of sharing and features a brave and compassionate young heroine who is in no way a stereotypical princess.", "Lucy Rowland","BKS41-016.jpg",4.72);
INSERT INTO products VALUES ("BKS41-017","Cyril the Lonely Cloud",4001,"Books","4-5 years","Cyril the cloud drifts alone through the skies, wishing somebody would smile at him. Instead, everyone blames him for spoiling their day. This vibrant, thought-provoking picture book demonstrates the importance of rainwater to make sure the planet thrives.", "Tim Hopgood","BKS41-017.jpg",15.13);
INSERT INTO products VALUES ("BKS41-018","Look Up!",4001,"Books","4-5 years","A gorgeous character in Rocket, a girl whose passion for all things space is as inspiring to the reader as her heroine Mae Jemison is to her.", "Nathan Bryon","BKS41-018.jpg",7.00);

INSERT INTO products VALUES ("TYS42-011","Big Fire Engine Puzzle",4002,"Toys","4-5 years","A big, bright 53cm x 42cm shaped floor puzzle with 20 cardboard pieces.", "Orchard Toys","TYS42-011.jpg",11.00);
INSERT INTO products VALUES ("TYS42-012","Muddy Puddle Game",4002,"Toys","4-5 years","A game where you race from muddy puddle to muddy puddle to reach Peppa at the top of the hill – without falling into 1 of the deep puddles and having to start again. Comes with 12 playing pieces and 24 action cards. For 2 to 4 players.", "Peppa Pig","TYS42-012.jpg",15.00);
INSERT INTO products VALUES ("TYS42-013","Spotty Sausage Dogs", 4002,"Toys","4-5 years","A counting game that’s all about who can build the sausage dog with the most spots on its tummy. Comes with 40 sausage-dog cards, a spinner, 7 coloured discs and instructions. For 2 to 6 players.", "Orchard Toys","TYS42-013.jpg",8.00);
INSERT INTO products VALUES ("TYS42-014","Family Fun Family Camper",4002,"Toys","4-5 years","A 28cm-high Winnebago-style camper van, with a removable roof and sidewall and a pop-up roof storage box. Comes with 3 family  figures (a man, woman and boy), and accessories including camping chairs, mountain bikes, BBQ, crockery and cutlery, a teddy bear and sun cream.", "Playmobil","TYS42-014.jpg",55.00);
INSERT INTO products VALUES ("TYS42-015","Batmobile",4002,"Toys","4-5 years","A 30cm-high remote-controlled Batmobile. Comes with a Batman figure (10cm), a remote control and a USB charging cable for the car. The remote control requires 2 AAA batteries (not included).", "Launch and Defend Batmobile","TYS42-015.jpg",40.00);
INSERT INTO products VALUES ("TYS42-016","Smartwatch",4002,"Toys","4-5 years","A smartwatch featuring an LED robot with friendly facial expressions and responsive sound effects. It can play games, take selfie, store videos and photos, and has a pedometer, timer, stopwatch and alarm. Requires 1 LiPo rechargeable battery (included). Available in pink.", "Tobi Robot","TYS42-016.jpg",50.00);
INSERT INTO products VALUES ("TYS42-017","Little Red Riding Hood",4002,"Toys","4-5 years","A brain-teasing 24cm x 29cm x 6cm puzzle based around the story of Little Red Riding Hood. As well as the board, it comes with 5 road puzzle pieces, 3 trees, a little Red Riding Hood, a wolf, Granny’s house, a booklet of 48 challenges and a little picture book of the Red Riding Hood tale.", "SmartGames","TYS42-017.jpg",20.00);
INSERT INTO products VALUES ("TYS42-018","City Life Tiny Paws Pet Hotel",4002,"Toys","4-5 years","A 76cm x 24cm x19cm 154-piece pet-hotel playset with a kitchen and an animal flap leading into the garden – which has a see saw, kennels and outdoor lights. Comes with 3 figures, 8 dogs, 2 parrots, bananas, carrots, dog food, chew toys and all sorts of other little accessories.", "Playmobil","TYS42-018.jpg",60.00);

INSERT INTO products VALUES ("ACS43-011","BirdHouse and Rock Painting kit",4003,"Arts and Crafts","4-5 years","Instead of drawing on a piece of paper, the children draw on a three-dimensional stones and wood, which is very amazing and interesting, makes them more curious about this kind of painting!", "Inpodak","ACS43-011.jpg",19.99);
INSERT INTO products VALUES ("ACS43-012","Piggy Bank Painting Set",4003,"Arts and Crafts","4-5 years","Paint your very own piggy bank to keep your pocket money safe", "Made It!","ACS43-012.jpg",4.00);
INSERT INTO products VALUES ("ACS43-013","Glow In The Dark Sand Art Set",4003,"Arts and Crafts","4-5 years","Have hours of fun with this Super Sand Art Play Set, create amazing designs with lots of exciting colours and watch as they glow in the dark. ", "Creative Kids","ACS43-013.jpg",9.49);
INSERT INTO products VALUES ("ACS43-014","Sand Art Kit",4003,"Arts and Crafts","4-5 years","Containing: 3 Bottles with Screw Tight Lids, Plastic Scoop, Wooden Stick, Plastic Funnel, 1 Bag of Glow Sand, 1 Bag of Glitter Sand and 8 Bags of Coloured Sand in Yellow, Pink, Orange, Blue Purple and Green to For Your Very Own Personalised Sand Art Creation", "Abeec","ACS43-014.jpg",10.00);
INSERT INTO products VALUES ("ACS43-015","Mini Bags of Coloured Sand in 12 assorted colours",4003,"Arts and Crafts","4-5 years","This is a very special type of sand that you won’t find on the beach, it comes in bold, bright shades and has a bit of shimmer thrown in for good measure. ", "Baker Ross","ACS43-015.jpg",6.00);
INSERT INTO products VALUES ("ACS43-016","Mega Mosaics",4003,"Arts and Crafts","4-5 years","Make 12 fun mosaic pictures with colourful foam tiles. Simply tile by number, matching the colour of tile to its number on the picture. Peel the backing off the tiles and stick on the picture to create your mosaic pictures with no glue required.", "Galt Toys","ACS43-016.jpg",10.00);
INSERT INTO products VALUES ("ACS43-017","Dough Tools set",4003,"Arts and Crafts","4-5 years","26 dough tools are made of solid, light, recycled and non-toxic plastics.", "Bluesees","ACS43-017.jpg",9.77);
INSERT INTO products VALUES ("ACS43-018","Air Dry Clay Kit",4003,"Arts and Crafts","4-5 years","By rubbing, pinching, tearing, twisting, pressing, mixing and stretching clay, kids could practice their hand-eye coordination, and stimulate imagination and creativity.There are also different kinds of modeling tools and 3 decorative accessories help you decorate your image.", "Paochocky","ACS43-018.jpg",9.00);

INSERT INTO products VALUES ("FS44-011","Alice In Wonderland",4004,"Film DVDs","4-5 years","In this animated Disney version of Lewis Carroll's stories, young Alice is transported to the bizarre Wonderland after following the March Hare down a rabbit hole.", "Disney","FS44-011.jpg",7.00);
INSERT INTO products VALUES ("FS44-012","Sleeping Beauty",4004,"Film DVDs","4-5 years","Create new memories that will last a lifetime as you experience the dazzling animation and timeless storytelling of Disney's Sleeping Beauty.", "Disney","FS44-012.jpg",7.00);
INSERT INTO products VALUES ("FS44-013","Snow White and the Seven Dwarfs",4004,"Film DVDs","4-5 years","Generations have celebrated the magical story, memorable music and unforgettable characters of Walt Disney's Snow White And The Seven Dwarfs.", "Disney","FS44-013.jpg",13.00);
INSERT INTO products VALUES ("FS44-014","Nightmare Before Christmas", 4004,"Film DVDs","4-5 years","This movie milestone from Tim Burton (Planet of the Apes, Sleepy Hollow) is a fun fantasy for the whole family!", "Disney","FS44-014.jpg",4.00);
INSERT INTO products VALUES ("FS44-015","Iron Will",4004,"Film DVDs","4-5 years","When Will Stoneman's father dies, he is left alone to take care of his mother and their land. Needing money, he joins a cross country dogsled race.", "Disney","FS44-015.jpg",2.49);
INSERT INTO products VALUES ("FS44-016","Tangled",4004,"Film DVDs","4-5 years","Disney presents a new twist on one of the most hilarious and hair-raising tales ever told.", "Disney","FS44-016.jpg",14.00);
INSERT INTO products VALUES ("FS44-017","Princess & the Frog",4004,"Film DVDs","4-5 years","Discover what really happened after the princess kissed the frog in an inspired twist on the world's most famous kiss", "Disney","FS44-017.jpg",14.00);
INSERT INTO products VALUES ("FS44-018","Pocahontas",4004,"Film DVDs","4-5 years","True to the spirit of a great Disney classic, this extraordinary film bursts with music", "Disney","FS44-018.jpg",20.00);

INSERT INTO products VALUES ("CLG50-011","2-piece set",5000,"Clothing","6-11 years","Set with a sweatshirt and matching pair of joggers in sweatshirt fabric made from organic cotton, recycled cotton and recycled polyester with a soft brushed inside.", "H&M","CLG50-011.jpg",19.99);
INSERT INTO products VALUES ("CLG50-012","Shimmering tulle dress",5000,"Clothing","6-11 years","Dress in soft tulle with a shimmering pattern. Round neckline with a small opening and button at the back of the neck, short puff sleeves with narrow elastication around the hems, and a flared skirt. Lined.", "H&M","CLG50-012.jpg",15.00);
INSERT INTO products VALUES ("CLG50-013","2-pack jersey pyjamas",5000,"Clothing","6-11 years","Pyjamas in soft, printed cotton jersey. Long-sleeved top with ribbing around the neckline and cuffs. Bottoms with an elasticated waist and ribbed hems.", "H&M","CLG50-013.jpg",20.00);
INSERT INTO products VALUES ("CLG50-014","3-pack printed T-shirts",5000,"Clothing","6-11 years","T-shirts in cotton jersey with a print motif.", "H&M","CLG50-014.jpg",15.00);
INSERT INTO products VALUES ("CLG50-015","Foil Heart Print Frill Playsuit Pink",5000,"Clothing","6-11 years","This playsuit makes a great throw-on-and-go piece for sunny day adventures. Created in lightweight fabric, it features a pretty heart print in shimmery gold, pairing perfectly with the vibrant fuchsia underneath.", "Monsoon","CLG50-015.jpg",18.00);
INSERT INTO products VALUES ("CLG50-016","Denim Puff Sleeve Jumpsuit Blue",5000,"Clothing","6-11 years","With a belted waistline and puff sleeves, this denim jumpsuit is the perfect pick for daytime dressing!", "Monsoon","CLG50-016.jpg",30.00);
INSERT INTO products VALUES ("CLG50-017","One-Shoulder Sequin Dress Blue",5000,"Clothing","6-11 years","A pretty choice for parties, this asymmetric dress is created in pleated chiffon crepe with a silver sequin waistband. Fastens with a zip at the side. Fully lined.", "Monsoon","CLG50-017.jpg",38.00);
INSERT INTO products VALUES ("CLG50-018","Floral Print Playsuit Blue",5000,"Clothing","6-11 years","Bold colours and pretty prints will not only brighten up their wardrobe, but their days too! This floral playsuit is essential for comfy play-days, as it includes an artistic floral print with striped shoulder straps and a stretch waistband, all designed in light, floaty fabric.", "Monsoon","CLG50-018.jpg",20.00);
INSERT INTO products VALUES ("CLG50-019","Shirred Denim Dress Blue",5000,"Clothing","6-11 years","Something a little different! This charming piece is designed in lightweight denim with a contrasting dark and light blue wash. It has a shirred bodice, long sleeves and a floral-printed belt around the waist. Great with ankle boots!", "Monsoon","CLG50-019.jpg",30.00);
INSERT INTO products VALUES ("CLG50-020","One-Shoulder Playsuit in Recycled Viscose Black",5000,"Clothing","6-11 years","Keep her cool and comfy on her next beachy escape with this one-shoulder playsuit. In lightweight, recycled viscose, it features a tassel drawstring at the waist and zig-zag-stitched trims.", "Monsoon","CLG50-020.jpg",22.00);
INSERT INTO products VALUES ("CLG50-021","Lion Zip-Through Hoody Yellow",5000,"Clothing","6-11 years","They will be the coolest in town when they wrap-up in our Lion Zip-Through Hoody! With a dinosaur face embroidered on the hood and fabric spikes on the hood and sleeves, this little lion will be playing comfortably all day long.", "Monsoon","CLG50-021.jpg",22.00);
INSERT INTO products VALUES ("CLG50-022","Bear Print Sweatshirt Grey",5000,"Clothing","6-11 years","Add this charming jumper to his everyday edit. The soft sweatshirt fabric has a painterly bear design and the sleeves are long to help keep him warm on chilly days.", "Monsoon","CLG50-022.jpg",18.00);
INSERT INTO products VALUES ("CLG50-023","Tom Shirt and Shorts Set with Bow Tie Ivory",5000,"Clothing","6-11 years","He'll be all set for that summer wedding or event in this smart three-piece collection. Included is a linen-cotton shirt with a button-down point collar and button placket, and lightweight, knee-length shorts with front and rear pockets and a zip fly.", "Monsoon","CLG50-023.jpg",36.00);
INSERT INTO products VALUES ("CLG50-024","Mateo Shirt and Shorts Set with Dinosaur Bow Tie Green",5000,"Clothing","6-11 years","It includes a shirt with a button-down collar and button-through placket, and lightweight chino-style shorts with a hidden adjustable waist and button fastening. A bow tie with rip-tape fastening completes this cute look – it even features a subtle dinosaur print.", "Monsoon","CLG50-024.jpg",36.00);
INSERT INTO products VALUES ("CLG50-025","Jake Stripe Chenille Pom-Pom Hat Multi",5000,"Clothing","6-11 years","When chilly weather hits, our Jake hat will save the day! This cosy style is made from soft, chunky chenille fabric with an embroidered fox detail.", "Monsoon","CLG50-025.jpg",13.00);
INSERT INTO products VALUES ("CLG50-026","Glen Chunky Cable Knit Beanie Multi",5000,"Clothing","6-11 years","This chunky, colourful beanie hat is made from soft knitted fabric with a turn-up brim and pom-pom top.", "Monsoon","CLG50-026.jpg",6.50);

INSERT INTO products VALUES ("BKS51-011","Horrid Henry",5001,"Books","6-11 years","Horrid Henry is a modern-day rogue in the tradition of Dennis the Menace, Pippi Longstocking, Just William and My Naughty Little Sister.", "Francesca Simon","BKS51-011.jpg",3.50);
INSERT INTO products VALUES ("BKS51-012","The Enchanted Wood", 5001,"Books","6-11 years","When Joe, Beth and Frannie move into a new home, they discover a mysterious wood on their very doorstep. Soon, they discover that it's actually an Enchanted Wood, and home to a wonderful Faraway Tree.", "Enid Blyton","BKS51-012.jpg",2.00);
INSERT INTO products VALUES ("BKS51-013","The Worst Witch",5001,"Books","6-11 years","Mildred Hubble is a trainee at Miss Cackle's Academy for Witches, but she's making an awful mess of it. She keeps getting her spells wrong and crashing her broomstick. And when she turns Ethel, the teacher's pet into her worst enemy, chaos ensues...", "Jill Murphy","BKS51-013.jpg",6.00);
INSERT INTO products VALUES ("BKS51-014","The Milly-Molly-Mandy Storybook",5001,"Books","6-11 years","Milly-Molly-Mandy lives with her mother, father, uncle, aunt, grandmother and grandfather in a 'nice white cottage with a thatched roof'. In each of these twenty-one stories, she sets off on an adventure, sometimes with the help of 'little-friend-Susan' or neighbour Billy Blunt.", "Joyce Lankester Brisley","BKS51-014.jpg",3.10);
INSERT INTO products VALUES ("BKS51-015","Flour Babies",5001,"Books","6-11 years","When the annual school science fair comes round, Mr Cartwright's class don't get to work on the Soap Factory, the Maggot Farm or the Exploding Custard Tins. To their intense disgust they get the Flour Babies - sweet little six-pound bags of flour that must be cared for at all times.", "Anne Fine","BKS51-015.jpg",2.39);
INSERT INTO products VALUES ("BKS51-016","Journey to the River Sea",5001,"Books","6-11 years","It is 1910 and Maia, tragically orphaned at thirteen, has been sent from England to start a new life with distant relatives in Manaus, hundreds of miles up the Amazon.", "Eva Ibbotson","BKS51-016.jpg",5.00);
INSERT INTO products VALUES ("BKS51-017","The Hobbit", 5001,"Books","6-11 years","A home-loving hobbit who enjoys a quiet and contented life in his cosy hobbit hole and has no desire to travel afar.", "Jrr Tolkein","BKS51-017.jpg",5.00);
INSERT INTO products VALUES ("BKS51-018","Holes",5001,"Books","6-11 years","Stanley Yelnats' family has a history of bad luck, so he is not entirely surprised when a miscarriage of justice sends him to the Camp Green Lake Juvenile Detention Centre in the middle of the Texan desert", "Louis Sachar","BKS51-018.jpg",6.00);

INSERT INTO products VALUES ("TYS52-011","Gravity Maze Game",5002,"Toys","6-11 years","The Sea Wind and the waves begin to frolic. High Time for performing University and College players on a red Umzukehren boat or to the house to Schippern. Who helps and moving it upwards the other ships and large and small waves is cleverly one that achieved the red the safe harbour boat in time?", "Thinkfun","TYS52-011.jpg",38.00);
INSERT INTO products VALUES ("TYS52-012","Catchphrase Board Game",5002,"Toys","6-11 years","Say what you see Welcome to the hilarious new Catch Phrase board game. With its updated game-play and loads of brand new brain teasers you can enjoy the excitement of the all-new TV game show hosted by Stephen Mulhern.", "Goliath","TYS52-012.jpg",20.00);
INSERT INTO products VALUES ("TYS52-013","Beat The Parents",5002,"Toys","6-11 years","Beat the Parents brings kids together with their parents to go head-to-head in a fun-filled family trivia game. Prove who's the boss in the game where the adults answer questions about kids' stuff, and the kids answer questions their parents should really know.", "Spin Master Games","TYS52-013.jpg",14.00);
INSERT INTO products VALUES ("TYS52-014","In For A Penny",5002,"Toys","6-11 years","In the box you will find many of your TV favourites including Pump It Up, Check It Out, Whatever The Weather and the ever-popular Stopwatch Challenge! So, put your friends on the spot, grab the stopwatch and get ready for lots of laughter and fun!", "Big Sky Games","TYS52-014.jpg",26.00);
INSERT INTO products VALUES ("TYS52-015","Monopoly Classic Game",5002,"Toys","6-11 years","Select a favorite Monopoly token, place it on Go and roll the dice to own it all! In classic Monopoly gameplay it’s all about buying, selling and trading properties to win. The more properties a player owns, the more rent they can charge. Maybe spring for Park Place?", "Hasbro Gaming","TYS52-015.jpg",27.00);
INSERT INTO products VALUES ("TYS52-016","Scrabble Junior, Children Board Game",5002,"Toys","6-11 years","What a great way for kids to play a favorite word game. Kid-sized words and colourful pictures make it fun to match letter tiles to words on the grid. Players collect scoring chips for completing words. When all of the tiles have been placed on the board, the player with the most chips wins.", "Mattel Games","TYS52-016.jpg",17.00);
INSERT INTO products VALUES ("TYS52-017","Frustration Game",5002,"Toys","6-11 years","The Slam-Tastic chasing game that drives you mad. If you're lucky, you can gain the powers of the Genie to protect your characters from being sent home. Classic Frustration with whacking feature and frustrated characters.", "Hasbro","TYS52-017.jpg",17.00);
INSERT INTO products VALUES ("TYS52-018","Tenable",5002,"Toys","6-11 years","Based on ITV's Top 10 quiz Tenable, this board game brings you a fun and challenging adaptation of the TV show featuring questions and gameplay. Can you find ten of everything and anything as you climb the scoring ladder to success and ultimately win the game?", "Asmodée","TYS52-018.jpg",23.00);

INSERT INTO products VALUES ("FS53-011","The Lego Movie 2",5003,"Film DVDs","6-11 years","The LEGO Movie 2 reunites the heroes of Bricksburg in an all new action-packed adventure to save their beloved city.", "Mike Mitchell","FS53-011.jpg",5.00);
INSERT INTO products VALUES ("FS53-012","Elf",5003,"Film DVDs","6-11 years","Once upon a time, an orphan baby crawled into Santa's bag and was taken to the North Pole. Determined to find a place where he belongs, Buddy searches for his real dad – in New York!", "Jon Favreau","FS53-012.jpg",4.00);
INSERT INTO products VALUES ("FS53-013","Jurassic World: Fallen Kingdom",5003,"Film DVDs","6-11 years","When the island's dormant volcano begins roaring to life, Owen and Claire mount a campaign to rescue the remaining dinosaurs from this extinction-level event.", "J. A. Bayona","FS53-013.jpg",5.00);
INSERT INTO products VALUES ("FS53-014","Godzilla: King of the Monsters",5003,"Film DVDs","6-11 years","The new story follows the heroic efforts of the crypto-zoological agency Monarch as its members face off against a battery of god-sized monsters, including the mighty Godzilla, who collides with Mothra, Rodan, and his ultimate nemesis", "Michael Dougherty","FS53-014.jpg",6.00);
INSERT INTO products VALUES ("FS53-015","Men in Black International",5003,"Film DVDs","6-11 years","The Men in Black have expanded to cover the globe, but so have the scum of the universe.","F. Gary Gray","FS53-015.jpg",6.00);
INSERT INTO products VALUES ("FS53-016","Marvel's Avengers:Endgame",5003,"Film DVDs","6-11 years","The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one final stand in Marvel Studios' grand conclusion to twenty-two films, Avengers: Endgame.", "Marvel","FS53-016.jpg",7.00);
INSERT INTO products VALUES ("FS53-017","Black Panther",5003,"Film DVDs","6-11 years","After tragedy forces young Prince T'Challa to assume Wakanda's throne, he is faced with the ultimate test, putting the fate of his country and the entire world at risk.","Marvel","FS53-017.jpg",7.00);
INSERT INTO products VALUES ("FS53-018","Game of Thrones: Season 7",5003,"Film DVDs","6-11 years","Game of Thrones : The Complete Seventh Season also comes with 3 expansive bonus feaures, which help bring the world of Game of Thrones to life through Art Department behind-the-scenes content and Audio Commentaries.", "David Benioff, Alan Taylor","FS53-018.jpg",15.00);

INSERT INTO products VALUES ("GS54-011","Just Dance Disney Party 2",5004,"Games","6-11 years","Just Dance and Disney are back together, bringing the greatest dance game for the whole family with music from the hottest Disney Channel shows, in Just Dance: Disney Party 2. Dance like the stars from the most popular Disney Channel shows and movies. ", "Nintendo Wii","GS54-011.jpg",32.00);
INSERT INTO products VALUES ("GS54-012","The Cube",5004,"Games","6-11 years","Have you got what it takes to beat The Cube? If you’re a fan of the TV show, you know that the aim of the game is to win seven consecutive challenges chosen by The Cube in order to walk away with the maximum prize of £250,000.", "Nintendo Wii","GS54-012.jpg",60.00);
INSERT INTO products VALUES ("GS54-013","Donkey Kong Country Returns",5004,"Games","6-11 years","The king of swing is back and he's hungry for adventure (and bananas)! A new 2D platformer in the mould of New Super Mario Bros. Wii, Donkey Kong and Diddy Kong have to battle the evil Tikis in order to restore peace to DK Island.", "Nintendo Wii","GS54-013.jpg",43.00);
INSERT INTO products VALUES ("GS54-014","Mario Kart",5004,"Games","6-11 years","Make sure you put your foot down and go, go, go in the next installment in the iconic Mario Kart series. Mario and his much-loved pals are planning to make a spectacular return in this definitive version of Mario Kart, providing the most action-packed racing fun in the series on your Nintendo Wii", "Nintendo Wii","GS54-014.jpg",42.00);
INSERT INTO products VALUES ("GS54-015","Mario Party 9",5004,"Games","6-11 years","Mario Party 9 takes the madcap family fun from Mario Kart Wii and blends it with the thrills-aplenty mini-game variety of Wii Party to create a fun-filled experience for up to four players.", "Nintendo Wii","GS54-015.jpg",47.00);
INSERT INTO products VALUES ("GS54-016","Sports Resort",5004,"Games","6-11 years","Sports Resort Wii Hardware Platform: Nintendo Wii Operating System: Nintendo Wii", "Nintendo Wii","GS54-016.jpg",18.00);
INSERT INTO products VALUES ("GS54-017","Wii Party",5004,"Games","6-11 years","Board Game Island (1-4 players) - players take it in turns to roll the dice and advance along a single route towards the summit of the mountain.", "Nintendo Wii","GS54-017.jpg",32.00);
INSERT INTO products VALUES ("GS54-018","Carnival: Fun Fair Games",5004,"Games","6-11 years","Step right up! All the fun and excitement of your favourite Carnival Games is coming to Wii this autumn. It's the perfect multi-player game for friends and family alike.", "Nintendo Wii","GS54-018.jpg",28.00);
INSERT INTO products VALUES ("GS54-019","Super Mario 3D Land",5004,"Games","6-11 years","Presenting a 3D Mario game that plays like a 2D Mario game! Players will experience an exhilarating new sense of depth, distance and speed while running, jumping and stomping on enemies throughout the levels.", "Nintendo 3DS","GS54-019.jpg",16.00);
INSERT INTO products VALUES ("GS54-020","3D Game Collection: 55-in-1",5004,"Games","6-11 years","55 times the fun for all the family! Collect the cups and be crowned the champion! 55 games in one - loads of fun and plenty of new challenges! Discover a huge variety of games set in three atmospheric themes, space, an idyllic meadow, and a pirate bay.", "Nintendo 3DS","GS54-020.jpg",11.00);
INSERT INTO products VALUES ("GS54-021","Luigi's Mansion 2",5004,"Games","6-11 years","Join Luigi, the lean, green ghost-catching machine in an eerie new 3D adventure!", "Nintendo 3DS","GS54-021.jpg",16.00);
INSERT INTO products VALUES ("GS54-022","Nintendogs + Cats (Golden Retriever + New Friends)",5004,"Games","6-11 years","Nintendogs puppies are back in the palm of your hand on the Nintendo 3DS family;For the first time, kittens join the fun!", "Nintendo 3DS","GS54-022.jpg",21.00);
INSERT INTO products VALUES ("GS54-023","The Legend of Zelda: Ocarina of Time",5004,"Games","6-11 years","Link sets off on a legendary journey through time to stop Ganondorf, the Gerudo King of Thieves who is seeking the Triforce: a holy relic that gives its holder ultimate power.", "Nintendo 3DS","GS54-023.jpg",16.00);
INSERT INTO products VALUES ("GS54-024","Nintendogs + Cats (French Bulldog + New Friends)",5004,"Games","6-11 years","Nintendogs puppies are back in the palm of your hand on the Nintendo 3DS family;For the first time, kittens join the fun!", "Nintendo 3DS","GS54-024.jpg",20.00);
INSERT INTO products VALUES ("GS54-025","Rayman 3D",5004,"Games","6-11 years","Rayman 3D is an adaption of the Dreamcast version of Rayman 2 which is regarded as the best of all Rayman games.One, Raymans invite the player Rayman 3D to discover unbelievable adventures in a more intensive and optimized game experience newly.", "Nintendo 3DS","GS54-025.jpg",20.00);
INSERT INTO products VALUES ("GS54-026","Mario Party: Star Rush",5004,"Games","6-11 years","Team up with Mario, Peach, Donkey Kong, and more in the most perfectly portable Mario Party game to date.", "Nintendo 3DS","GS54-026.jpg",13.00);
INSERT INTO products VALUES ("GS54-027","51 Worldwide Games",5004,"Games","6-11 years","51 worldwide games.", "Nintendo Switch","GS54-027.jpg",28.00);
INSERT INTO products VALUES ("GS54-028","Minecraft",5004,"Games","6-11 years","Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles.", "Nintendo Switch","GS54-028.jpg",20.00);
INSERT INTO products VALUES ("GS54-029","Just Dance 2020",5004,"Games","6-11 years","Gather your friends and family and Just Dance like nobody’s watching with Just Dance 2020!", "Nintendo Switch","GS54-029.jpg",30.00);
INSERT INTO products VALUES ("GS54-030","Mario and Sonic at the Olympic Games Tokyo 2020",5004,"Games","6-11 years","Join Mario, Sonic and friends for their greatest adventure yet in Mario & Sonic at the Olympic Games Tokyo 2020 for Nintendo Switch!", "Nintendo Switch","GS54-030.jpg",50.00);
INSERT INTO products VALUES ("GS54-031","Jumanji: The Video Game",5004,"Games","6-11 years","Unite in adventure and laughter in the action-packed game of Jumanji, as you try to survive the ultimate challenge for those seeking to leave their world behind!", "Nintendo Switch","GS54-031.jpg",21.00);
INSERT INTO products VALUES ("GS54-032","Animal Crossing New Horizons",5004,"Games","6-11 years","Customise your character and home, and decorate the landscape (with furniture, if you like!), as you create your very own island paradise. Experience a robust new crafting system – collect materials to construct everything from furniture to tools!", "Nintendo Switch","GS54-032.jpg",35.00);
INSERT INTO products VALUES ("GS54-033","Lego Harry Potter Collection", 5004,"Games","6-11 years","Allowing fans to experience Harry's first four years at Hogwarts School of Witchcraft and Wizardry in full LEGO form.", "Nintendo Switch","GS54-033.jpg",22.00);
INSERT INTO products VALUES ("GS54-034","Human: Fall Flat - Anniversary Edition",5004,"Games","6-11 years","Human: Fall Flat is a light-hearted, hilarious platformer set in a world of floating dreamscapes.", "Nintendo Switch","GS54-034.jpg",29.00);

INSERT INTO products VALUES ("CLG60-011","2-piece cotton set",6000,"Clothing","12-14 years","Set with a top and pair of leggings in soft, organic cotton jersey. Top with dropped shoulders, long sleeves, ribbing around the neckline and cuffs, and ties at the hem. Leggings with covered elastication at the waist.", "H&M","CLG60-011.jpg",15.00);
INSERT INTO products VALUES ("CLG60-012","Faux fur-lined biker jacket",6000,"Clothing","12-14 years","Biker jacket in imitation suede with a soft faux fur lining. Notch lapels, a diagonal zip down the front and zipped side pockets. The pocket linings are made from recycled polyester.", "H&M","CLG60-012.jpg",35.00);
INSERT INTO products VALUES ("CLG60-013","Printed hoodie",6000,"Clothing","12-14 years","Slightly oversized hoodie in printed sweatshirt fabric with a soft brushed inside. Double-layered hood with a decorative drawstring, a kangaroo pocket, low dropped shoulders and long sleeves. Ribbing at the cuffs and hem.", "H&M","CLG60-013.jpg",16.00);
INSERT INTO products VALUES ("CLG60-014","Embroidered-detail hoodie",6000,"Clothing","12-14 years","Prepare yourself for outstanding grades in every subject with this long-sleeved, block-coloured top in soft sweatshirt fabric with the Hogwarts logo embroidered on the front in shimmering gold-coloured thread.", "H&M","CLG60-014.jpg",18.00);
INSERT INTO products VALUES ("CLG60-015","Foil star disco dress pink",6000,"Clothing","12-14 years","She can dance until her heart desires in this sparkly disco dress. It features a soft, jersey bodice with frill sleeves and sequins, flowing down into a tulle skirt with foil polka dots.", "Monsoon","CLG60-015.jpg",34.00);
INSERT INTO products VALUES ("CLG60-016","Bessie floral vest and shorts set blue",6000,"Clothing","12-14 years","Injecting colour and print into an outfit couldn’t get any easier! Introducing this two-piece vest and shorts set, designed in lightweight fabric with a floral design. Includes a peplum vest and long shorts.", "Monsoon","CLG60-016.jpg",18.00);
INSERT INTO products VALUES ("CLG60-017","Star hoody and leggings set blue",6000,"Clothing","12-14 years","They'll be reaching for the stars in this sweet set, featuring a sparkly sequin star hoodie and plain full-length leggings. Designed in soft, breathable jersey, this set is perfect all-year-round, an essential for their casual collection!", "Monsoon","CLG60-017.jpg",26.00);
INSERT INTO products VALUES ("CLG60-018","Ditsy floral shirred bikini set green",6000,"Clothing","12-14 years","Whether they’re playing in the pool or building sandcastles, this bikini set offers a shirred ditsy detail to keep them looking cute in the sun.", "Monsoon","CLG60-018.jpg",15.00);
INSERT INTO products VALUES ("CLG60-019","Chevron foil frill swimsuit blue",6000,"Clothing","12-14 years","They can stay cute and comfy in the sun with this fun swimsuit. Includes a foil chevron design with a racer back and a frill layer at the top.", "Monsoon","CLG60-019.jpg",17.00);
INSERT INTO products VALUES ("CLG60-020","Animal print bikini set orange",6000,"Clothing","12-14 years","Whether strolling along the beach or partying at the pool, this animal-printed bikini set will have her feeling fabulous. Both the triangle-cut top and classic brief bottoms feature a striped, stretchy trim for a touch of sporty-chic.", "Monsoon","CLG60-020.jpg",17.00);
INSERT INTO products VALUES ("CLG60-021","Boys' Monogram T-Shirt in Black",6000,"Clothing","12-14 years","Boys' monogram t-shirt from Calvin Klein comes in plain black, but it's anything but plain. Rocking urban and trendy vibes, this item was made with 100% organic cotton.", "Calvin Klein","CLG60-021.jpg",31.00);
INSERT INTO products VALUES ("CLG60-022","Trompe-L'Oeil Flamingo Cotton T-Shirt in White",6000,"Clothing","12-14 years","Perfect for everyday styling, Eco-friendly and Stretch Cotton", "Stella Mccartney","CLG60-022.jpg",64.00);
INSERT INTO products VALUES ("CLG60-023","Leopard Print Jacket in Golden Orange",6000,"Clothing","12-14 years","Perfect for everyday styling and Zip-up", "Stella Mccartney","CLG60-023.jpg",159.00);
INSERT INTO products VALUES ("CLG60-024","Logo Hoodie in Grey",6000,"Clothing","12-14 years","Perfect for everyday styling, Hooded and Stretch Cotton", "Boss","CLG60-024.jpg",98.00);
INSERT INTO products VALUES ("CLG60-025","Flamingo Print Swimsuit Set in Blue",6000,"Clothing","12-14 years","Made for the beach and Eco-friendly", "Stella Mccartney","CLG60-025.jpg",114.00);
INSERT INTO products VALUES ("CLG60-026","Appliqued Logo T-Shirt in Yellow",6000,"Clothing","12-14 years","Perfect for everyday styling, perfect for active kids and stretch cotton", "Fendi","CLG60-026.jpg",159.00);

INSERT INTO products VALUES ("BKS61-011","The Boy in the Striped Pyjamas",6001,"Books","12-14 years","Nine-year-old Bruno knows nothing of the Final Solution and the Holocaust. He is oblivious to the appalling cruelties being inflicted on the people of Europe by his country.", "John Boyne","BKS61-011.jpg",14.00);
INSERT INTO products VALUES ("BKS61-012","The Hunger Games",6001,"Books","12-14 years","This harsh rule culminates in the annual Hunger Games - from each District, one female and one male Tribute are forcibly selected for a terrifying reality TV game-show in which contestants literally fight to the death.", "Suzanne Colins","BKS61-012.jpg",3.29);
INSERT INTO products VALUES ("BKS61-013","Forever",6001,"Books","12-14 years","Seventeen-year-old Katherine meets Michael at a party. The two of them like each other immediately, and soon fall in love - but are they ready to take their relationship to the next level?", "Judy Blume","BKS61-013.jpg",5.49);
INSERT INTO products VALUES ("BKS61-014","The Ruby in the Smoke",6001,"Books","12-14 years","Soon after Sally Lockhart's father drowns at sea, she receives an anonymous letter. The dire warning it contains makes a man die of fear at her feet.", "Philip Pullman","BKS61-014.jpg",8.00);
INSERT INTO products VALUES ("BKS61-015","Watership Down",6001,"Books","12-14 years","Young rabbit Fiver is convinced that a great evil is about to befall the warren where he lives - but no one will listen to him. ", "Richard Adams","BKS61-015.jpg",8.00);
INSERT INTO products VALUES ("BKS61-016","I Capture the Castle",6001,"Books","12-14 years","Cassandra's journal records her fadingly glamorous stepmother, her beautiful, wistful older sister and the man to whom they all owe their isolation and poverty - Father. The author of one novel, and a minor cause celebre, he has writer's block and is determined to drag his family down with him.", " Dodie Smith","BKS61-016.jpg",4.00);
INSERT INTO products VALUES ("BKS61-017","Looking for JJ",6001,"Books","12-14 years","A gripping and emotionally searing novel 'Looking for JJ' explores the circumstances and motives behind the murder of a child - by her friend. Three children walked away from the edge of town one day - but only two of them came back ...", "Anne Cassidy","BKS61-017.jpg",2.00);
INSERT INTO products VALUES ("BKS61-018","Noughts and Crosses",6001,"Books","12-14 years","Sephy is a Cross - a member of the dark-skinned ruling class. Callum is a nought - a 'colourless' member of the underclass who were once slaves to the Crosses.", "Malorie Blackman","BKS61-018.jpg",10.00);

INSERT INTO products VALUES ("FS62-011","Harry Potter: The Complete DVD Box Set",6002,"Film DVDs","12-14 years","Experience the Magical Adventure! Follow the young wizard Harry Potter and his friends Ron Weasley and Hermoine Granger through their adventures at Hogwarts school of Witchcraft and Wizardry, in the complete series boxset!", "David Yates","FS62-011.jpg",35.00);
INSERT INTO products VALUES ("FS62-012","Little Women",6002,"Film DVDs","12-14 years","In Gerwig's take, the beloved story of the March sisters – four young women each determined to live life on their own terms - is both timeless and timely.", "Greta Gerwig","FS62-012.jpg",10.00);
INSERT INTO products VALUES ("FS62-013","Les Miserables: The Staged Concert",6002,"Film DVDs","12-14 years","Les Miserables is undisputedly one of the world's most popular musicals.", "Nick Morris","FS62-013.jpg",13.00);
INSERT INTO products VALUES ("FS62-014","All Creatures Great & Small",6002,"Film DVDs","12-14 years","All six episodes of the miniseries set in the 1930s and based on the popular books by James Herriot.", "Anna Madeley, Diana Rigg, Nigel Havers, Samuel West","FS62-014.jpg",18.00);
INSERT INTO products VALUES ("FS62-015","Tenet",6002,"Film DVDs","12-14 years","Fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.", "Christopher Nolan","FS62-015.jpg",20.00);
INSERT INTO products VALUES ("FS62-016","A Christmas Gift from Bob",6002,"Film DVDs","12-14 years","In 'A Christmas Gift From Bob', James looks back at the last Christmas he and Bob spent scraping a living on the streets and how Bob helped him through one of the toughest times, providing strength, friendship and inspiration.", "Charles Martin Smith","FS62-016.jpg",12.00);
INSERT INTO products VALUES ("FS62-017","Yesterday",6002,"Film DVDs","12-14 years","Jack Malik was just another struggling songwriter...but that was yesterday. After a mysterious blackout, Jack (Himesh Patel) discovers he is the only person on earth who remembers The Beatles!", "Danny Boyle","FS62-017.jpg",6.00);
INSERT INTO products VALUES ("FS62-018","The Twilight Saga: The Complete Collection",6002,"Film DVDs","12-14 years","Collection of all five films of the teen vampire saga based on the bestselling novels by Stephenie Meyer. In 'Twilight' (2008), Bella Swan (Kristen Stewart) moves to the small town of Forks to live with her father and meets the mysterious and beautiful Edward Cullen (Robert Pattinson).", "Bill Condon, Chris Weitz, David Slade, Catherine Hardwicke","FS62-018.jpg",20.00);

INSERT INTO products VALUES ("GS63-011","Sega MegaDrive Classics",6003,"Games","12-14 years","Sega's collection of Mega Drive & Genesis classics comes to a new generation of consoles with 53 titles across all genres from all-time classics like Sonic and Streets of Rage 2 to deep RPGs such as the Phantasy Star series.", "Playstation 4","GS63-011.jpg",18.00);
INSERT INTO products VALUES ("GS63-012","Horizon: Zero Dawn", 6003,"Games","12-14 years","Take on the role of fearless hunter Aloy and discover how to use the hostile environment around you in a fascinating, emotional journey to solve the riddle of why you were cast out by your tribe and explore the deepest and darkest mysteries of the ancient past.", "Playstation 4","GS63-012.jpg",16.00);
INSERT INTO products VALUES ("GS63-013","Stardew Valley", 6003,"Games","12-14 years","Stardew Valley is an open-ended country-life RPG.", "Playstation 4","GS63-013.jpg",15.00);
INSERT INTO products VALUES ("GS63-014","What Remains of Edith Finch",6003,"Games","12-14 years","The game centers on the character of Edith, a member of the Finch family, afflicted by a perceived curse that causes all but one member of each generation to die in unusual ways.", "Playstation 4","GS63-014.jpg",16.00);
INSERT INTO products VALUES ("GS63-015","Fortnite Darkfire Bundle", 6003,"Games","12-14 years","Embrace your dark side, heat up the battle and slip into the shadows with the Fortnite dark fire bundle - Our biggest cosmetic content Pack ever with 13 new items, a GBP70 value.", "Playstation 4","GS63-015.jpg",50.00);
INSERT INTO products VALUES ("GS63-016","Star Wars: Squadrons",6003,"Games","12-14 years","All Wings Report In – Plan skirmishes with your squadron in the briefing room before taking off to the evolving battlefields across the galaxy.", "Playstation 4","GS63-016.jpg",28.00);
INSERT INTO products VALUES ("GS63-017","Max The Curse of Brotherhood",6003,"Games","12-14 years", "Max: The Curse of Brotherhood is a cinematic adventure filled with action-packed platforming and creative puzzle-solving. Armed with only a Magic Marker, Max must confront evil at every turn in a hostile and fantastical world in order to save his kid brother, Felix. Join Max on his great adventure!", "Playstation 4","GS63-017.jpg",12.00);
INSERT INTO products VALUES ("GS63-018","The Last Guardian",6003,"Games","12-14 years","An Unlikely Companion: discover a fantastical beast named Trico who will act as companion and protector, forging a bond that drives an emotional and harrowing journey.", "Playstation 4","GS63-018.jpg",21.00);
INSERT INTO products VALUES ("GS63-019","Immortals Fenyx Rising Limited Edition",6003,"Games","12-14 years","Immortals Fenyx Rising brings grand mythological adventure to life. Play as Fenyx, a new winged demigod on a quest to save the Greek gods and their home from a dark curse.", "Playstation 5","GS63-019.jpg",52.00);
INSERT INTO products VALUES ("GS63-020","Fortnite: The Last Laugh Bundle",6003,"Games","12-14 years","Genius comes in many forms - whether you're dangerously funny, creating havoc with wild plants, or flooding the island with your best intentions; it often comes along with a companion: madness.", "Playstation 5","GS63-020.jpg",25.00);
INSERT INTO products VALUES ("GS63-021","The Pathless",6003,"Games","12-14 years","Become the Hunter, a master of Archery who travels to a mystical island to dispel a Curse of darkness that grips the world.", "Playstation 5","GS63-021.jpg",45.00);
INSERT INTO products VALUES ("GS63-022","Riders Republic: Gold Edition",6003,"Games","12-14 years","Jump into the RIDERS REPUBLIC™ massive multiplayer playground! Meet and compete with other players, ride hard with an exciting range of activities such as bike, ski, snowboard, wingsuit and rocket wingsuit.", "Playstation 5","GS63-022.jpg",85.00);
INSERT INTO products VALUES ("GS63-023","Immortals Fenyx Rising Gold",6003,"Games","12-14 years","Take on mythological beasts, master the legendary powers of the gods and defeat Typhon, the deadliest Titan in Greek mythology, in an epic fight for the ages.", "Playstation 5","GS63-023.jpg",85.00);
INSERT INTO products VALUES ("GS63-024","DIRT 5",6003,"Games","12-14 years","Whilst respecting the heritage and retaining the DNA of the franchise, DIRT 5 writes a new chapter in the legacy of DIRT – bolder and braver than ever before.", "Playstation 5","GS63-024.jpg",35.00);
INSERT INTO products VALUES ("GS63-025","Destruction AllStars",6003,"Games","12-14 years","The roar of the crowd… the growl of the engines… the crunch of metal… stars and cars collide in the global phenomenon Destruction AllStars.", "Playstation 5","GS63-025.jpg",70.00);
INSERT INTO products VALUES ("GS63-026","Tesla vs Lovecraft",6003,"Games","12-14 years","Tesla vs Lovecraft Game of the Year Edition takes advantage of the blazing fast next generation hardware to deliver even smoother gameplay, and includes For Science! expansion!", "Playstation 5","GS63-026.jpg",15.00);

INSERT INTO products VALUES ("CLG70-011","Stripe Logo Graphic Tee",7000,"Clothing","15-18 years","A loose, boxy tee in soft, cotton-blend fabric, featuring a crew neckline, short sleeves, logo across chest and sporty sleeve stripes Easy Fit.", "Hollister","CLG70-011.jpg",11.40);
INSERT INTO products VALUES ("CLG70-012","Applique Logo Hoodie",7000,"Clothing","15-18 years","A comfortable pullover hoodie in soft fleece fabric with logo graphic applique and embroidery, pouch pocket, ribbed cuffs and ribbed hem. Easy Fit.", "Hollister","CLG70-012.jpg",45.00);
INSERT INTO products VALUES ("CLG70-013","Full-Zip Sherpa Hoodie",7000,"Clothing","15-18 years","A cozy full-zip hoodie in plush sherpa fabric, featuring a hood with drawstrings and pouch pockets. Wear it over everything. Easy Fit.", "Hollister","CLG70-013.jpg",34.30);
INSERT INTO products VALUES ("CLG70-014","Oversized Plaid Shirt",7000,"Clothing","15-18 years","A loose, drapey shirt in a goes-with-everything plaid pattern, featuring a button-front closure and pocket at left chest. Oversized Fit.", "Hollister","CLG70-014.jpg",18.00);
INSERT INTO products VALUES ("CLG70-015","High-Rise Jean Leggings",7000,"Clothing","15-18 years","Fits like a legging. Looks like a jean. Featuring Advanced Stretch denim, light fading and whiskering, non-functional pockets and icon embroidered at back right pocket.", "Hollister","CLG70-015.jpg",42.00);
INSERT INTO products VALUES ("CLG70-016","Ultra High-Rise Fleece Leggings",7000,"Clothing","15-18 years","Cozy leggings in our soft fleece fabric, featuring an ultra high-rise drawstring waistband, logo embroidery and ribbed cuffs.", "Hollister","CLG70-016.jpg",33.00);
INSERT INTO products VALUES ("CLG70-017","Ultra High-Rise Ruffle-Hem Wrap Mini Skirt",7000,"Clothing","15-18 years","A flattering, feminine mini skirt in floral woven fabric with an ultra high-rise, wrap-front design with side ties and ruffle hem. Dress it up with a sweater or dress it down with a graphic tee.", "Hollister","CLG70-017.jpg",17.40);
INSERT INTO products VALUES ("CLG70-018","Ultra High-Rise Plaid Mom Pants",7000,"Clothing","15-18 years","Our mom pant is a looser, throwback fit that's relaxed through the thigh and tapered from knee to ankle. Made in stretch plaid fabric with a flattering ultra high-rise and matching belt.", "Hollister","CLG70-018.jpg",35.00);
INSERT INTO products VALUES ("CLG70-019","Mesh Square-Neck Mini Dress",7000,"Clothing","15-18 years","A flattering, feminine mini dress in floral mesh fabric. Designed with a square neckline, short puff sleeves with cinched edges, smocked bodice that stretches to fit your curves and loose bottom that floats away from the body.", "Hollister","CLG70-019.jpg",39.00);
INSERT INTO products VALUES ("CLG70-020","Mesh Mini Wrap Dress",7000,"Clothing","15-18 years","A flowy, feminine dress in soft mesh fabric with floral print, featuring a flattering wrap-front design that ties at the waist with a hook-and-eye closure at the neckline.", "Hollister","CLG70-020.jpg",39.00);
INSERT INTO products VALUES ("CLG70-021","Wrap-Front Puff-Sleeve Jumpsuit",7000,"Clothing","15-18 years","A drapey jumpsuit in woven fabric with floral print. Designed with feminine puff sleeves, v neckline, wrap-front detail with straps that tie in back and a loose leg that hits at the ankle.", "Hollister","CLG70-021.jpg",49.00);
INSERT INTO products VALUES ("CLG70-022","Lace-Up Tiered Mini Dress",7000,"Clothing","15-18 years","A loose, flowy mini dress in soft, woven fabric, featuring a feminine tiered skirt and lace-up back design. Made with adjustable shoulder straps and scoop neckline.", "Hollister","CLG70-022.jpg",29.00);
INSERT INTO products VALUES ("CLG70-023","Plaid Flannel Shirt",7000,"Clothing","15-18 years","A comfortable, button-down shirt in soft flannel fabric with allover plaid pattern, featuring a pocket and icon at left chest and curved hem. Slim Fit.", "Hollister","CLG70-023.jpg",17.40);
INSERT INTO products VALUES ("CLG70-024","Sherpa-Lined Flannel Shirt Jacket",7000,"Clothing","15-18 years","A warm, cozy shirt jacket designed with soft flannel fabric on the outside, plush sherpa lining through the body, and thermal waffle-knit lining in the sleeves. Featuring allover plaid print, a sherpa collar and chest utility pockets.", "Hollister","CLG70-024.jpg",65);
INSERT INTO products VALUES ("CLG70-025","Print Logo Hoodie",7000,"Clothing","15-18 years","A comfortable pullover in soft fleece fabric, featuring colorful ombré print graphics, a hood with drawstrings, pouch pocket, ribbed cuffs and ribbed hem. Slim Fit.", "Hollister","CLG70-025.jpg",27.30);
INSERT INTO products VALUES ("CLG70-026","Embroidered Logo Graphic Tee",7000,"Clothing","15-18 years","A soft cotton tee designed with logo graphic applique and embroidery, a crew neckline and long sleeves.", "Hollister","CLG70-026.jpg",22.00);
INSERT INTO products VALUES ("CLG70-027","Skinny Jeans",7000,"Clothing","15-18 years","Designed with a skinny fit through the hip and thigh with a 13' leg opening. Featuring light wash denim made with Hollister Epic Flex stretch, fading, five-pocket styling and iconic back pocket embroidery.", "Hollister","CLG70-027.jpg",39.00);
INSERT INTO products VALUES ("CLG70-028","Textured Sleep Jogger Pants",7000,"Clothing","15-18 years","Comfortable sleep joggers you'll want to stay home all day in, featuring a lighterweight knit fabric with cozy texture, a drawstring waistband, side pockets and banded cuffs.", "Hollister","CLG70-028.jpg",29.00);
INSERT INTO products VALUES ("CLG70-029","Applique Logo Sweatpants",7000,"Clothing","15-18 years","Soft fleece sweatpants in our classic-comfortable fit with a slimmed-down straight leg, featuring a drawstring waistband, side pockets and logo graphic applique and embroidery.", "Hollister","CLG70-029.jpg",35.00);
INSERT INTO products VALUES ("CLG70-030","Skinny Fleece Jogger Pants",7000,"Clothing","15-18 years","Our comfortable skinny joggers designed in soft fleece fabric, featuring a drawstring waistband, printed icon at left hip, side pockets and ribbed cuffs.", "Hollister","CLG70-030.jpg",35.00);
INSERT INTO products VALUES ("CLG70-031","Moto Hooded Denim Jacket",7000,"Clothing","15-18 years","A wear-everywhere denim jacket updated with soft fleece fabric at the sleeves and hood for extra comfort. Made with light wash stretch denim, moto stitching at the sleeves and logo embroidery at the hood.", "Hollister","CLG70-031.jpg",48.30);
INSERT INTO products VALUES ("CLG70-032","Sherpa-Lined Denim Trucker Jacket",7000,"Clothing","15-18 years","Your favorite denim jacket updated with cozy sherpa lining for extra warmth and comfort. Featuring stretch denim fabric in a light wash, chest pockets and side welt pockets.", "Hollister","CLG70-032.jpg",39.50);
INSERT INTO products VALUES ("CLG70-033","Flash Reactive Fleece-Lined Jacket",7000,"Clothing","15-18 years","A sporty, street-inspired jacket made with water and wind resistant fabric and soft fleece lining. It's designed with flash reactive technology–take a photo with flash for the big reveal!", "Hollister","CLG70-033.jpg",69.00);
INSERT INTO products VALUES ("CLG70-034","Faux-Fur-Lined Military Parka",7000,"Clothing","15-18 years","Sleek black fabric, zip pocket at left arm and side cargo pockets (with top AND side entry) give this coat a luxe utility feel, while cozy faux-fur lining and recycled fill keeps you warm for everyday wear.", "Hollister","CLG70-034.jpg",71.40);

INSERT INTO products VALUES ("BKS71-011","Midnight Sun",7001,"Books","15-18 years","In Midnight Sun, Stephenie Meyer transports us back to a world that has captivated millions of readers and brings us an epic novel about the profound pleasures and devastating consequences of immortal love.", "Stephenie Meyer","BKS71-011.jpg",15.00);
INSERT INTO products VALUES ("BKS71-012","One Of Us Is Lying",7001,"Books","15-18 years","Five students go to detention. Only four leave alive. Yale hopeful Bronwyn has never publicly broken a rule. Sports star Cooper only knows what he's doing in the baseball diamond.", "Karen M. McManus","BKS71-012.jpg",7.00);
INSERT INTO products VALUES ("BKS71-013","The Girl of Ink & Stars",7001,"Books","15-18 years","When Isabella's friend disappears, she volunteers to guide the search party.", "Kiran Millwood Hargrave","BKS71-013.jpg",6.00);
INSERT INTO products VALUES ("BKS71-014","What If?",7001,"Books","15-18 years","Science's most intriguing questions answered by the web's favourite writer, the genius behind xkcd.com.Munroe's hilarious and compelling answers explain everything from the odds of meeting your one true soulmate to how many humans a rampaging T-Rex would need to eat a day.", "Randall Munroe","BKS71-014.jpg",9.00);
INSERT INTO products VALUES ("BKS71-015","The Hate U Give",7001,"Books","15-18 years","Sixteen-year-old Starr Carter moves between two worlds: the poor neighborhood where she lives and the fancy suburban prep school she attends. ", "Angie Thomas","BKS71-015.jpg",7.00);
INSERT INTO products VALUES ("BKS71-016","Cinderella Is Dead",7001,"Books","15-18 years","Sophia doesn't want to be chosen - she's in love with her best friend, Erin, and hates the idea of being traded like cattle. ", "Kalynn Bayron","BKS71-016.jpg",8.00);
INSERT INTO products VALUES ("BKS71-017","Goodnight Mister Tom",7001,"Books","15-18 years","As time goes by Tom begins to worry when Willie doesn't answer his letters, so he goes to London to find him, and there makes a terrible discovery.", "Michelle Magorian","BKS71-017.jpg",8.00);
INSERT INTO products VALUES ("BKS71-018","Black and British",7001,"Books","15-18 years","A short, essential introduction to Black British history", "David Olusoga","BKS71-018.jpg",7.00);

INSERT INTO products VALUES ("FS72-011","The Crown: Season One",7002,"Film DVDs","15-18 years","All ten episodes from the first season of the biographical drama based on the life of Queen Elizabeth II. The story begins in 1947 as Elizabeth (Claire Foy) marries Prince Philip of Greece and Denmark (Matt Smith).","Jared Harris, Matt Smith, Jeremy Northam","FS72-011.jpg",10.00);
INSERT INTO products VALUES ("FS72-012","Bad Boys for Life",7002,"Film DVDs","15-18 years","As Mike and Marcus prepare to start taking things easy as age catches up with them, an old enemy threatens to destroy their peaceful descent into retirement.","Adil El Arbi, Bilall Fallah", "FS72-012.jpg",11.00);
INSERT INTO products VALUES ("FS72-013","1917",7002,"Film DVDs","15-18 years","In a race against time, they must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers-Blake's own brother among them.", "Sam Mendes","FS72-013.jpg",10.00);
INSERT INTO products VALUES ("FS72-014","Mrs Brown's Boys: Merry Mishaps",7002,"Film DVDs","15-18 years","Mrs. Brown and the family are up to their usual festive hi-jinks and are ready to jingle your baubles in two brand new hilarious seasonal specials! A Wonderful Mammy: It's Christmas in Finglas once again but it seems no-one in the Brown household has got the memo.", "Universal Pictures","FS72-014.jpg",15.00);
INSERT INTO products VALUES ("FS72-015","The Irishman - The Criterion Collection",7002,"Film DVDs","15-18 years","Martin Scorsese's cinematic mastery is on full display in this sweeping crime saga, which serves as an elegiac summation of his six-decade career.", "Martin Scorsese","FS72-015.jpg",15.00);
INSERT INTO products VALUES ("FS72-016","Arrow: The Complete Series",7002,"Film DVDs","15-18 years","All 170 episodes from all eight seasons of the US action drama based on the DC Comics hero Green Arrow. After being shipwrecked and stranded on an island for five years, millionaire playboy Oliver Queen (Stephen Amell) returns home to Starling City.", "Katie Cassidy, Stephen Amell, Willa Holland","FS72-016.jpg",80.00);
INSERT INTO products VALUES ("FS72-017","The Good Liar",7002,"Film DVDs","15-18 years","Bill Condon directs this US drama starring Ian McKellen and Helen Mirren. After meeting widow Betty McLeish (Mirren) online, elderly con artist Roy Courtnay (McKellen) resolves to take everything she has.", "Bill Condon","FS72-017.jpg",7.00);
INSERT INTO products VALUES ("FS72-018","Grey's Anatomy Season 15 Boxset",7002,"Film DVDs","15-18 years","Expect the unexpected, in 25 epsiodes, with new relationships, lost loves, hot new doctors and the kind of jaw-dropping twists only Grey's Anatomy can deliver.", "Kevin McKidd, Ellen Pompeo, Chandra Wilson, Jesse Williams","FS72-018.jpg",12.00);

INSERT INTO products VALUES ("GS73-011","Star Wars Battlefront 2",7003,"Games","15-18 years","Take on the role of your dreams – play as a trooper, pilot a starfighter, fight as your favourite Star Wars character, or forge a new path as an Elite Special Forces soldier through a gripping new Star Wars story.", "Xbox One","GS73-011.jpg",28.00);
INSERT INTO products VALUES ("GS73-012","Dark Pictures Anthology: Little Hope",7003,"Games","15-18 years","Trapped and isolated in the abandoned town of Little Hope, 4 college students and their Professor must escape the nightmarish visions that relentlessly pursue them through an impenetrable fog.", "Xbox One","GS73-012.jpg",25.00);
INSERT INTO products VALUES ("GS73-013","Far Cry New Dawn",7003,"Games","15-18 years","Set seventeen years after the events of Far Cry 5, civilization has risen from the ashes of a global nuclear catastrophe to find a world completely different to the one left behind.", "Xbox One","GS73-013.jpg",12.00);
INSERT INTO products VALUES ("GS73-014","State of Decay 2",7003,"Games","15-18 years","Small-town America, one year from today. The dead have risen and civilization has fallen. Not even the military could stop the zombies, and now it's up to you to gather survivors and build a community in a post-apocalyptic world", "Xbox One","GS73-014.jpg",25.00);
INSERT INTO products VALUES ("GS73-015","Tom Clancy's The Division",7003,"Games","15-18 years","We live in a complex world. The more advanced it gets, the more vulnerable it becomes. We’ve created a house of cards. Remove just one and everything falls apart.", "Xbox One","GS73-015.jpg",11.00);
INSERT INTO products VALUES ("GS73-016","Jurassic World Evolution",7003,"Games","15-18 years","Build your own Jurassic World. Features: Place yourself at the heart of the Jurassic franchise and build your own Jurassic World.", "Xbox One","GS73-016.jpg",24.00);
INSERT INTO products VALUES ("GS73-017","Marvel's Avengers", 7003,"Games","15-18 years","Marvels Avengers is a story-driven, third-person action-adventure game. Players reassemble and rebuild their Avengers roster in an original, cinematic single-player campaign, then battle solo or online alongside friends in new missions around the globe.", "Xbox One","GS73-017.jpg",28.00);
INSERT INTO products VALUES ("GS73-018","Cyberpunk 2077",7003,"Games","15-18 years","Set in Night City, Cyberpunk 2077 is an open-world, action-adventure story, featuring a megalopolis obsessed with power, glamour and body modification.", "Xbox One","GS73-018.jpg",50.00);


CREATE TABLE basket (
  product_id CHAR(11),
  ip_address VARCHAR(255),
  quantity INT,
  PRIMARY KEY(product_id,ip_address,quantity),
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE order_statuses (
  order_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (order_status_name)
);
INSERT INTO order_statuses VALUES ("Processed");
INSERT INTO order_statuses VALUES ("Shipped");
INSERT INTO order_statuses VALUES ("Delivered");

CREATE TABLE customer_orders (
  order_id INT(11) NOT NULL AUTO_INCREMENT,
  customer_id INT(11) NOT NULL,
  total  DECIMAL,
  order_date DATETIME NOT NULL,
  order_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY(order_status_name) REFERENCES order_statuses(order_status_name),
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
  order_id INT(11) NOT NULL AUTO_INCREMENT,
  product_id CHAR(11) NOT NULL,
  quantity INT,
  product_price DECIMAL(10,2),
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES customer_orders (order_id) ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (product_id) ON UPDATE CASCADE
);


CREATE TABLE payment_methods (
  payment_method_name VARCHAR(50),
  PRIMARY KEY (payment_method_name)
);
INSERT INTO payment_methods VALUES ("Debit Card");
INSERT INTO payment_methods VALUES ("PayPal");

CREATE TABLE payments (
  payment_id INT(11) NOT NULL AUTO_INCREMENT,
  customer_id INT(11) NOT NULL,
  product_price DECIMAL(10,2), 
  date DATE NOT NULL,
  payment_method_name VARCHAR(50),
  PRIMARY KEY (payment_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON UPDATE CASCADE,
  FOREIGN KEY (payment_method_name) REFERENCES payment_methods (payment_method_name)
);

CREATE TABLE review (
  review_number INT NOT NULL AUTO_INCREMENT,
  customer_id INT,
  product_id CHAR(11) NOT NULL,
  rating INT NOT NULL DEFAULT 3,
  PRIMARY KEY(review_number),
  UNIQUE(customer_id,product_id),
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL,
  FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

