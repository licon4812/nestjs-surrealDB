-- create schemaless table human with a document containing James
CREATE human:James SET  nickname="Jimbo", age=22;

CREATE human:alex SET  nickname="Mike", age=21, golf=true;
CREATE human:matteo SET  nickname="Mortis", age=23, golf=false;
CREATE human:jeremy SET  nickname="Jeremy", age=23, nodejs=false, occupation = "Software";

UPDATE human:James SET occupation = "Software";

SELECT * FROM human WHERE occupation = "Software"

UPDATE human SET skills +=['breathing', 'walking'];


--one to one

UPDATE human:matteo SET bff = human:alex;

SELECT id, nickname bff.nickname, bff.age FROM human:matteo;


--one to many
CREATE car:tesla SET model = "Model S", price=99999;

CREATE car:toyota SET model = "Corolla Hybrid", price = 38000;

UPDATE human:James SET cars = ['car:tesla', 'car:toyota'];
UPDATE car:tesla SET owner = human:James;
UPDATE car:toyota SET owner = human:James;

CREATE car:shitbox SET model = "Hilux", price = 0;
UPDATE human:alex SET cars=['car:shitbox'] ;
UPDATE car:tesla SET owner = human:alex;
SELECT * FROM human WHERE id= human:alex;

--Many-thru
CREATE part:tire SET brand = "Michelin", size = 5;
CREATE part:gastank SET brand = "Tanksy", size = 10;
CREATE part:battery SET brand = "Xi Ping", size = 20;

UPDATE car:tesla SET parts = ['part:tire', 'part:gastank'];
UPDATE car:toyota SET parts = ['part:tire', 'part:gastank'];

SELECT cars.parts.brand FROM human:James;

--Many to many
--Car has many drivers , drivers drove many cars
RELATE human:James -> drove -> car:tesla SET when = time::now(), destination = "Gold Coast Show girls";
RELATE human:James -> drove -> car:toyota SET when = time::now(), destination = "KFC";

SELECT ->drove->car FROM human;
SELECT <-drove<-human FROM car;



