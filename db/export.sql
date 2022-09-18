-- ------------------------------
-- OPTION
-- ------------------------------

OPTION IMPORT;

-- ------------------------------
-- TABLE: car
-- ------------------------------

DEFINE TABLE car SCHEMALESS PERMISSIONS NONE;

-- ------------------------------
-- TABLE: drove
-- ------------------------------

DEFINE TABLE drove SCHEMALESS PERMISSIONS NONE;

-- ------------------------------
-- TABLE: human
-- ------------------------------

DEFINE TABLE human SCHEMALESS PERMISSIONS NONE;

-- ------------------------------
-- TABLE: part
-- ------------------------------

DEFINE TABLE part SCHEMALESS PERMISSIONS NONE;

-- ------------------------------
-- TRANSACTION
-- ------------------------------

BEGIN TRANSACTION;

-- ------------------------------
-- TABLE DATA: car
-- ------------------------------

UPDATE car:shitbox CONTENT { id: car:shitbox, model: "Hilux", price: 0 };
UPDATE car:tesla CONTENT { id: car:tesla, model: "Model S", owner: human:alex, parts: [part:tire, part:gastank], price: 99999 };
UPDATE car:toyota CONTENT { id: car:toyota, model: "Corolla Hybrid", owner: human:James, parts: [part:tire, part:gastank], price: 38000 };

-- ------------------------------
-- TABLE DATA: drove
-- ------------------------------

UPDATE drove:o3jeezp02smffptv8nl1 CONTENT { destination: "Gold Coast Show girls", id: drove:o3jeezp02smffptv8nl1, in: human:James, out: car:tesla, when: "2022-09-18T07:51:24.857703900Z" };
UPDATE drove:wc4r8lp7nzbg8t1rwic6 CONTENT { destination: "KFC", id: drove:wc4r8lp7nzbg8t1rwic6, in: human:James, out: car:toyota, when: "2022-09-18T07:51:24.861294300Z" };

-- ------------------------------
-- TABLE DATA: human
-- ------------------------------

UPDATE human:James CONTENT { age: 22, cars: [car:tesla, car:toyota], id: human:James, nickname: "Jimbo", occupation: "Software", skills: ["breathing", "walking"] };
UPDATE human:alex CONTENT { age: 21, cars: [car:shitbox], golf: "2020 Club Champ", id: human:alex, nickname: "Mike", skills: ["breathing", "walking"] };
UPDATE human:jeremy CONTENT { age: 23, id: human:jeremy, nickname: "Jeremy", nodejs: false, occupation: "Software", skills: ["breathing", "walking"] };
UPDATE human:matteo CONTENT { age: 23, bff: human:alex, golf: "Improving", id: human:matteo, nickname: "Mortis", skills: ["breathing", "walking"] };

-- ------------------------------
-- TABLE DATA: part
-- ------------------------------

UPDATE part:battery CONTENT { brand: "Xi Ping", id: part:battery, size: 20 };
UPDATE part:gastank CONTENT { brand: "Tanksy", id: part:gastank, size: 10 };
UPDATE part:tire CONTENT { brand: "Michelin", id: part:tire, size: 5 };

-- ------------------------------
-- TRANSACTION
-- ------------------------------

COMMIT TRANSACTION;

