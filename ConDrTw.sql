drop table Useri;
drop table Products;
drop table Campaign; 
drop table CategCampaign; 
drop table ProductProducer;
drop table CampaignCampaignCategory;
drop table support;
drop table avoid;
drop table follow;
drop table supportProductCampaign;
drop table avoidProductCampaign;
drop table statitics;
drop table userAvoidProduct;
drop table userSupportProduct;

drop table Nume;
drop table Prenume;
drop table ProdName1;
drop table ProdName2;

DROP TABLE i_ProdName1;
DROP TABLE i_ProdName2;

DROP TABLE i_Nume;
DROP TABLE i_Prenume;


drop table Produse_chimice;
drop table Lactate;
drop table Cereale;
drop table Asezonari;
drop table Produse_animale;
drop table Fructe;
drop table Legume;
drop table Ingrediente;
drop table userAvoidIngredient;

DROP INDEX IDX1;
DROP INDEX IDX2;
DROP INDEX IDX3;
DROP INDEX IDX4;
/

----------------------------------Campaign--------------------------------------
create table Campaign
(
  CampaignId INT PRIMARY KEY,
  CampaignName varchar2(50) NOT NULL,
  CampaignDescription varchar2(200),
  DateOfPublish date,
  IdOfOwner INT NOT NULL,
  NumberOfAdherers INT,
  path varchar2(200)
);
/

insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (1,'Protect the animals', 'PRotejam animalele', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 1, 0, '');
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (2,'Against Child Labour', 'Impotriva muncii excesive pentru copii.', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 2, 0, '');
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (3,'Protect Human Rights', 'Cu totii avem drepturi!', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 3, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (4,'Protect Women Rights', 'Si femeile au drepturi oriunde s-ar afla', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 5, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (5,'Protect the Environement', 'Mediul este foarte important', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 4, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (6,'Stop cutting the trees', 'Padurile sunt plamanul planetei', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 6, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (7,'Against Domestic Violence', 'O familie nu inseamna violenta', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 7, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (8,'Against Income Inequality', 'Ambele sexe trebuie platite la fel pentru o munca identica', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 8, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (9,'End Animal Testing', 'Animalele simt durere. Ele sunt pentru iubit, nu pentru chinuit.', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 9, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (10,'End Slavery', 'Este timpul ca sclavia sa dispara', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 10, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (11,'End Factory Farming', 'Animalle nu se fac si consuma pe banda rulanta', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 11, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (12,'End Human Trafficking', 'Cu totii suntem oameni si nu ne-ar placea sa fim folositi ca piese de schimb sau ca obiecte', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 12, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (13,'Save Ocean Animals', 'Chiar daca nu e auzim si animalele marine sufera', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 16, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (14,'Support Immigration Reform', 'Unii oameni sunt nevoiti sa-si parareasca casele...desi nu vor asta', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 13, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (15,'Against Aditives', 'vrem sa mancam sanatos fara substante care ne pot imbolnavi', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 14, 0, null);
insert into Campaign(CampaignId, CampaignName, CampaignDescription, DateOfPublish, IdOfOwner, NumberOfAdherers,path) values (16,'Support Organic diary produts', 'Lactatele sunt produse organice , nu chimicale', TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2015-01-01','J'),TO_CHAR(DATE '2016-12-31','J'))),'J') , 15, 0, null);
/

----------------------------------CategCampaign---------------------------------
create table CategCampaign
(
  CategoryId INT PRIMARY KEY,
  CategoryName varchar2(50) NOT NULL,
  CategoryDescription varchar2(200)
);
/
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (1,'Human Rights', 'Toate drepturile omului');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (2,'Food', 'Tot ce tine de alimentatie');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (3,'Health', 'Sanatatea e cea mai importanta');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (4,'Animal Welfare', 'Dreputile animalelor');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (5,'Econmic Justice', 'Dreptatea economica');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (6,'Labour', 'Dreptate in munca');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (7,'Social Responsability', 'Responabilitate sociala');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (8,'Environement', 'Mediul Inconjurator');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (9,'Education', 'Scoala este extraordinar de importata');
insert into CategCampaign(CategoryId, CategoryName, CategoryDescription) values (10,'Civil Rights', 'Drepturi civile');
/

-------------------------------CampaignCampaignCategory-------------------------
create table CampaignCampaignCategory
(
  CampaignId INT,
  CategoryId INT
);
/
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into CampaignCampaignCategory(CampaignId, CategoryId) 
    values ((TRUNC(DBMS_RANDOM.VALUE(1,16))),(TRUNC(DBMS_RANDOM.VALUE(1,10))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end;  
/
--------valori pentru a verifica o functionalitate---------------------
insert into CampaignCampaignCategory(CampaignId, CategoryId) values (4,10);
insert into CampaignCampaignCategory(CampaignId, CategoryId) values (5,10);
insert into CampaignCampaignCategory(CampaignId, CategoryId) values (3,10);
insert into CampaignCampaignCategory(CampaignId, CategoryId) values (2,9);
insert into CampaignCampaignCategory(CampaignId, CategoryId) values (6,10);
/

--------------------------------support-----------------------------------------
create table support
(
  UserId INT,
  CampaignId INT
);
/  
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into support(UserId, CampaignId) 
    values (v_count,(TRUNC(DBMS_RANDOM.VALUE(1,16))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end;  
/
--------valori pentru a verifica o functionalitate---------------------
insert into support(UserId, CampaignId) values (3,4);
insert into support(UserId, CampaignId) values (3,5);
insert into support(UserId, CampaignId) values (3,3);
insert into support(UserId, CampaignId) values (1,4);
insert into support(UserId, CampaignId) values (1,5);
insert into support(UserId, CampaignId) values (2,1);
insert into support(UserId, CampaignId) values (2,5);
insert into support(UserId, CampaignId) values (3,3);
insert into support(UserId, CampaignId) values (9,11);
insert into support(UserId, CampaignId) values (3,2);
/

----------------------------------avoid-----------------------------------------
create table avoid
(
  UserId INT,
  CampaignId INT
);
/
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into avoid(UserId, CampaignId) 
    values (v_count,(TRUNC(DBMS_RANDOM.VALUE(1,16))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end; 
/

----------------------------------follow----------------------------------------
create table follow
(
  UserId1 INT,
  UserId2 INT
);
/ 
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into follow(UserId1, UserId2) 
    values ((TRUNC(DBMS_RANDOM.VALUE(1,10000))),(TRUNC(DBMS_RANDOM.VALUE(1,10000))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end;  
/

-------------------------supportProductCampaign---------------------------------
create table supportProductCampaign
(
  ProdId INT,
  CampaignId INT
);
/
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into supportProductCampaign(ProdId, CampaignId) 
   values ((TRUNC(DBMS_RANDOM.VALUE(1,10000))),(TRUNC(DBMS_RANDOM.VALUE(1,16))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end;  
/

---------------------------avoidProductCampaign---------------------------------
create table avoidProductCampaign
(
  ProdId INT,
  CampaignId INT
);
/
declare 
  v_count NUMBER :=1;
begin
  loop
    insert into avoidProductCampaign(ProdId, CampaignId) 
   values ((TRUNC(DBMS_RANDOM.VALUE(1,10000))),(TRUNC(DBMS_RANDOM.VALUE(1,16))));
    v_count := v_count + 1;
    
    exit when v_count = 50;
  end loop;
end;  
/

-----------------------------------Product--------------------------------------
create table ProdName1
(
  Name1 varchar2(50)
);
/
create table ProdName2
(
  Name2 varchar2(50)
);
/
INSERT INTO ProdName1 VALUES ('Sampon');
INSERT INTO ProdName1 VALUES ('Branza');
INSERT INTO ProdName1 VALUES ('Cacao');
INSERT INTO ProdName1 VALUES ('Salam');
INSERT INTO ProdName1 VALUES ('Oua');
INSERT INTO ProdName1 VALUES ('Pastrama');
INSERT INTO ProdName1 VALUES ('Matura');
INSERT INTO ProdName1 VALUES ('Burete');
INSERT INTO ProdName1 VALUES ('Vanilie');
INSERT INTO ProdName1 VALUES ('Carne');
INSERT INTO ProdName1 VALUES ('Cascaval');
INSERT INTO ProdName1 VALUES ('Ceai');
INSERT INTO ProdName1 VALUES ('Iaurt');
INSERT INTO ProdName1 VALUES ('Cafea');
INSERT INTO ProdName1 VALUES ('Lapte');
INSERT INTO ProdName1 VALUES ('Chefir');
INSERT INTO ProdName1 VALUES ('Sana');
INSERT INTO ProdName1 VALUES ('Rosii');
INSERT INTO ProdName1 VALUES ('Varza');
INSERT INTO ProdName1 VALUES ('Castravete');

INSERT INTO ProdName2 VALUES ('Dulce');
INSERT INTO ProdName2 VALUES ('Amara');
INSERT INTO ProdName2 VALUES ('cu miere');
INSERT INTO ProdName2 VALUES ('cu scortisoara');
INSERT INTO ProdName2 VALUES ('cu naftalina');
INSERT INTO ProdName2 VALUES ('cu alcool');
INSERT INTO ProdName2 VALUES ('cu varza');
INSERT INTO ProdName2 VALUES ('cu ciocolata');
INSERT INTO ProdName2 VALUES ('cu carnati');
INSERT INTO ProdName2 VALUES ('cu pene');
INSERT INTO ProdName2 VALUES ('fara E-uri');
INSERT INTO ProdName2 VALUES ('cu bomboane');
INSERT INTO ProdName2 VALUES ('cu sunca');
INSERT INTO ProdName2 VALUES ('cu shaorma');
INSERT INTO ProdName2 VALUES ('cu spanac');
INSERT INTO ProdName2 VALUES ('plus cartofi');
INSERT INTO ProdName2 VALUES ('cu amoniac');
INSERT INTO ProdName2 VALUES ('cu miros de flori');
INSERT INTO ProdName2 VALUES ('cu aditivi');
INSERT INTO ProdName2 VALUES ('cu conservanti');
/

-------------------------------Users--------------------------------------------
create table Nume
(
  Name varchar2(50) 
);
/
create table Prenume
(
  Surname varchar2(50)
);
/
INSERT INTO Nume VALUES ('Glodeanu');
INSERT INTO Nume VALUES ('Olanuta');
INSERT INTO Nume VALUES ('Pantiruc');
INSERT INTO Nume VALUES ('Boca');
INSERT INTO Nume VALUES ('Olaru');
INSERT INTO Nume VALUES ('Iancu');
INSERT INTO Nume VALUES ('Anton');
INSERT INTO Nume VALUES ('Antonesei');
INSERT INTO Nume VALUES ('Marliton');
INSERT INTO Nume VALUES ('Ion');
INSERT INTO Nume VALUES ('Popescu');
INSERT INTO Nume VALUES ('Cozma');
INSERT INTO Nume VALUES ('Petrutu');
INSERT INTO Nume VALUES ('Fierar');
INSERT INTO Nume VALUES ('Becker');
INSERT INTO Nume VALUES ('Wagner');
INSERT INTO Nume VALUES ('Reid');
INSERT INTO Nume VALUES ('Jacobs');
INSERT INTO Nume VALUES ('Glover');
INSERT INTO Nume VALUES ('Holmes');
INSERT INTO Nume VALUES ('Cox');
INSERT INTO Nume VALUES ('Georgescu');
INSERT INTO Nume VALUES ('Gardner');
INSERT INTO Nume VALUES ('Brady');
INSERT INTO Nume VALUES ('Roberts');
INSERT INTO Nume VALUES ('Morgan');
INSERT INTO Nume VALUES ('Salazar');
INSERT INTO Nume VALUES ('Greene');
INSERT INTO Nume VALUES ('Richardson');
INSERT INTO Nume VALUES ('Jensen');
INSERT INTO Nume VALUES ('Franklin');
INSERT INTO Nume VALUES ('Bush');
INSERT INTO Nume VALUES ('Maxwell');
INSERT INTO Nume VALUES ('Wise');
INSERT INTO Nume VALUES ('Palmer');
INSERT INTO Nume VALUES ('Norton');
INSERT INTO Nume VALUES ('Chambers');
INSERT INTO Nume VALUES ('Yates');
INSERT INTO Nume VALUES ('Ortiz');
INSERT INTO Nume VALUES ('Hammond');
INSERT INTO Nume VALUES ('Cannon');
INSERT INTO Nume VALUES ('Doyle');
INSERT INTO Nume VALUES ('Dobrovat');
INSERT INTO Nume VALUES ('Kelly');
INSERT INTO Nume VALUES ('Fleming');
INSERT INTO Nume VALUES ('Rivera');
INSERT INTO Nume VALUES ('Kennedy');
INSERT INTO Nume VALUES ('Medina');
INSERT INTO Nume VALUES ('Valdez');
INSERT INTO Nume VALUES ('Bowen');
INSERT INTO Nume VALUES ('Stevens');
INSERT INTO Nume VALUES ('Price');
INSERT INTO Nume VALUES ('West');
INSERT INTO Nume VALUES ('White');
INSERT INTO Nume VALUES ('Fletcher');
INSERT INTO Nume VALUES ('Griffin');
INSERT INTO Nume VALUES ('Boyd');
INSERT INTO Nume VALUES ('Andrews');
INSERT INTO Nume VALUES ('Jefferson');
INSERT INTO Nume VALUES ('Daviescu');
INSERT INTO Nume VALUES ('Iacobescu');
INSERT INTO Nume VALUES ('Hodges');
INSERT INTO Nume VALUES ('Walker');
INSERT INTO Nume VALUES ('Park');
INSERT INTO Nume VALUES ('Cross');
INSERT INTO Nume VALUES ('Cruz');
INSERT INTO Nume VALUES ('Fernandez');
INSERT INTO Nume VALUES ('Harrington');
INSERT INTO Nume VALUES ('Gonzalez');
INSERT INTO Nume VALUES ('Shelton');
INSERT INTO Nume VALUES ('Lee');
INSERT INTO Nume VALUES ('Carroll');
INSERT INTO Nume VALUES ('Cook');
INSERT INTO Nume VALUES ('Gray');
INSERT INTO Nume VALUES ('Rios');
INSERT INTO Nume VALUES ('Santiago');
INSERT INTO Nume VALUES ('Rhodes');
INSERT INTO Nume VALUES ('Reynolds');
INSERT INTO Nume VALUES ('Katherine');
INSERT INTO Nume VALUES ('Stephens');
INSERT INTO Nume VALUES ('Aguilar');
INSERT INTO Nume VALUES ('Cain');
INSERT INTO Nume VALUES ('Hogan');
INSERT INTO Nume VALUES ('Higgins');
INSERT INTO Nume VALUES ('Hunter');
INSERT INTO Nume VALUES ('Gibson');
INSERT INTO Nume VALUES ('Ramirez');
INSERT INTO Nume VALUES ('Farmer');
INSERT INTO Nume VALUES ('Sims');
INSERT INTO Nume VALUES ('Morrison');
INSERT INTO Nume VALUES ('Rodgers');
INSERT INTO Nume VALUES ('Crawford');
INSERT INTO Nume VALUES ('Dixon');
INSERT INTO Nume VALUES ('Underwood');
INSERT INTO Nume VALUES ('Bates');
INSERT INTO Nume VALUES ('Corbett');
INSERT INTO Nume VALUES ('Pina');
INSERT INTO Nume VALUES ('Lockett');
INSERT INTO Nume VALUES ('Coon');
INSERT INTO Nume VALUES ('Goins');
INSERT INTO Nume VALUES ('Coffin');
INSERT INTO Nume VALUES ('Roden');
INSERT INTO Nume VALUES ('Cutler');
INSERT INTO Nume VALUES ('Sweeney');
INSERT INTO Nume VALUES ('Dewey');
INSERT INTO Nume VALUES ('Wray');
INSERT INTO Nume VALUES ('Gonsalves');
INSERT INTO Nume VALUES ('Parra');
INSERT INTO Nume VALUES ('Sterling');
INSERT INTO Nume VALUES ('Chin');
INSERT INTO Nume VALUES ('Spradlin');
INSERT INTO Nume VALUES ('Mclendon');

INSERT INTO Prenume VALUES ('Irina');
INSERT INTO Prenume VALUES ('Alex');
INSERT INTO Prenume VALUES ('Robert');
INSERT INTO Prenume VALUES ('Andrei');
INSERT INTO Prenume VALUES ('Cornel');
INSERT INTO Prenume VALUES ('Iulia');
INSERT INTO Prenume VALUES ('Ana');
INSERT INTO Prenume VALUES ('Andreea');
INSERT INTO Prenume VALUES ('Ioana');
INSERT INTO Prenume VALUES ('Veronica');
INSERT INTO Prenume VALUES ('Cassandra');
INSERT INTO Prenume VALUES ('Ana-Maria');
INSERT INTO Prenume VALUES ('Maria');
INSERT INTO Prenume VALUES ('Adelina');
INSERT INTO Prenume VALUES ('Elena');
INSERT INTO Prenume VALUES ('Camelia');
INSERT INTO Prenume VALUES ('Johnie');
INSERT INTO Prenume VALUES ('Sanziana');
INSERT INTO Prenume VALUES ('Cristi');
INSERT INTO Prenume VALUES ('Debby');
INSERT INTO Prenume VALUES ('Viorica');
INSERT INTO Prenume VALUES ('Adrian');
INSERT INTO Prenume VALUES ('Kimbra');
INSERT INTO Prenume VALUES ('Melaine');
INSERT INTO Prenume VALUES ('Cosmin');
INSERT INTO Prenume VALUES ('Nicolae');
INSERT INTO Prenume VALUES ('Bogdan');
INSERT INTO Prenume VALUES ('Dana');
INSERT INTO Prenume VALUES ('Dan');
INSERT INTO Prenume VALUES ('Cecile');
INSERT INTO Prenume VALUES ('Liana');
INSERT INTO Prenume VALUES ('Stevie');
INSERT INTO Prenume VALUES ('Catalina');
INSERT INTO Prenume VALUES ('Catalin');
INSERT INTO Prenume VALUES ('Harriett');
INSERT INTO Prenume VALUES ('Lasandra');
INSERT INTO Prenume VALUES ('Cierra');
INSERT INTO Prenume VALUES ('Eleanora');
INSERT INTO Prenume VALUES ('Bryanna');
INSERT INTO Prenume VALUES ('Colette');
INSERT INTO Prenume VALUES ('Zonia');
INSERT INTO Prenume VALUES ('Dania');
INSERT INTO Prenume VALUES ('Yen');
INSERT INTO Prenume VALUES ('Mariana');
INSERT INTO Prenume VALUES ('Naomi');
INSERT INTO Prenume VALUES ('Felicia');
INSERT INTO Prenume VALUES ('Daria');
INSERT INTO Prenume VALUES ('Iury');
INSERT INTO Prenume VALUES ('Santana');
INSERT INTO Prenume VALUES ('Reed');
INSERT INTO Prenume VALUES ('Beryl');
INSERT INTO Prenume VALUES ('Takako');
INSERT INTO Prenume VALUES ('Makfe');
INSERT INTO Prenume VALUES ('Ansowa');
INSERT INTO Prenume VALUES ('Paul');
INSERT INTO Prenume VALUES ('Paula');
INSERT INTO Prenume VALUES ('Ellie');
INSERT INTO Prenume VALUES ('Sydney');
INSERT INTO Prenume VALUES ('Madie');
INSERT INTO Prenume VALUES ('Adrain');
INSERT INTO Prenume VALUES ('Madlen');
INSERT INTO Prenume VALUES ('Costin');
INSERT INTO Prenume VALUES ('Vasile');
INSERT INTO Prenume VALUES ('Costina');
INSERT INTO Prenume VALUES ('Eugen');
INSERT INTO Prenume VALUES ('Nicole');
INSERT INTO Prenume VALUES ('Nicoleta');
INSERT INTO Prenume VALUES ('Marianne');
INSERT INTO Prenume VALUES ('Puffy');
INSERT INTO Prenume VALUES ('Toto');
INSERT INTO Prenume VALUES ('Marlyn');
INSERT INTO Prenume VALUES ('Stefan');
INSERT INTO Prenume VALUES ('Stefana');
INSERT INTO Prenume VALUES ('Raluca');
INSERT INTO Prenume VALUES ('Alina');
INSERT INTO Prenume VALUES ('Anita');
INSERT INTO Prenume VALUES ('Dragos');
INSERT INTO Prenume VALUES ('Romeo');
INSERT INTO Prenume VALUES ('Julieta');
INSERT INTO Prenume VALUES ('Pamela');
INSERT INTO Prenume VALUES ('Morticia');
INSERT INTO Prenume VALUES ('Ecaterina');
INSERT INTO Prenume VALUES ('Monica');
INSERT INTO Prenume VALUES ('Bianca');
INSERT INTO Prenume VALUES ('Madalina');
INSERT INTO Prenume VALUES ('Teo');
INSERT INTO Prenume VALUES ('Teodor');
INSERT INTO Prenume VALUES ('Teodora');
INSERT INTO Prenume VALUES ('Teona');
INSERT INTO Prenume VALUES ('Dorel');
INSERT INTO Prenume VALUES ('Gigel');
INSERT INTO Prenume VALUES ('Silviu');
INSERT INTO Prenume VALUES ('Pascal');
INSERT INTO Prenume VALUES ('Valentin');
INSERT INTO Prenume VALUES ('Valentina');
INSERT INTO Prenume VALUES ('Vitalie');
INSERT INTO Prenume VALUES ('Mark');
INSERT INTO Prenume VALUES ('Sandu');
INSERT INTO Prenume VALUES ('Daniel');
INSERT INTO Prenume VALUES ('Gavril');
INSERT INTO Prenume VALUES ('Claudiu');
INSERT INTO Prenume VALUES ('Alexandra');
/

--------------------------------------------------------------------------------
CREATE TABLE i_Nume(id integer, Name varchar2(50));
INSERT INTO i_Nume SELECT ROWNUM, Name FROM Nume;
/
--------------------------------------------------------------------------------
CREATE TABLE i_Prenume(id integer, Surname varchar2(50));
INSERT INTO i_Prenume SELECT ROWNUM, Surname FROM Prenume;
/
--------------------------------------------------------------------------------
CREATE TABLE i_ProdName1(id integer, Name1 varchar2(50));
INSERT INTO i_ProdName1 SELECT ROWNUM, Name1 FROM ProdName1;
/
--------------------------------------------------------------------------------
CREATE TABLE i_ProdName2(id integer, Name2 varchar2(50));
INSERT INTO i_ProdName2 SELECT ROWNUM, Name2 FROM ProdName2;
/
-------------------------------INDEXES------------------------------------------
CREATE INDEX IDX1 ON i_Nume(id, Name);
CREATE INDEX IDX2 ON i_Prenume(id,Surname);
CREATE INDEX IDX3 ON i_ProdName1(id,Name1);
CREATE INDEX IDX4 ON i_ProdName2(id,Name2);
/

---------------------------------Useri------------------------------------------
create table Useri
(
  UserId INT PRIMARY KEY,
  Nume varchar2(50) NOT NULL,
  Prenume varchar2(50) NOT NULL,
  Password varchar2(10) NOT NULL,
  Email varchar2(70) UNIQUE,
  data_nastere date,
  Logged int NOT NULL,
  isModerator int,
  path blob
);
/  
declare 
  v_count NUMBER :=0;
  v_nr_Nume NUMBER;
  v_nr_Prenume NUMBER;
  v_temp1 int :=0;
  v_temp2 int :=0;
  v_Nume varchar2(50);
  v_Prenume varchar2(50);
  v_logged int;
  v_isModerator int;
  v_Email varchar(70);
  v_Password varchar(10);
  alphabet varchar(36) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
begin

  select count(*)
  into v_nr_Nume
  from i_Nume;
  
  select count(*)
  into v_nr_Prenume
  from i_Prenume;       
  loop
    v_temp1 := v_temp1 +1;
    select Name 
    into v_Nume
    from i_Nume
    where id = v_temp1; 
        
    LOOP
    v_temp2 := v_temp2 + 1;  
    select Surname 
    into v_Prenume
    from i_Prenume 
    where id = v_temp2;

    v_Email:=LOWER(v_Nume)||'.'||LOWER(v_Prenume)||'@info.uaic.ro';
    v_logged:=trunc(dbms_random.value(0,2));
    v_isModerator:=trunc(dbms_random.value(0,2));
    v_Password:=substr(alphabet,trunc(dbms_random.value(0,36)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,36)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,36)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,36)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,36)), 1);
    
    
    insert into Useri( UserId, Nume, Prenume,Password,Email,data_nastere,Logged,isModerator, path) 
    values (v_count,v_Nume,v_Prenume,v_Password,v_Email,TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1980-01-01','J'),
    TO_CHAR(DATE '2000-12-31','J'))),'J'),v_Logged,v_isModerator, null);
    v_count := v_count + 1;
    
    exit when v_temp2=100;
    END LOOP;
    
    v_temp2:=0;
    
    exit when v_temp1 = 100;
  end loop;
end;  
/

---------------------------------Products---------------------------------------
create table Products
( 
  ProdId INT PRIMARY KEY,
  ProdName varchar2(40) NOT NULL,
  ProdDescription varchar2(60),
  BarCode NUMBER NOT NULL UNIQUE,
  path varchar2(600)
);
/  
declare
  v_count NUMBER :=0;
  v_nr_Name1 NUMBER;
  v_nr_Name2 NUMBER;
  v_temp NUMBER :=0;
  v_Name1 varchar2(20);
  v_Name2 varchar2(20);
  v_bar number:=100000;
  v_Name3 varchar2(40);
  v_Descriere varchar2(70);
   alphabet varchar(36) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin

  select count(*)
  into v_nr_Name1
  from i_ProdName1;
  
  select count(*)
  into v_nr_Name2
  from i_ProdName2;       
  loop
    v_temp := trunc(dbms_random.value(1,v_nr_Name1+1));
    select Name1 
    into v_Name1
    from i_ProdName1
    where id = v_temp; 
         
    v_temp := trunc(dbms_random.value(1,v_nr_Name2+1));      
    select Name2 
    into v_Name2
    from i_ProdName2 
    where id = v_temp;
      
    -- o descriere cat mai random
    v_Descriere:=substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||' '||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||', '||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||' '||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1) ||
                substr(alphabet,trunc(dbms_random.value(0,27)), 1)||'!!!'
                ;
    -- un barcode cat mai random :D
    v_bar:=v_bar+1;
    v_Name3:=v_Name1||' '||v_Name2;
    
    insert into Products(ProdId,ProdName,ProdDescription,BarCode, path) values
      (v_count,v_Name3,v_Descriere,v_bar, null);
    v_count := v_count + 1;
    exit when v_count = 10000;
  end loop;
end;  
/

---------------------------------Produse_chimice--------------------------------
create table Produse_chimice
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/ 
insert into Produse_chimice(IngredientId, IngredientName) values (1,'naftalina');
insert into Produse_chimice(IngredientId, IngredientName) values (2,'colorant alimentar');
insert into Produse_chimice(IngredientId, IngredientName) values (3,'mercur');
insert into Produse_chimice(IngredientId, IngredientName) values (4,'E456');
insert into Produse_chimice(IngredientId, IngredientName) values (5,'E308');
insert into Produse_chimice(IngredientId, IngredientName) values (6,'aditiv de crestere');
insert into Produse_chimice(IngredientId, IngredientName) values (7,'guma guar');
insert into Produse_chimice(IngredientId, IngredientName) values (8,'guma xantan');
insert into Produse_chimice(IngredientId, IngredientName) values (9,'acid ascorbic');
insert into Produse_chimice(IngredientId, IngredientName) values (10,'aditiv de afanare');
insert into Produse_chimice(IngredientId, IngredientName) values (11,'cheag');
/

-------------------------------------Lactate------------------------------------
create table Lactate
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/ 
insert into Lactate(IngredientId, IngredientName) values (1,'Lapte de vaca');
insert into Lactate(IngredientId, IngredientName) values (2,'Lapte de bivolita');
insert into Lactate(IngredientId, IngredientName) values (3,'Lapte de capra');
insert into Lactate(IngredientId, IngredientName) values (4,'Lapte de oaie');
insert into Lactate(IngredientId, IngredientName) values (5,'Lapte de vaca');
insert into Lactate(IngredientId, IngredientName) values (6,'Zer');
insert into Lactate(IngredientId, IngredientName) values (7,'Lapte praf');
insert into Lactate(IngredientId, IngredientName) values (8,'Lapte condensat');
/

-------------------------------------Cereale------------------------------------
create table Cereale
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/  
insert into Cereale(IngredientId, IngredientName) values (1,'grau');
insert into Cereale(IngredientId, IngredientName) values (2,'orez');
insert into Cereale(IngredientId, IngredientName) values (3,'porumb');
insert into Cereale(IngredientId, IngredientName) values (4,'hamei');
insert into Cereale(IngredientId, IngredientName) values (5,'ovaz');
insert into Cereale(IngredientId, IngredientName) values (6,'secara');
insert into Cereale(IngredientId, IngredientName) values (7,'orz');
insert into Cereale(IngredientId, IngredientName) values (8,'hrisca');
insert into Cereale(IngredientId, IngredientName) values (9,'soia');
insert into Cereale(IngredientId, IngredientName) values (10,'naut');
/

-----------------------------------Asezonari------------------------------------
create table Asezonari
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/ 
insert into Asezonari(IngredientId, IngredientName) values (1,'zahar');
insert into Asezonari(IngredientId, IngredientName) values (2,'sare');
insert into Asezonari(IngredientId, IngredientName) values (3,'piper');
insert into Asezonari(IngredientId, IngredientName) values (4,'hamei');
insert into Asezonari(IngredientId, IngredientName) values (5,'cimbru');
insert into Asezonari(IngredientId, IngredientName) values (6,'patrunjel');
insert into Asezonari(IngredientId, IngredientName) values (7,'leustean');
insert into Asezonari(IngredientId, IngredientName) values (8,'marar');
insert into Asezonari(IngredientId, IngredientName) values (9,'chimen');
insert into Asezonari(IngredientId, IngredientName) values (10,'oregano');
insert into Asezonari(IngredientId, IngredientName) values (11,'paprika');
insert into Asezonari(IngredientId, IngredientName) values (12,'cacao');
insert into Asezonari(IngredientId, IngredientName) values (13,'menta');
/

-----------------------------Produse_animale------------------------------------
create table Produse_animale
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/  
insert into Produse_animale(IngredientId, IngredientName) values (1,'carne de pui');
insert into Produse_animale(IngredientId, IngredientName) values (2,'carne de vita');
insert into Produse_animale(IngredientId, IngredientName) values (3,'carne de porc');
insert into Produse_animale(IngredientId, IngredientName) values (4,'carne de peste');
insert into Produse_animale(IngredientId, IngredientName) values (5,'ou');
insert into Produse_animale(IngredientId, IngredientName) values (6,'pene');
insert into Produse_animale(IngredientId, IngredientName) values (7,'blana');
/

-----------------------------------Fructe---------------------------------------

create table Fructe
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/  
insert into Fructe(IngredientId, IngredientName) values (1,'mar');
insert into Fructe(IngredientId, IngredientName) values (2,'para');
insert into Fructe(IngredientId, IngredientName) values (3,'banana');
insert into Fructe(IngredientId, IngredientName) values (4,'kiwi');
insert into Fructe(IngredientId, IngredientName) values (5,'nuca');
insert into Fructe(IngredientId, IngredientName) values (6,'alune');
insert into Fructe(IngredientId, IngredientName) values (7,'alune de padure');
insert into Fructe(IngredientId, IngredientName) values (8,'portocala');
insert into Fructe(IngredientId, IngredientName) values (9,'grepfruit');
insert into Fructe(IngredientId, IngredientName) values (10,'piersica');
insert into Fructe(IngredientId, IngredientName) values (11,'caisa');
insert into Fructe(IngredientId, IngredientName) values (12,'capsuna');
insert into Fructe(IngredientId, IngredientName) values (13,'lamaie');
insert into Fructe(IngredientId, IngredientName) values (14,'strugure');
/

----------------------------------Legume----------------------------------------
create table Legume
(
  IngredientId INTEGER primary key,
  IngredientName varchar2(50)
);
/ 
insert into Legume(IngredientId, IngredientName) values (1,'rosie');
insert into Legume(IngredientId, IngredientName) values (2,'castravete');
insert into Legume(IngredientId, IngredientName) values (3,'spanac');
insert into Legume(IngredientId, IngredientName) values (4,'varza');
insert into Legume(IngredientId, IngredientName) values (5,'ardei');
insert into Legume(IngredientId, IngredientName) values (6,'vanata');
insert into Legume(IngredientId, IngredientName) values (7,'brocoli');
insert into Legume(IngredientId, IngredientName) values (8,'ceapa');
insert into Legume(IngredientId, IngredientName) values (9,'cartof');
insert into Legume(IngredientId, IngredientName) values (10,'morcov');
insert into Legume(IngredientId, IngredientName) values (11,'telina');
insert into Legume(IngredientId, IngredientName) values (12,'ridiche');
insert into Legume(IngredientId, IngredientName) values (13,'ardei iute');
/

----------------------------------Ingrediente-----------------------------------
create table Ingrediente
(
  prodID INTEGER primary key,
  listaIngrediente varchar2(1000) not null
);
/
CREATE OR REPLACE PROCEDURE populeaza_ingrediente AS
   lista_finala varchar2(1000):='carbon';
   ingredient_nou varchar2(50);
   nr_de_ingrediente integer;
   maximul_din_pr integer;
   i integer;
   j integer:=1;
   id_de_luat integer;
   maximul integer;
BEGIN

  select max(prodid) into maximul_din_pr from products ;
  while(j<maximul_din_pr) loop
  i:=0;
  nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
   select max(IngredientId) into maximul from Produse_chimice ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Produse_chimice where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
  i:=0; 
  nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
  select max(IngredientId) into maximul from Cereale ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Cereale where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
  i:=0;
    nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
  select max(IngredientId) into maximul from Lactate ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Lactate where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
  i:=0;
    nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
  select max(IngredientId) into maximul from Asezonari ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Asezonari where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
 i:=0;  
    nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
   select max(IngredientId) into maximul from Produse_animale ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Produse_animale where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
 i:=0; 
    nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  if(nr_de_ingrediente<>0) then
  select max(IngredientId) into maximul from Fructe ;
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Fructe where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
 i:=0; 
  nr_de_ingrediente:=TRUNC(DBMS_RANDOM.VALUE(0,3));
  select max(IngredientId) into maximul from Legume ;
  if(nr_de_ingrediente<>0) then
  while(i<nr_de_ingrediente)loop
      id_de_luat:=TRUNC(DBMS_RANDOM.VALUE(1,maximul));
      select IngredientName into ingredient_nou from Legume where INGREDIENTID=id_de_luat;
      lista_finala:=lista_finala || ';' || ingredient_nou;
      --insert into Ingrediente(produsID, listaIngrediente) values (12,'ridiche');
      i:=i+1;
  end loop;
  end if;
  
  insert into Ingrediente(prodID, listaIngrediente) values (j,lista_finala);
  j:=j+1;
  lista_finala:='carbon';
  end loop;
  
 -- DBMS_OUTPUT.PUT_LINE(lista_finala);
END populeaza_ingrediente;
/
begin 
  populeaza_ingrediente();
end;
/

----------------------------userAvoidIngredient---------------------------------
create table userAvoidIngredient
(
  userId INTEGER,
  IngredientName varchar2(60)
);
/


insert into userAvoidIngredient values (1,'banana');
insert into userAvoidIngredient values (3,'banana');
insert into userAvoidIngredient values (2,'mar');
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------FUNCTII---------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

----------------------------------PACKET----------------------------------------
CREATE OR REPLACE PACKAGE sugestii_pt_user IS
      FUNCTION recomandaUnAltUser(p_id_user_2 varchar2) RETURN INTEGER;
      FUNCTION supportCampaignByCategory(p_id_user_2 varchar2)RETURN INTEGER;
      FUNCTION RecomandaProdusByCategorie(p_id_user_2 varchar2)RETURN integer;
END sugestii_pt_user;
/
CREATE OR REPLACE PACKAGE BODY sugestii_pt_user IS
FUNCTION recomandaUnAltUser(p_id_user_2 varchar2) RETURN INTEGER
AS
  
   v_id_user_perand INTEGER;
   v_campania INTEGER;
   indx INTEGER;
   v_user_temporar INTEGER;
   j INTEGER;
   v_counter INTEGER;
   v_counter_global INTEGER;
   v_id_user_final INTEGER;
   p_id_user integer;
   v_max_user_id integer;
   v_nr_litere integer;
    
   z exception;
   z2 exception;
   
    CURSOR campanii_placute_de_el  IS
       SELECT campaignid FROM support WHERE userid=p_id_user;
      
    CURSOR sustinatorii_campaniei  IS
       SELECT userid FROM support WHERE CAMPAIGNID=v_campania;
   
    
    TYPE prieteni IS TABLE OF INTEGER
                         INDEX BY PLS_INTEGER;
                         
    v_prieteni prieteni;
   
      
BEGIN
 
    select regexp_count(p_id_user_2, '[aeioubcdfghjklmnpqrstvwxyzBAEIOUCDFGHJKLMNPQRSTVWXYZ]',1,'i') into v_nr_litere from dual;
    
    if v_nr_litere>0 then
      raise z2;
      end if;
        
    p_id_user:=TO_NUMBER(p_id_user_2);
    
    select max(userid) into v_max_user_id from support;
    
    if p_id_user > v_max_user_id then
     raise z;
    end if;
    
    indx:=1;
    OPEN campanii_placute_de_el;
    LOOP
        FETCH campanii_placute_de_el INTO v_campania;
        EXIT WHEN campanii_placute_de_el%NOTFOUND;
        
              OPEN sustinatorii_campaniei;
              LOOP
                FETCH sustinatorii_campaniei INTO v_id_user_perand;
                EXIT WHEN sustinatorii_campaniei%NOTFOUND;
                
                if(v_id_user_perand<>p_id_user) then
                  v_prieteni(indx):= v_id_user_perand;
                  indx:=indx+1;
                end if;
              
               END LOOP;
               CLOSE sustinatorii_campaniei; 
              
    END LOOP;
    CLOSE campanii_placute_de_el;  
    
    /*
    FOR i IN v_prieteni.FIRST .. v_prieteni.LAST LOOP
         DBMS_OUTPUT.PUT_LINE(v_prieteni(i));
    END LOOP;
    */
	
	v_counter_global:=0;  
	v_id_user_final :=0;
	
    FOR i IN v_prieteni.FIRST .. v_prieteni.LAST LOOP
    v_counter:=0;     
         v_user_temporar:=v_prieteni(i);
         
         FOR j IN v_prieteni.FIRST .. v_prieteni.LAST LOOP
         
			 if(v_prieteni(j)=v_user_temporar) then
				v_counter:=v_counter+1;
			 end if;
         
         END LOOP;
         
         if(v_counter_global < v_counter) then
			 v_counter_global:=v_counter;
			 v_id_user_final:=v_prieteni(i);
         end if;
         
    END LOOP;
    
  return v_id_user_final;
    
    exception 
    
    when z2 then
        RAISE_APPLICATION_ERROR(-20698,'ID-ul contine litere!');
    when z then
        RAISE_APPLICATION_ERROR(-20696,'ID-ul este prea mare!');
    
END;

/*
DECLARE
 v_sir INTEGER;
BEGIN
   v_sir := recomandaUnAltUser(3);
   DBMS_OUTPUT.PUT_LINE(v_sir);
END;
*/



FUNCTION supportCampaignByCategory(p_id_user_2 varchar2) RETURN integer 
AS

     v_categoria integer;
     v_campania integer;
     indx integer;
     j integer;
     v_categ_aleasa integer;
     id_ul_categoriei_placute integer;
	   v_categorie_temporara integer;
     v_counter integer;
     v_counter_global integer;
     v_campanie_pe_rand integer;
     v_campania_recomandata integer;
     p_id_user integer;
     v_max_user_id integer;
     v_nr_litere integer;
     
     z exception;
     z2 exception;
   
    CURSOR campanii_placute_de_el  IS
       SELECT campaignid FROM support WHERE userid=p_id_user;
      
    CURSOR categoriile_campaniei  IS
       SELECT categoryid FROM CAMPAIGNCAMPAIGNCATEGORY WHERE CAMPAIGNID=v_campania;
              
    CURSOR campaniile_categoriei  IS
       SELECT CAMPAIGNID FROM CAMPAIGNCAMPAIGNCATEGORY WHERE categoryid=id_ul_categoriei_placute;
   
    CURSOR campaniile_categ_calculate  IS
       SELECT CAMPAIGNID FROM CAMPAIGNCAMPAIGNCATEGORY WHERE categoryid=v_categ_aleasa;
   
    
    TYPE lista_categoriilor IS TABLE OF integer
                         INDEX BY PLS_INTEGER;
                         
    v_lista lista_categoriilor;
	
   
BEGIN
    select regexp_count(p_id_user_2, '[aeioubcdfghjklmnpqrstvwxyzBAEIOUCDFGHJKLMNPQRSTVWXYZ]',1,'i') into v_nr_litere  from dual;
    
    if v_nr_litere>0 then
      raise z2;
      end if;
       
     p_id_user:=TO_NUMBER(p_id_user_2);
     
     select max(userid) into v_max_user_id from support;
     if p_id_user > v_max_user_id then
      raise z;
     end if;
    
     indx:=1;
     v_campania_recomandata:=0;
    
     OPEN campanii_placute_de_el;
     LOOP
        FETCH campanii_placute_de_el INTO v_campania;
        EXIT WHEN campanii_placute_de_el%NOTFOUND;
        
              OPEN categoriile_campaniei;
              LOOP
                FETCH categoriile_campaniei INTO v_categoria;
                EXIT WHEN categoriile_campaniei%NOTFOUND;
                
                  v_lista(indx):= v_categoria;
                  indx:=indx+1;
                 
               END LOOP;
               CLOSE categoriile_campaniei; 
              
    END LOOP;
    CLOSE campanii_placute_de_el;  
    

	  v_counter_global:=0;  
	  v_categ_aleasa :=0;
    
    FOR i IN v_lista.FIRST .. v_lista.LAST LOOP
    v_counter:=0;     
         v_categorie_temporara:=v_lista(i);
         
         FOR j IN v_lista.FIRST .. v_lista.LAST LOOP
         
			 if(v_lista(j)=v_categorie_temporara) then
			 v_counter:=v_counter+1;
			 end if;
         
         END LOOP;
         
          if(v_counter_global < v_counter) then
			 v_counter_global:=v_counter;
			 v_categ_aleasa:=v_lista(i);
          end if;
         
    END LOOP;
    
    
    
    OPEN campaniile_categ_calculate;
    LOOP
        FETCH campaniile_categ_calculate INTO v_campanie_pe_rand;
        EXIT WHEN campaniile_categ_calculate%NOTFOUND;
        
        FOR i IN v_lista.FIRST .. v_lista.LAST LOOP
        
			if(v_campanie_pe_rand<>v_lista(i)) then
				v_campania_recomandata:=v_campanie_pe_rand;
			end if;
        
        end loop;
        
    END LOOP;
    CLOSE campaniile_categ_calculate;  
    
    return v_campania_recomandata;
    
    exception 
    
    when z2 then
        RAISE_APPLICATION_ERROR(-20698,'ID-ul contine litere!');
     when z then
        RAISE_APPLICATION_ERROR(-20696,'ID-ul este prea mare!');
    
END;  

/*
DECLARE
 v_sir integer;
BEGIN
   v_sir := supportCampaignByCategory(3);
   DBMS_OUTPUT.PUT_LINE(v_sir);
END;
*/


FUNCTION RecomandaProdusByCategorie(p_id_user_2 varchar2) RETURN integer 
AS

   p_id_user integer;
   v_nume_produs_rcmd integer;
   v_produs integer;
   v_campanie integer;
   indx integer;
   i integer;
   v_count_max integer;
   v_random_product integer;
   v_max_user_id integer;
   v_nr_litere integer;
   
   z exception;
   z2 exception;
   
    CURSOR campanii_placute_de_el  IS
       SELECT campaignid FROM support WHERE userid=p_id_user;
      
    CURSOR produs_sprijina_campanii  IS
       SELECT prodid FROM supportProductCampaign WHERE CAMPAIGNID=v_campanie;
       
    
    TYPE produse IS TABLE OF integer
                         INDEX BY PLS_INTEGER;
                         
    v_produse_placubile produse;
     
BEGIN
  
    select regexp_count(p_id_user_2, '[aeioubcdfghjklmnpqrstvwxyzBAEIOUCDFGHJKLMNPQRSTVWXYZ]',1,'i') into v_nr_litere  from dual;
    
    if v_nr_litere>0 then
      raise z2;
    end if;
    
    p_id_user:=TO_NUMBER(p_id_user_2);
        
    select max(userid) into v_max_user_id from support;
    
    if p_id_user > v_max_user_id then
     raise z;
    end if;
    
    
    indx:=1;
    OPEN campanii_placute_de_el;
    LOOP
        FETCH campanii_placute_de_el INTO v_campanie;
        EXIT WHEN campanii_placute_de_el%NOTFOUND;
        
        
              OPEN produs_sprijina_campanii;
              LOOP
                FETCH produs_sprijina_campanii INTO v_produs;
                EXIT WHEN produs_sprijina_campanii%NOTFOUND;
                
                  v_produse_placubile(indx):= v_produs;
                  indx:=indx+1;
              
               END LOOP;
               CLOSE produs_sprijina_campanii; 
              
    END LOOP;
    CLOSE campanii_placute_de_el;  
  
  
   v_count_max:=v_produse_placubile.count;
   
   v_random_product:=TRUNC(DBMS_RANDOM.VALUE(1,v_count_max));
    
   
   select Prodid into v_nume_produs_rcmd from products where prodid=v_produse_placubile(v_random_product);
   
   return v_nume_produs_rcmd;
   
    exception 
    
    when z2 then
        RAISE_APPLICATION_ERROR(-20698,'ID-ul contine litere!');
     when z then
        RAISE_APPLICATION_ERROR(-20696,'ID-ul este prea mare!');
   
END;
end sugestii_pt_user;
/
/*
DECLARE
   v_sir varchar2(30);
BEGIN
   v_sir := sugestii_pt_user.RecomandaProdusByCategorie('asd');
   DBMS_OUTPUT.PUT_LINE(v_sir);
END;
*/





--=====================TRIGGERE======================--
--===================cam triviale====================--
/
CREATE OR REPLACE TRIGGER DELETE_USER_FROM_ALL
BEFORE DELETE
ON USERI
FOR EACH ROW
BEGIN
 DELETE FROM FOLLOW WHERE USERID2=:old.USERID OR USERID1=:old.USERID;
 DELETE FROM SUPPORT WHERE USERID=:old.USERID;
 DELETE FROM AVOID WHERE USERID=:old.USERID;
 DELETE FROM USERAVOIDINGREDIENT WHERE  USERID=:old.USERID;
 DELETE FROM RATING WHERE USERID=:old.USERID;
END;
/
CREATE OR REPLACE TRIGGER DELETE_CAMPAIGN_FROM_ALL
BEFORE DELETE
ON CAMPAIGN
FOR EACH ROW
BEGIN
 DELETE FROM AVOIDPRODUCTCAMPAIGN WHERE CAMPAIGNID=:old.CAMPAIGNID;
 DELETE FROM AVOID WHERE CAMPAIGNID=:old.CAMPAIGNID;
 DELETE FROM CAMPAIGNCAMPAIGNCATEGORY WHERE CAMPAIGNID=:old.CAMPAIGNID;
 DELETE FROM SUPPORTPRODUCTCAMPAIGN WHERE CAMPAIGNID=:old.CAMPAIGNID;
 DELETE FROM SUPPORT WHERE CAMPAIGNID=:old.CAMPAIGNID;
END;
/
CREATE OR REPLACE TRIGGER DELETE_PRODUCT_FROM_ALL
BEFORE DELETE
ON Products
FOR EACH ROW
BEGIN
 DELETE FROM AVOIDPRODUCTCAMPAIGN WHERE PRODID=:old.PRODID;
 DELETE FROM SUPPORTPRODUCTCAMPAIGN WHERE PRODID=:old.PRODID;
 DELETE FROM ProductProducer WHERE PRODID=:old.PRODID;
 DELETE FROM supportProductCampaign WHERE PRODID=:old.PRODID;
 DELETE FROM avoidProductCampaign WHERE PRODID=:old.PRODID;
 DELETE FROM Ingrediente WHERE PRODID=:old.PRODID;
END;
/
CREATE OR REPLACE TRIGGER DELETE_CATEGORY_FROM_ALL
BEFORE DELETE
ON CategCampaign
FOR EACH ROW
BEGIN
 DELETE FROM CampaignCampaignCategory WHERE CATEGORYID=:old.CATEGORYID;
END;
/


--=====================TRIGGERE======================--
--===================the real deal===================--
create table userAvoidProduct
(
  UserId INT,
  prodId INT
);
/
create table userSupportProduct
(
  UserId INT,
  prodId INT
);
/
insert into userSupportProduct values (1,3);
insert into userSupportProduct values (2,3);
insert into userSupportProduct values (3,3);
insert into userSupportProduct values (4,2);
insert into userSupportProduct values (5,2);
insert into userSupportProduct values (6,2);

insert into userAvoidProduct values (1,7);
insert into userAvoidProduct values (2,7);
insert into userAvoidProduct values (3,7);
insert into userAvoidProduct values (4,8);
insert into userAvoidProduct values (5,8);
/
CREATE TABLE statitics 
(
    id_most_popular_user integer, --cel mai popular user (care are cei mai multi followeri)
    id_least_popular_user integer, --cel mai putin popular user (care are cei mai putini followeri)
    id_most_liked_campaign integer, --campania cea mai sustinuta de oameni
    id_least_liked_campaign integer, --campania cea mai putin sustinuta de oameni
    id_most_supported_campaign integer,  -- campania cea mai sustinuta de produse
    id_least_supported_campaign integer, -- campania cea mai putin sustinuta de produse
    id_most_desired_product integer, --produsul cu cei mai multi useri care-l plac
    id_least_desired_product integer, --produsul cu cei mai putini useri care-l plac
    id_most_alegenic_ingredient VARCHAR2(50) --cel mai alergenic ingredient (cei mai multi oameni care sunt alergici la el)
);
/
/
create or replace function cel_mai_putin_popular_user return integer
as
   cel_mai_putin_popular integer;
   make_difference_user INTEGER;
   min_id_unu INTEGER;
   idut INTEGER;
BEGIN

  
    select min(count(userid1)) into cel_mai_putin_popular from follow group by userid2;
    
    select * into idut from (select userid2  from follow  group by userid2 having count(userid1) = cel_mai_putin_popular) where rownum<2;
    
    return idut;
END;
/
create or replace function cel_mai_popular_user return integer
as
   cel_mai_popular integer;
   idut INTEGER;
BEGIN

    select max(count(userid1))into cel_mai_popular from follow group by userid2;
    
    select * into idut from (select userid2  from follow  group by userid2 having count(userid1) = cel_mai_popular) where rownum<2;
    
    return idut;
END;
/
create or replace function campaign_supported_most_by_ppl return integer
as
  maxim_persoane integer;
  campania integer;
BEGIN

    select max(count(UserId)) into maxim_persoane from support group by CampaignId;
    select * into campania from (select CampaignId  from support group by CampaignId having count(UserId)=maxim_persoane ) where rownum<2;

    return campania;
    
END;
/
create or replace function campaign_suported_least_by_ppl return integer
as
  maxim_persoane integer;
  campania integer;
BEGIN

    select max(count(UserId)) into maxim_persoane  from avoid group by CampaignId;
    select * into campania from (select CampaignId  from avoid group by CampaignId having count(UserId)=maxim_persoane ) where rownum<2;

    return campania;
    
END;
/
create or replace function campaign_supp_most_by_prods return integer
as
  maxim_prod integer;
  campania integer;
BEGIN

    select max(count(PRODID)) into maxim_prod  from supportProductCampaign group by CampaignId;
    select * into campania from (select CampaignId  from supportProductCampaign group by CampaignId having count(PRODID)=maxim_prod ) where rownum<2;

    return campania;
    
END;
/
create or replace function campaign_supp_least_by_prods return integer
as
  maxim_prod integer;
  campania integer;
BEGIN

    select max(count(PRODID)) into maxim_prod  from avoidProductCampaign group by CampaignId;
    select * into campania from (select CampaignId  from avoidProductCampaign group by CampaignId having count(PRODID)=maxim_prod ) where rownum<2;

    return campania;
    
END;
/
create or replace function most_desirable_product return integer
as
  max_nr_useri integer;
  produsul integer;
BEGIN

    select max(count(userId)) into max_nr_useri from USERSUPPORTPRODUCT group by PRODID;
    select * into produsul from (select prodid  from USERSUPPORTPRODUCT group by PRODID having count(userId)=max_nr_useri) where rownum<2;

    return produsul;
    
END;
/
create or replace function least_desirable_product return integer
as
  max_nr_useri integer;
  produsul integer;
BEGIN

    select max(count(userId)) into max_nr_useri from USERAvoidPRODUCT group by PRODID;
    select * into produsul from (select prodid  from USERAvoidPRODUCT group by PRODID having count(userId)=max_nr_useri) where rownum<2;

    return produsul;
END;
/
/*
set serveroutput on;
Declare
idul integer;
begin
idul:=most_desirable_product();
DBMS_OUTPUT.put_line(idul);
end;
*/
create or replace function most_alergenic_ingredient return varchar2
as
  max_apartitii integer;
  ingredient_alegrenic varchar2(50);
BEGIN

    select max(count(IngredientName)) into max_apartitii from userAvoidIngredient group by IngredientName;
    select * into ingredient_alegrenic from (select IngredientName from userAvoidIngredient group by IngredientName having count(IngredientName)=max_apartitii ) where rownum<2;

    return ingredient_alegrenic;
    
    
END;
/
CREATE OR REPLACE TRIGGER update_popularity_user
AFTER DELETE or update or insert
ON follow
BEGIN
 UPDATE statitics SET id_most_popular_user = cel_mai_popular_user();
 UPDATE statitics SET id_least_popular_user = cel_mai_putin_popular_user();
END;
/
CREATE OR REPLACE TRIGGER update_campaigns_support_ppl
AFTER DELETE or update or insert
ON support
BEGIN
 UPDATE statitics SET id_most_liked_campaign = campaign_supported_most_by_ppl();
END;
/
CREATE OR REPLACE TRIGGER update_campaigns_avoid_ppl
AFTER DELETE or update or insert
ON avoid
BEGIN
 UPDATE statitics SET id_least_liked_campaign = campaign_suported_least_by_ppl();
END;
/
CREATE OR REPLACE TRIGGER update_campaigns_support_prod
AFTER DELETE or update or insert
ON supportProductCampaign
BEGIN
 UPDATE statitics SET id_most_supported_campaign = campaign_supp_most_by_prods();
END;
/
CREATE OR REPLACE TRIGGER update_campaigns_avoid_prod
AFTER DELETE or update or insert
ON avoidProductCampaign
BEGIN
 UPDATE statitics SET id_least_supported_campaign  = campaign_supp_least_by_prods();
END;
/
CREATE OR REPLACE TRIGGER desiredproduct
AFTER DELETE or update or insert
ON usersupportproduct
BEGIN
 UPDATE statitics SET id_most_desired_product = most_desirable_product();
END;
/
CREATE OR REPLACE TRIGGER undesiredproduct
AFTER DELETE or update or insert
ON useravoidproduct
BEGIN
 UPDATE statitics SET id_least_desired_product  = least_desirable_product();
END;
/
CREATE OR REPLACE TRIGGER update_ingredient
AFTER DELETE or update or insert
ON userAvoidIngredient
BEGIN
 UPDATE statitics SET id_most_alegenic_ingredient = most_alergenic_ingredient();
END;
/

--FIRST STEP - decomment next line and then comment it back
--INSERT INTO statitics (id_most_popular_user , id_least_popular_user ,id_most_liked_campaign , id_least_liked_campaign ,  id_most_supported_campaign , id_least_supported_campaign , id_most_campaingns_category, id_least_campaingns_category , id_most_alegenic_ingredient  ) VALUES (0,0,0,0,0,0,0,0,'0');

--SECOND STEP - decomment next line and then comment it back
--select * from statitics

--=============================PRIMELE 2 CAMPURI================================
--insert something to trigger 

--INSERT INTO FOLLOW (UserId1, UserId2) VALUES (9,8);
--INSERT INTO FOLLOW (UserId1, UserId2) VALUES (4,8);
--INSERT INTO FOLLOW (UserId1, UserId2) VALUES (6,9);

--check if it was successful
--SELECT * FROM FOLLOW
--==============================================================================

--========================CAMP ID_MOST_LIKED_CAMPAIGN===========================
--INSERT INTO support (USERID, CAMPAIGNID) VALUES (170,14); 
--SELECT * FROM support
--==============================================================================

--=========================CAMP ID_LEAST_LIKED_CAMPAIGN=========================
--INSERT INTO avoid (USERID, CAMPAIGNID) VALUES (10,3); 
--SELECT * FROM avoid
--==============================================================================

--=========================CAMP ID_MOST_SUPPORTED_CAMPAIGN======================
--INSERT INTO supportProductCampaign (PRODID, CAMPAIGNID) VALUES (10,4); 
--SELECT * FROM supportProductCampaign
--==============================================================================

--=========================CAMP ID_LEAST_SUPPORTED_CAMPAIGN=====================
--INSERT INTO avoidProductCampaign (PRODID, CAMPAIGNID) VALUES (10,3); 
--SELECT * FROM avoidProductCampaign
--==============================================================================

--==================CAMPURI ID_MOST/LEAST_CAMPAINGNS_CATEGORY===================
--INSERT INTO CampaignCampaignCategory (campaignid, categoryid) VALUES (10,5); 
--SELECT * FROM CampaignCampaignCategory
--==============================================================================

--=========================CAMP ID_MOST_ALEGENIC_INGREDIENT=====================
--insert into userAvoidIngredient values (5,'patrunjel');
--SELECT * FROM userAvoidIngredient
--==============================================================================


--check all
--select * from statitics;

--==============================================================================
--==========================ANOTHER COOL TRIGGER================================
--==============================================================================
CREATE OR REPLACE TRIGGER update_adhererrr
AFTER DELETE or update or insert
ON support
declare
campania integer;
numarul_aderatorilor integer;
  CURSOR campaniile  IS
       SELECT campaignID FROM Campaign;
BEGIN
 
 OPEN campaniile;
    LOOP
        FETCH campaniile INTO campania;
        EXIT WHEN campaniile%NOTFOUND;
        select count(userid) into numarul_aderatorilor from support where CampaignId=campania;
        update Campaign SET NumberOfAdherers  = numarul_aderatorilor where CampaignId= campania;
    END LOOP;
    CLOSE campaniile;  
END;
/
--insert something in support to trigger this (decomment and run)
--INSERT INTO support (USERID, CAMPAIGNID) VALUES (1221,1);

--check the result (decomment and run)
--select * from Campaign;


