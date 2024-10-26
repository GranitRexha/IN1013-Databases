DROP TABLE IF EXISTS petEvent;
DROP TABLE IF EXISTS petPet;

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM('M', 'F'),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname)
);