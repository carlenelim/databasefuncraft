
CREATE DATABASE FunCraft;
USE FunCraft;

CREATE TABLE Jobs(
    jobs_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    jobs_name varchar(10)
);

CREATE TABLE Chara(
    chara_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    charaName varchar(12) UNIQUE,
    charaLevel int,
    charaHp int,
    CharaAp int,
    CharaExp int,
    jobs_ID int,
    FOREIGN KEY (jobs_ID) REFERENCES Jobs(jobs_ID)
);

CREATE TABLE Accounts(
    accounts_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email varchar(50) UNIQUE,
    pw varchar(50)
);

CREATE TABLE Employee(
    employee_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    profilePicture text,
    fullName varchar(50),
    empPosition varchar(35),
    totalAgreement int,
    Chara_ID int,
    accounts_ID int,
    FOREIGN KEY (chara_ID) REFERENCES Chara (chara_ID),
    FOREIGN KEY (accounts_ID) REFERENCES Accounts (accounts_ID)
);

CREATE TABLE Agreement(
    agreement_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_ID int,
    agreementDate date,
    reward long,
    FOREIGN KEY (employee_ID) REFERENCES Employee (employee_ID)
);

CREATE TABLE Quest(
    quest_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    questName varchar(50),
    quantity int,
    assignedBy varchar(30),
    workTime int,
    startTime date,
    loc text,
    taskDesc text  
);

CREATE TABLE AssignedQuest(
    assignedQuest_ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quest_ID int,
    employee_ID int,
    qtyAchieved int,
    FOREIGN KEY (quest_ID) REFERENCES Quest(quest_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Jobs VALUES(1, 'Warrior');
INSERT INTO Jobs VALUES(2, 'Knight');
INSERT INTO Jobs VALUES(3, 'Mage');

INSERT INTO Chara VALUES(1, 'CassieAlpha', 1, 100, 100, 10, 1);
INSERT INTO Chara VALUES(2, 'CassieBeta', 2, 100, 90, 20, 1);
INSERT INTO Chara VALUES(3, 'CassieCharlie', 2, 80, 100, 30, 2);
INSERT INTO Chara VALUES(4, 'CassieDelta', 3, 100, 70, 40, 2);
INSERT INTO Chara VALUES(5, 'CassieEcho', 4, 100, 50, 50, 3);

INSERT INTO Accounts VALUES(1, 'carlenelim@gmail.com', 'carlenelim');
INSERT INTO Accounts VALUES(2, 'mitchellryu@gmail.com', 'mitchellryu');
INSERT INTO Accounts VALUES(3, 'ivanwijaya@gmail.com', 'ivanwijaya');
INSERT INTO Accounts VALUES(4, 'carlenemitchell@gmail.com', 'carlenemitchell');
INSERT INTO Accounts VALUES(5, 'ryuivan@gmail.com', 'ryuivan');

INSERT INTO Employee VALUES(1, NULL, 'Carlene Lim', 'Junior Salesman', 6, 1, 1);
INSERT INTO Employee VALUES(2, NULL, 'Mitchell Ryu', 'Junior Salesman', 6, 2, 2);
INSERT INTO Employee VALUES(3, NULL, 'Ivan Wijaya', 'Junior Salesman', 6, 3, 3);
INSERT INTO Employee VALUES(4, NULL, 'Carlene Mitchell', 'Senior Salesman', 10, 4, 4);
INSERT INTO Employee VALUES(5, NULL, 'Ryu Ivan', 'Senior Salesman', 10, 5, 5);

INSERT INTO Agreement VALUES(1, 1, NULL, 1000000);
INSERT INTO Agreement VALUES(2, 1, NULL, 2000000);
INSERT INTO Agreement VALUES(3, 2, NULL, 1500000);
INSERT INTO Agreement VALUES(4, 2, NULL, 2750000);
INSERT INTO Agreement VALUES(5, 3, NULL, 900000);
INSERT INTO Agreement VALUES(6, 3, NULL, 2000000);
INSERT INTO Agreement VALUES(7, 4, NULL, 3000000);
INSERT INTO Agreement VALUES(8, 4, NULL, 1050000);
INSERT INTO Agreement VALUES(9, 5, NULL, 2500000);
INSERT INTO Agreement VALUES(10, 5, NULL, 7500000);

INSERT INTO Quest VALUES(1, 'Attend 5 Meetings', 5, 'Darius Andana Haris', 4, NULL, NULL,'Meeting in Main Hall');
INSERT INTO Quest VALUES(2, 'Help 10 Customers', 10, 'Darius Andana Haris', 4, NULL, NULL,'Help 10 customers and build your reputation');
INSERT INTO Quest VALUES(3, 'Attend Webinar', 1, 'Darius Andana Haris', 4, NULL, NULL,'Attend a Webinar from company');
INSERT INTO Quest VALUES(4, 'Help Supervisor', 2, 'Darius Andana Haris', 4, NULL, NULL,'I need your help.');

INSERT INTO AssignedQuest VALUES (1, 1,1, 2);
INSERT INTO AssignedQuest VALUES (2, 2,1, 2);
INSERT INTO AssignedQuest VALUES (3, 3,1, 0);
INSERT INTO AssignedQuest VALUES (4, 4,1, 1);
INSERT INTO AssignedQuest VALUES (5, 1,2, 2);
INSERT INTO AssignedQuest VALUES (6, 2,2, 2);
INSERT INTO AssignedQuest VALUES (7, 3,2, 0);
INSERT INTO AssignedQuest VALUES (8, 4,2, 1);
INSERT INTO AssignedQuest VALUES (9, 1,3, 3);
INSERT INTO AssignedQuest VALUES (10, 2,3, 2);
INSERT INTO AssignedQuest VALUES (11, 3,3, 1);
INSERT INTO AssignedQuest VALUES (12, 4,3, 2);
INSERT INTO AssignedQuest VALUES (13, 1,4, 2);
INSERT INTO AssignedQuest VALUES (14, 2,4, 5);
INSERT INTO AssignedQuest VALUES (15, 3,4, 1);
INSERT INTO AssignedQuest VALUES (16, 4,4, 2);
INSERT INTO AssignedQuest VALUES (17, 1,5, 4);
INSERT INTO AssignedQuest VALUES (18, 2,5, 7);
INSERT INTO AssignedQuest VALUES (19, 3,5, 1);
INSERT INTO AssignedQuest VALUES (20, 4,5, 0);