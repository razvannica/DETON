-- Este suficient sa rulati tot codul o singura data si el va crea toate tabelele si le va popula.
-- Vedeti diagrama pentru detaii.
-- Verificati periodic pentru update-uri la baa de date.


-- Sequences used for Private Keys

DROP SEQUENCE seq_ASSOCIATES;
DROP SEQUENCE seq_DETON_USERS;
DROP SEQUENCE seq_OFFENCES;
DROP SEQUENCE seq_PRISONERS;
DROP SEQUENCE seq_PRISONS;
DROP SEQUENCE seq_VISITS;
DROP SEQUENCE seq_CNP;

DROP TABLE ASSOCIATES CASCADE CONSTRAINTS;
DROP TABLE DETON_USERS CASCADE CONSTRAINTS;
DROP TABLE OFFENCES CASCADE CONSTRAINTS;
DROP TABLE POPULATION_ARCHIVE CASCADE CONSTRAINTS;
DROP TABLE PRISONER_OFFENCES CASCADE CONSTRAINTS;
DROP TABLE PRISONERS CASCADE CONSTRAINTS;
DROP TABLE PRISONNER_ASSOCIATES CASCADE CONSTRAINTS;
DROP TABLE PRISONER_VISITORS CASCADE CONSTRAINTS;
DROP TABLE PRISONS CASCADE CONSTRAINTS;
DROP TABLE VISITS CASCADE CONSTRAINTS;
DROP TABLE VISITORS CASCADE CONSTRAINTS;

CREATE SEQUENCE seq_VISITORS
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_OFFENCES
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_PRISONERS
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_PRISONS
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_DETON_USERS
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_VISITS
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
CREATE SEQUENCE seq_CNP
  START WITH 170019
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Database TABLES
CREATE TABLE VISITORS (
  cnp                     number(13) NOT NULL, 
  first_name              varchar2(64) NOT NULL, 
  middle_name             varchar2(64), 
  last_name               varchar2(64) NOT NULL, 
  birth_date              date NOT NULL, 
  picture                 blob, 
  other_details           varchar2(128), 
  last_known_contact_date date DEFAULT SYSDATE, 
  deleted number(1)  NOT NULL,
  PRIMARY KEY (cnp));
CREATE TABLE OFFENCES (
  offence_id           number(10) NOT NULL, 
  offence_category     varchar2(32) NOT NULL, 
  offence_full_name    varchar2(168) NOT NULL, 
  offence_min_sentence number(5) DEFAULT 0.1, 
  offence_max_sentence number(5) DEFAULT 100, 
  deleted              number(1)  NOT NULL,
  PRIMARY KEY (offence_id));
CREATE TABLE POPULATION_ARCHIVE (
  prison_id                   number(10) NOT NULL, 
  prison_population_capacity  number(10), 
  population                  number(10), 
  registered_date             date);
CREATE TABLE PRISONER_OFFENCES (
  prisoner_id       number(10) NOT NULL, 
  offence_id        number(10) NOT NULL, 
  datetime_commited date DEFAULT SYSDATE, 
  location_commited varchar2(128));
CREATE TABLE PRISONERS (
  prisoner_id           number(10) NOT NULL, 
  cnp                   number(13) NOT NULL UNIQUE, 
  prison_id             number(10) NOT NULL, 
  first_name            varchar2(64) NOT NULL, 
  middle_name           varchar2(64), 
  last_name             varchar2(64) NOT NULL, 
  birth_date            date NOT NULL, 
  entry_date            date DEFAULT SYSDATE NOT NULL, 
  out_date              date DEFAULT SYSDATE+3600,
  probation_status_code number(2) DEFAULT 0 NOT NULL, 
  deleted               number(1)  NOT NULL,
  PRIMARY KEY (prisoner_id));
CREATE TABLE PRISONER_VISITORS (
  visit_id   number(10) NOT NULL, 
  visitor_id number(13) NOT NULL);
CREATE TABLE PRISONS (
  prison_id       number(10) NOT NULL, 
  prison_name     varchar2(64) NOT NULL, 
  prison_capacity number(10) DEFAULT 1000, 
  population      number(10) DEFAULT 0, 
  address         varchar2(128),
  deleted number(1)  NOT NULL,
  PRIMARY KEY (prison_id));
CREATE TABLE DETON_USERS (
  user_id       number(10) NOT NULL, 
  prison_id     number(10), 
  username      varchar2(32) NOT NULL, 
  email         varchar2(64) NOT NULL, 
  user_password varchar2(32) NOT NULL, 
  user_role     number(2) DEFAULT 0 NOT NULL,
  deleted       number(1)  NOT NULL,
  PRIMARY KEY (user_id));
CREATE TABLE VISITS (
  visit_id            number(10) NOT NULL, 
  convict_id          number(10) NOT NULL, 
  visit_date          date DEFAULT SYSDATE NOT NULL, 
  dutation            timestamp(7), 
  visit_reason        varchar2(128), 
  visit_summary       varchar2(512), 
  observations        varchar2(512), 
  prisoner_condition  varchar2(128), 
  exchanged_data      varchar2(512), 
  deleted             number(1)  NOT NULL,
  PRIMARY KEY (visit_id));
  
/*
ALTER TABLE POPULATION_ARCHIVE ADD CONSTRAINT FKPOPULATION850277 FOREIGN KEY (prison_id) REFERENCES PRISONS (id) ON DELETE CASCADE;
ALTER TABLE prisoner_VISITORS ADD CONSTRAINT FKprisoner_517420 FOREIGN KEY (visitor_id) REFERENCES VISITORS (cnp);
ALTER TABLE prisoner_VISITORS ADD CONSTRAINT FKprisoner_175872 FOREIGN KEY (visit_id) REFERENCES VISITS (id);
ALTER TABLE VISITS ADD CONSTRAINT FKVISITS944439 FOREIGN KEY (convict_id) REFERENCES PRISONERS (id);
ALTER TABLE PRISONER_OFFENCES ADD CONSTRAINT FKPRISONER_O527146 FOREIGN KEY (offence_id) REFERENCES OFFENCES (id);
ALTER TABLE PRISONER_OFFENCES ADD CONSTRAINT FKPRISONER_O437817 FOREIGN KEY (prisoner_id) REFERENCES PRISONERS (id);
ALTER TABLE PRISONERS ADD CONSTRAINT FKPRISONERS348624 FOREIGN KEY (prison_id) REFERENCES PRISONS (id);
ALTER TABLE DETON_USERS ADD CONSTRAINT FKDETON_USERS228827 FOREIGN KEY (prison_id) REFERENCES PRISONS (id);
*/

-- Populate DETON_USERS TABLE
INSERT INTO DETON_USERS VALUES(seq_DETON_USERS.nextval,NULL,'danielbabei95','danielbabei_95@yahoo.com','plaintextpass',1,0);
INSERT INTO DETON_USERS VALUES(seq_DETON_USERS.nextval,NULL,'razvannica','nciarazvan@yahoo.com','plaintextpass',1,0);
INSERT INTO DETON_USERS VALUES(seq_DETON_USERS.nextval,NULL,'anttudor','anttudor95@yahoo.com','plaintextpass',1,0);
INSERT INTO DETON_USERS VALUES(seq_DETON_USERS.nextval,NULL,'user01','user01@yahoo.com','123456',DEFAULT,0);
INSERT INTO DETON_USERS VALUES(seq_DETON_USERS.nextval,NULL,'admin','admin@admin.ro','admin',1,0);


-- Populate PRISONS TABLE
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Fox River State Penitentiary',3078,0,'Joliet, Illinois',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Adams County Correctional Center',786,0,'Natchez, Mississippi',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Big Spring Correctional Center',1243,0,'Big Spring, Texas',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Eden Detention Center',463,0,'702 E Broadway Street Eden, Texas',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Allenwood',4352,0,'Gregg Township, Union County, near Allenwood, Pennsylvania',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Atlanta',1240,0,'Atlanta, Georgia',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Victorville',780,0,'Adelanto, California',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Lewisburg',468,0,'Kelly Township, Union County, near Lewisburg, Pennsylvania',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Leavenworth',3567,0,'Leavenworth, Kansas',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Lee',1465,0,'Lee County, near Pennington Gap, Virginia',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'United States Penitentiary, Lompoc',765,0,'Lompoc, Santa Barbara County, California',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Federal Correctional Complex, Butner',3234,0,'Mangum Township, Durham County / Dutchville Township, Granville County, North Carolina',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Federal Correctional Institution, Fort Dix',1298,0,'New Hanover Township, New Jersey',0);
INSERT INTO PRISONS VALUES(seq_PRISONS.nextval,'Federal Correctional Institution, Fort Worth',980,0,'Fort Worth, Tarrant County, Texas',0);

-- Populate OFFENCES TABLE
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a conditional discharge',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Confiscation Order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Crime Prevention Injunction',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a curfew order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a non-molestation order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a restraining order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Serious Crime Prevention Order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Serious Crime Prevention Order / Financial Reporting Orders',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Sexual Offences Order or Risk of Sexual Harm Order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of a Terrorism Prevention and Investigation Measure',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of Anti-Social Behaviour Order / Criminal Behaviour Order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of community orders',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of licence conditions',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of Slavery and Trafficking Prevention Orders and Slavery or Trafficking Risk Orders',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of suspended sentence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breach of the conditions of an injunction against harassment',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Breaching a bail condition',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Failure to answer bail',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Failure to comply with the requirements of an order / Breach of a probation order',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Failure to comply with the requirements of the sex offenders register',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Offences in connection with restrictions on reporting',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Breach','Publishing material likely to lead members of the public to identify victims of certain offences',0);
SET DEFINE OFF;
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Bribery and attempted bribery (Common Law)',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Bribery and corruption by foreign officers',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Cheating at gambling or assisting another person to cheat',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Conspiracy to corrupt',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Corrupt transactions with agents',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Corruption in public office',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Failure of commercial organisations to prevent bribery',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Offences of bribing another person',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Bribery & Corruption Offences','Offences relating to being bribed',0);
SET DEFINE ON;
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Conspiracy to commit burglary',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Aggravated burglary',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Attempted burglary of a building other than a dwelling',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Attempted burglary of a dwelling',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Breaking and entering',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Burglary in a building other than a dwelling',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Burglary in a dwelling',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Burglary with violence or the threat of violence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Burglary, with the intent to commit, or the commission of an offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Burglary','Conspiracy to commit aggravated burglary',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Disclosing private sexual photographs and films with intent to cause distress',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Improper use of public electronic communications network',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Interfering with the mail - general - intentionally delaying or opening a postal packet in the course of its transmission by post',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Making, supplying or obtaining articles for use in offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Obtain or disclose or procure the disclosure of personal data or information contained in personal data',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Sending electronic communications, letters or other articles which are indecent, grossly offensive, threatening or false with intent to cause distress or anxiety',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Unauthorised access to computer material',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Unauthorised access with intent to commit or facilitate commission of further offences',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Computer Misuse / Communications','Unauthorised acts with intent to impair, or with recklessness as to impairing, operation of computer',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Attempting to supply drugs',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Being concerned in a supply of drugs',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Being knowingly concerned in the fraudulent evasion of the prohibition on the importation of controlled drugs',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Being knowingly concerned in the fraudulent evasion of the prohibition on the importation of goods',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Conspiracy to import drugs',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Conspiracy to produce a controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Conspiracy to supply drugs',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Cultivating a plant of the genus cannabis',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Dealing, being concerned in the supply, or intending to supply any controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Drug trafficking Importation, exportation, production, supply and possession',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Having possession of a controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Having possession of a controlled substance with intent to supply',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Having possession of a controlled substance with intent to supply it to an inmate',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Manufacturing a scheduled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Permitting premises to be used for unlawful purposes',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Production or being concerned in production of a controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Supplying a scheduled substance to another person',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Unlawful exportation of a controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Drug Offences','Unlawful importation of a controlled substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Attempting to possess property intending it should be used for the purpose of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Belonging to a proscribed organisation',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Causing an explosion likely to endanger life or property',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Conspiracy to attend or Attendance at a place used for terrorist training',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Conspiracy to murder persons unknown',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Dissemination of a terrorist publication',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Encouragement of terrorism, directly or indirectly, inciting or encouraging others to commit acts of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Engaging in conduct in preparation for acts of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Failing to provide information about acts of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Fund-raising for the purposes of terrorism / Funding arrangements',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Incitement to commit an act of terrorism wholly or partly outside the United Kingdom',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Incitement to religious hatred - an act intending to stir up religious hatred',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Inviting support for a proscribed organisation',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Making or Possessing an explosive substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Making or Possessing explosive substances with intent or Causing an explosion with intent',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Making or possessing explosives for unlawful purposes',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Possessing an article/s for a purpose connected with terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Possessing/Collecting a record of information likely to be useful to a person committing or preparing an act of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Possession of property which could be used for the purposes of terrorism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Terrorism','Using an explosive substance to cause an explosion of a nature likely to endanger life or to cause serious damage to property',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Acting as a gangmaster, being in possession of false documents',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Aggressive commercial practices (harassment, threats, physical force, coercion, or undue influence)',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Being knowingly concerned in activity prohibited by Part 2, 3 or 4 of this Order with intent to evade the relevant prohibition',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Commercial practices which are contrary to the requirements of professional diligence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Conspiracy to evade the prohibition on the export of goods',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Conspiracy to evade the prohibition on the movement of controlled goods between third countries',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Dealing with or making infringing articles',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Dishonest agreement to engage in certain types of cartel activity, namely price-fixing, limiting supply or production, market-sharing and bid-rigging',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Doing anything in connection with eggs, sperm and embryos',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Failure to comply with licence conditions',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Failure to comply with Money Laundering Regulations',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Knowingly contravening a trade prohibition',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Labelling and marking of containers and packages',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Making funds available to Iraq except under the authority of a licence granted by the Treasury',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Misleading actions - unfair commercial practices',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Misleading advertising/marketing',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Misleading omissions - unfair commercial practices',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Offence of supply of intoxicating substance',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Offences against the safety regulations',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Offering to supply human material for transplantation',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Power to exclude drunkards from licensed premises / Failure to leave licensed premises',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Prohibition of the promotion of unfair commercial practices',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Unlicensed money lending',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Unauthorised sales or supply of medicinal products',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Trading and Licensing Offences','Trading in controlled goods with intent to evade controls / Supply or delivery of restricted goods',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Abuse of position of trust - causing a child to watch a sexual act',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Abuse of position of trust - causing or inciting a child to engage in sexual activity',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Abuse of position of trust - sexual activity',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Abuse of position of trust - sexual activity in the presence of a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Administering a substance with intent',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Aiding and abetting - Rape',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Aiding and abetting sexual assault',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Arranging or facilitating child prostitution or pornography',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Assault by penetration',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Assault of a child under 13 by penetration',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Assault with intent to commit a sexual offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Assisting in the management of a brothel',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted distribution of indecent images of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted indecent assault',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted Rape',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted rape of a child under 13',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted rape of a child under 16',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted sexual assault',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempted voyeurism',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempting to arrange / Arranging or facilitating the commission of a child sex offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempting to cause or incite a child to engage in sexual activity',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempting to meet a child following sexual grooming',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Attempting to procure a female for immoral purpose, or using drugs to obtain or facilitate sexual intercourse',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Causing a child to look at images of people engaged in sexual activity / Causing a child to watch a sexual act',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Causing a person to engage in sexual activity without consent',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Causing or inciting a child to engage in sexual activity',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Causing or inciting child prostitution or pornography',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Conspiracy to commit a sexual offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Conspiracy to control prostitution / Controlling a prostitute for financial gain',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Conspiracy to keep and manage brothels',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Controlling a child prostitute or a child involved in pornography',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Distributing indecent images of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Downloading indecent images of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Encouraging or assisting a child sex offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Engaging in sexual activity in the presence of a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Failure to notify police of a change in sex offender status',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','False imprisonment with intent to commit a sexual offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Incest',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Incitement to commit rape',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Inciting a child family member to engage in sexual activity',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Inciting a child to commit an act of gross indecency',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Inciting girl under 16 to have incestuous sexual intercourse',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Inciting sexual activity with a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Indecency with a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Indecent assault',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Indecent assault of a female under 13 years',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Indecent exposure',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Inflicting grievous bodily harm with intent to commit a sexual offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Intercourse with an animal',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Keeping a brothel for prostitution',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Rape',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Kidnap with intent to commit a sexual offence',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Making and possessing indecent images of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Meeting a child following sexual grooming or travelling with the intention of meeting a child following sexual grooming',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Paying for sexual services of a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Possession of extreme pornographic images',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Possession of indecent photograph or pseudo-photograph of a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual interference with a corpse',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual activity in the presence of a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual Activity with a Child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual activity with a person with a mental disorder by a care worker',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual Assault',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual communication with a child',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual intercourse with a child under 13-years-old',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Sexual Touching / Sexual activity with a child under 16',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Take, make, possess, publish, distribute indecent photographs or pseudo-photographs of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Taking or making indecent photographs or pseudo-photographs of children',0);
INSERT INTO OFFENCES(offence_id,offence_category,offence_full_name,deleted) VALUES(seq_OFFENCES.nextval,'Sexual Offences','Trespass with intent to commit a sexual offence',0);
/
 --Populate prisonerS TABLE
DECLARE
  TYPE names IS VARRAY(520) OF VARCHAR(32);
  first_names names;
  last_names names;

  v_random_number NUMBER;
  v_first_name VARCHAR(32);
  v_last_name VARCHAR(32);
  v_surname VARCHAR(32);
  v_middle_name VARCHAR(32);
  v_middle_name_chance NUMBER:=0.40;
  v_birth_date NUMBER;
  v_entry_date DATE;
  v_out_date DATE;
  v_cnp NUMBER;
  v_year NUMBER;
  v_month NUMBER;
  v_birthdate DATE;
  v_day NUMBER;
  v_probation_status NUMBER;
  v_prison_id NUMBER;
  v_complete_cnp NUMBER;
BEGIN
  last_names:=names('Citea', 'Lazar', 'Damoc', 'Ghergu', 'Vlad', 'Chiriac', 'Tuduri', 'Macariu', 'Ababei', 'Balica', 'Boca', 'Mihaela', 'Miron', 'Carp', 'Danila', 'Crainiceanu', 'Hutanu', 'Chistol', 'Ionesi', 'Goldan', 'Ciucanu', 'Vrabie', 'Chitic', 'Dimache', 'Filibiu', 'Dochitei', 'Rosca', 'Corodescu', 'Ventaniuc', 'Harpa', 'Robu', 'Munteanu', 'Alexandru', 'Patras', 'Motrescu', 'Andrian', 'Covatariu', 'Corduneanu', 'Botezatu', 'Huma', 'Pascaru', 'Rusu', 'Moscu', 'Lupu', 'Cimpoesu', 'Rusu', 'Popa', 'Iacob', 'Tesu', 'Craciunas', 'Ciornei', 'Lupu', 'Netedu', 'Samson', 'Platon', 'Maties', 'Mihailescu', 'Edu', 'Manole', 'Mazur', 'Sleghel', 'Andros', 'Asofiei', 'Cretu', 'Iacobuta', 'Stan', 'Agape', 'Cretu', 'Aioanei', 'Suhani', 'Stoica', 'Arteni', 'Bizu', 'Huzum', 'Giurgila', 'Iftimesei', 'Luca', 'Lazar', 'Mihalcea', 'Burloiu', 'Neghina', 'Stefan', 'Chmilevski', 'Anghelina', 'Arhire', 'Miron', 'Popa', 'Iordache-tiroiu', 'Dascalu', 'Nechita', 'Dorneanu', 'Gherman', 'Gherase', 'Mazareanu', 'Ghibirdic', 'Tincu', 'Popa', 'Matei', 'Dudau', 'Calinescu', 'Pojar', 'Timofte', 'Miron', 'Maganu', 'Vinatoru', 'Olariu', 'Duceac', 'Trifan', 'Scortanu', 'Balan', 'Iovu', 'Munteanu', 'Minghel', 'Lungu', 'Dascalu', 'Razvan', 'Avram', 'Ababei', 'Ursu', 'Durnea', 'Vicol', 'Spiridon', 'Jitariuc', 'Grama', 'Poenariu', 'Galatanu', 'Rusu', 'Munteanu', 'Romanescu', 'Talif', 'Perciun', 'Nicu', 'Leon', 'Alexandru', 'Belciuganu', 'Boistean', 'Agafitei', 'Leonte', 'Florescu', 'Hodoreanu', 'Ionita', 'Benchea', 'Tirpescu', 'Zazuleac', 'Popovici', 'Sandu', 'Alexii', 'Curca', 'Chelaru', 'Opariuc', 'Juravle', 'Buza', 'Olarasu', 'Manolache', 'Chirila', 'Coseru', 'Perju', 'Cebere', 'Romanescu', 'Dobos', 'Toncu', 'Pintilie', 'Andonesei', 'Mihai', 'Diaconu', 'Pascaru', 'Minea', 'Banu', 'Sparhat', 'Latu', 'Pila', 'Arvinte', 'Dogaru', 'Avadanei', 'Daniel', 'Petcu', 'Grigore', 'Bilan', 'Ciobotaru', 'Marton', 'Popa', 'Cosnita', 'Grosu', 'Mihai', 'Sandu', 'Vasiliu', 'Riscanu', 'Arhire', 'Lungu', 'Catiru', 'Dima', 'Caraiman', 'Corciu', 'Reut', 'Iacob', 'Dodan', 'Arhip', 'Fedeles', 'Luncasu', 'Hociung', 'Purice', 'Mangalagiu', 'Popa', 'Alexe', 'Ionita', 'Ciocoiu', 'Stavarache', 'Olaru', 'Gurau', 'Dragomir', 'Andrei', 'Corneanu', 'Negrutu', 'Cojocariu', 'Glodeanu', 'Tifrea', 'Voaides', 'Hostiuc', 'Bordeianu-cocea', 'Patriche', 'Grosu', 'Negrus', 'Romaniuc', 'Irimia', 'Strainu', 'Moniry-abyaneh', 'Giosanu', 'Rusu', 'Ichim', 'Vrabie', 'Predoaia', 'Sandu', 'Clatinici', 'Filip', 'Antonie', 'Paparuz', 'Lates', 'Macoveschi', 'Stingaciu', 'Simionesei', 'Stefanita', 'Jecu', 'Bazgan', 'Bulbuc-aioanei', 'Lupu', 'Popovici', 'Anita', 'Postolache', 'Ciobanu-mologhianu', 'Gorgan', 'Palihovici', 'Toma', 'Ciobanu', 'Roman', 'Iosub', 'Andrici', 'Rusu', 'Pantiruc', 'Ionesei', 'Maxim', 'Acasandrei', 'Pintilie', 'Ciofu', 'Cazacu', 'Barbieru', 'Balan', 'Simiganoschi', 'Otrocol', 'Bursuc', 'Zamosteanu', 'Cojocaru', 'Eusebiu', 'Eduard', 'Tudose', 'Negruser', 'Fedeles', 'Leleu', 'Chirila', 'Herdes', 'Calancea', 'Gavrilovici', 'Martinas', 'Ungureanu', 'Belcescu', 'Silitra', 'Popa', 'Chiriac', 'Tuiu', 'Ilie', 'Chicos', 'Catonoiu', 'Iacob', 'Iordan', 'Puiu', 'Lungu', 'Gherca', 'Nica', 'Simion', 'Tudosa', 'Bute', 'Corfu', 'Grigoriu', 'Stoian', 'Micu', 'Luca', 'Ambroci', 'Cazamir', 'Braescu', 'Lucaci', 'Danila', 'Marcu', 'Mazilu', 'Cozmiuc', 'Dragomirescu', 'Ferestraoaru', 'Popescu', 'Manolache', 'Plugariu', 'Cusmuliuc', 'Insuratelu', 'Chilaboc', 'Barzu', 'Frunza', 'Onu', 'Teclici', 'Patachi', 'Haba', 'Piriu', 'Darie', 'Lupu', 'Dragoman', 'Gitlan', 'Nemtoc', 'Simon', 'Apostol', 'Bejenaru', 'Chirila', 'Tanasa', 'Damian', 'Bivol', 'Borcan', 'Pantiru', 'Ulinici', 'Filimon', 'Motroi', 'Ionita', 'Catana', 'Chelmus', 'Turcu', 'Rosca', 'Leonte', 'Procop', 'Prodan', 'Trifan', 'Vasilache', 'Lungeanu', 'Matrana', 'Pascaru', 'Bodnar', 'Varlan', 'Poputoaia', 'Rusu', 'Mihalachi', 'Tofan', 'Sandulache', 'Popescu', 'Cozma', 'Mihaila', 'Daneliuc', 'Scurtu', 'Butacu', 'Leustean', 'Miron', 'Oprea', 'Coca', 'Musca', 'Roman', 'Urse', 'Milut', 'Boca', 'Folvaiter', 'Murarasu', 'Olanuta', 'Alexandrescu', 'Dochitoiu', 'Condurache', 'Iancu', 'Vulpescu', 'Morosanu', 'Asaftei', 'Riza', 'Alexandru', 'Chile', 'Simionescu', 'Ursachi', 'Ostafe', 'Rachieru', 'Larion', 'Andronic', 'Minuti', 'Oana', 'Ungureanu', 'Bradea', 'Mitan', 'Prisecaru', 'Varvaroi', 'Maftei', 'Jitca', 'Vidru', 'Costan', 'Dinu', 'Marinov', 'Sava', 'Alexandru', 'Harabula', 'Baciu', 'Grozavu', 'Gavriliuc', 'Balan', 'Iordache', 'Birsanu', 'Clim', 'Joldescu', 'Cristea', 'Dorneanu', 'Hardon', 'Rusu', 'Unghianu', 'Chelmu', 'Adascalitei', 'Nastaca', 'Chibici', 'Popa', 'Ursachi', 'Cumpata', 'Mutescu', 'Afanasie', 'Matcovici', 'Ursache', 'Dascalu', 'Vlad', 'Apetrei', 'Stiufliuc', 'Simionescu', 'Rosca', 'Capusneanu', 'Dragan', 'Dima', 'Samson', 'Lucaci', 'Vcosmin', 'Crucerescu', 'Ivascu', 'Lucasi', 'Bejan', 'Domnaru', 'Mazilu', 'Creanga', 'Budaca', 'Teodorescu', 'Amarghioalei', 'Cobuz', 'Paparuz', 'Aungurenci', 'Cretu', 'Aioanei', 'Tabusca', 'Sofian', 'Babei', 'Ungureanu', 'Melniciuc-puica', 'Morarescu', 'Toader', 'Roman', 'Cehan', 'Balan', 'Mataca', 'Sitaru', 'Lupu', 'Frumosu', 'Costan', 'Bulai', 'Carbune', 'Boca', 'Mihociu', 'Varteniuc', 'Perju', 'Luca', 'Stolnicu', 'Cernescu', 'Soficu', 'Stoleru', 'Burlacu', 'Herscovici', 'Cojocariu', 'Savescu', 'Sfarghiu', 'Gavrilita', 'Lupascu', 'Stolniceanu', 'Antochi', 'Vasiliu', 'Dascalescu', 'Vasilache', 'Corodescu', 'Podaru', 'Arvinte', 'Schifirnet', 'Leuciuc', 'Strimtu', 'Spiridon');
  first_names:=names('Alexandra', 'Mihaela', 'Valentin', 'Andreea', 'Alexandru', 'Cosmin', 'Eduard', 'Camelia', 'Adina', 'Ema', 'Victor', 'Breaban', 'Alexandru', 'Paula', 'Marius', 'Catalin', 'Dan', 'Ana', 'Cristian', 'Denise', 'Niculita', 'Victor', 'Andrei', 'Nicolae', 'Anca', 'Cosmin', 'Alexandru', 'Andrei', 'Vladimir', 'Codrin', 'Ioan', 'Silviu', 'Dan', 'Silviu', 'Tudor', 'Diana', 'Simina', 'Florian', 'Andra', 'Cristian', 'Cosmin', 'Madalina', 'George', 'Ioana', 'Razvan', 'Andrei', 'Anca', 'Radu', 'Andrei', 'Andrei', 'Giani', 'Catalin', 'Mircea', 'Andreea', 'Stefan', 'Petruta', 'Richard', 'Dorin', 'Catalin', 'Iaroslav', 'Emma', 'Emil', 'Cristian', 'Vlad', 'Tudor', 'Iustin', 'Petru', 'Eusebiu', 'Iolanda', 'Dimitrie', 'Stefan', 'Vasile', 'Dan', 'George', 'Andreea', 'Ioan', 'Iulian', 'Lucian', 'Alexandra', 'Cosmin', 'Madalina', 'Stolniceanu', 'Monica', 'Elena', 'Ionut', 'Radu', 'Ileana', 'Roland', 'Bianca', 'Georgiana', 'Adrian', 'Dan', 'Raluca', 'Andrei', 'George', 'Elvis', 'Codrin', 'Bogdan', 'Andreea', 'Monica', 'Raluca', 'Diana', 'Gabriel', 'Mihai', 'Razvan', 'Constantin', 'Bogdan', 'Alexandru', 'Stefana', 'Anca', 'Gabriel', 'Ilie', 'Alexandra', 'Ana', 'Ana', 'Romanescu', 'Andreea', 'Georgiana', 'Vlad', 'Dumitru', 'Robert', 'Andra', 'Sebastian', 'Dragos', 'George', 'Mircea', 'Alex', 'Ionel', 'Razvan', 'Victor', 'Alexandru', 'Andrei', 'Daniel', 'Munteanu', 'Adrian', 'Sergiu', 'Bogdan', 'Codrin', 'Razvan', 'Paul', 'Eduard', 'Vlad', 'Nicu', 'Vadim', 'Alexandru', 'Daniel', 'Georgiana', 'Ilie', 'Stefan', 'Ioana', 'Oana', 'Madalina', 'Loredana', 'Irinel', 'Mihaela', 'Xena', 'Andrei', 'Octavian', 'Stefan', 'Iulia', 'Daniel', 'Cosmin', 'Samuel', 'Paul', 'Dan', 'Ilona', 'Vlad', 'Ionut', 'Cosmin', 'Bogdan', 'Cristian', 'Rares', 'Laurentiu', 'Larisa', 'Timofte', 'Raluca', 'Marius', 'Tudor', 'Robert', 'Adrian', 'Andrei', 'Ioan', 'Alexandru', 'Teodor', 'Matei', 'Paula', 'Andrei', 'Dorin', 'Damian', 'Daniel', 'Vlad', 'Stefan', 'Mihai', 'Alexandru', 'Cosmin', 'Alexandru', 'Andrei', 'Andreia', 'Anca', 'Oana', 'Dumitru', 'Ioan', 'Camil', 'Razvan', 'Laura', 'Tudor', 'Simona', 'Marius', 'Marian', 'Irina', 'Iulian', 'Ana', 'Ioana', 'Florin', 'Irina', 'George', 'Alexandru', 'Danut', 'Andrei', 'Giulio', 'Ilie', 'Bogdan', 'Radu', 'Iustin', 'Emanuela', 'Daniel', 'George', 'Rbogdan', 'Mihai', 'Tudor', 'Ionut', 'Diana', 'Paul', 'Marian', 'Andrei', 'Cristina', 'Ioan', 'Victor', 'Stefan', 'Loredana', 'Alexandru', 'Catalin', 'Dorian', 'Elisa', 'Teodor', 'Sebastian', 'Elvis', 'Alexandru', 'Bogdan', 'Elena', 'Andrei', 'Marius', 'Alexandru', 'Stefan', 'Stefana', 'Larisa', 'Gabriel', 'Andreea', 'Gabriel', 'Dragos', 'Beatrice', 'Andrei', 'Vlad', 'Vlad', 'Ana', 'Dan', 'Daniela', 'Robert', 'Antonia', 'Catalin', 'Cristian', 'Cretu', 'Tofan', 'Alexandru', 'Tudor', 'Daniel', 'Alexandru', 'Andrei', 'Andrei', 'Cristina', 'Eugen', 'Alexandru', 'Robert', 'Cristina', 'Dragos', 'Lucian', 'Dorin', 'Costel', 'Ionut', 'Raluca', 'Malina', 'Cristian', 'Vlad', 'Danut', 'Radu', 'Razvan', 'Razvan', 'Cosmin', 'Ovidiu', 'Iulian', 'Alexandru', 'Anca', 'Ioan', 'Matei', 'Andrei', 'Cosmin', 'Delia', 'Ana', 'Diana', 'Codrin', 'Alexandru', 'George', 'Ionut', 'Catalin', 'Andrei', 'Cosmin', 'Ecaterina', 'Raluca', 'Ciprian', 'Madalina', 'Ecaterina', 'Gabriel', 'Teodor', 'Stefan', 'Radu', 'Paula', 'Gabriela', 'Adrian', 'Sergiu', 'Razvan', 'Andreas', 'Ionut', 'Ciprian', 'Stefania', 'Constantin', 'George', 'Loredana', 'Petru', 'Bogdan', 'Daniel', 'Andreea', 'Paul', 'Cristina', 'Lucian', 'Valeriu', 'Alexandru', 'Vasile', 'Rares', 'Nicusor', 'Andreea', 'Maria', 'Vladimir', 'Marius', 'Tamara', 'Diana', 'Ionut', 'Emanuela', 'Georgiana', 'Ana', 'Simona', 'Alexandru', 'Cristian', 'Bogdan', 'Cosmin', 'Denisa', 'Dimitrie', 'Laurentiu', 'Andrei', 'Ilie', 'Vlad', 'Robert', 'Andrei', 'Sergiu', 'Ionut', 'Alina', 'Ioana', 'Simona', 'Daniel', 'Camelia', 'Eleonora', 'Alexandra', 'Stefana', 'Alexandru', 'Aurelian', 'Alexandru', 'Vasile', 'Beatrice', 'Radu', 'George', 'Andreea', 'Adrian', 'Spridonica', 'Ovidiu', 'Darius', 'Anca', 'Iosif', 'Larisa', 'Dragos', 'Teodora', 'Vladut', 'Daniel', 'Daria', 'Rares', 'Theodor', 'Codrina', 'Theodora', 'Ervin', 'Beniamin', 'Vlad', 'George', 'Georgiana', 'Bogdan', 'Fabian', 'Gabriel', 'Adrian', 'Filip', 'Andrei', 'Samuel', 'Sabin', 'Marian', 'Maria', 'Andrei', 'Catalin', 'Cristian', 'Dragos', 'Elena', 'Silviu', 'Anda', 'Claudiu', 'Mihai', 'Andrei', 'Bianca', 'Petrut', 'Georgiana', 'Lucian', 'Alexandru', 'Guler', 'Stefan', 'Alexandru', 'Vlad', 'Victor', 'Alin', 'Gabriel', 'Cristian', 'Valentin', 'Claudia', 'Silviu', 'Rares', 'Georgiana', 'Marius', 'Ion', 'Gabriela', 'Claudia', 'Octavian', 'Alexandru', 'Florin', 'Irina', 'Eduard', 'Andrei', 'Mirela', 'Cezar', 'Manuela', 'Andreea', 'Andra', 'Dragos', 'Bogdan', 'George', 'Daniel', 'Mihail', 'Teofil', 'Andrei', 'Stefana', 'Nicusor', 'Dan', 'Gheorghe', 'George', 'Ioana', 'Cristian', 'Bogdan', 'Vasilica', 'Iuliana', 'George', 'Ioan', 'Vlad', 'Andrei', 'Sanziana', 'Radu', 'Simona', 'Stefan', 'Corneliu', 'Georgiana', 'Liviu', 'Robert', 'Vladut', 'Sabina', 'Andrei', 'Rolland', 'Matei', 'Stefan', 'Alexandru', 'Ioana', 'Cezar', 'Mihai', 'Mihnea', 'Rares', 'Razvan', 'Cosmin', 'Nicolae', 'Gheorghe', 'Ana');
  FOR index_ IN 1..10000 LOOP
    v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
    v_first_name:=first_names(v_random_number);
    v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
    v_last_name:=last_names(v_random_number);
    v_prison_id:=TRUNC(DBMS_RANDOM.VALUE(1,15));
    v_birthdate:=ADD_MONTHS(TO_DATE('01 01 1950','dd mm yyyy'),DBMS_RANDOM.VALUE(1,550));
    v_birthdate:=v_birthdate+DBMS_RANDOM.VALUE(0,32);
    IF v_first_name LIKE '%a' THEN
        v_cnp:=2;
      ELSE
        v_cnp:=1;
    END IF;
    v_year:=TRUNC(DBMS_RANDOM.VALUE(49,99));
    v_month:=TRUNC(DBMS_RANDOM.VALUE(1,12));
    v_day:=TRUNC(DBMS_RANDOM.VALUE(1,28));
    v_complete_cnp:=v_cnp||v_year;
    
    IF v_month<10 THEN
      v_complete_cnp:=v_complete_cnp||'0'||v_month;
    ELSE
      v_complete_cnp:=v_complete_cnp||v_month;
    END IF;
    
    IF v_day<10 THEN
      v_complete_cnp:=v_complete_cnp||'0'||v_day;
    ELSE
      v_complete_cnp:=v_complete_cnp||v_day;
    END IF;
    v_complete_cnp:=v_complete_cnp||seq_CNP.nextval;
    IF DBMS_RANDOM.VALUE(0,1)<0.4 THEN
      v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
      v_middle_name:=first_names(v_random_number);
      WHILE (v_middle_name LIKE '%a' AND v_first_name NOT LIKE '%a') OR (v_middle_name NOT LIKE '%a' AND v_first_name LIKE '%a') LOOP
        v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
        v_middle_name:=first_names(v_random_number);
      END LOOP;
      
      INSERT INTO PRISONERS VALUES(seq_PRISONERS.nextval,v_complete_cnp,v_prison_id,v_first_name,v_middle_name,v_last_name,v_birthdate,DEFAULT,NULL,DEFAULT,0);
    ELSE
      INSERT INTO PRISONERS VALUES(seq_PRISONERS.nextval,v_complete_cnp,v_prison_id,v_first_name,NULL,v_last_name,v_birthdate,DEFAULT,NULL,DEFAULT,0);
    END IF;
    END LOOP;
END;
/
-- Populate PRISONERS_OFFENCES
DECLARE
  v_prisoner_id NUMBER;
  v_offence_id NUMBER;
  v_random_number NUMBER;
  v_nr_of_offences NUMBER;
  
BEGIN
  FOR index_ IN 1..10000 LOOP
    v_nr_of_offences:=TRUNC(DBMS_RANDOM.VALUE(1,10));
    FOR index_2_ IN 1..v_nr_of_offences LOOP
      v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,182));
      INSERT INTO PRISONER_OFFENCES VALUES(index_,v_random_number,DEFAULT,NULL);
    END LOOP;
  END LOOP;
END;
/
-- Populate VISITORS TABLE
DECLARE
  TYPE names IS VARRAY(520) OF VARCHAR(32);
  first_names names;
  last_names names;

  v_random_number NUMBER;
  v_first_name VARCHAR(32);
  v_last_name VARCHAR(32);
  v_surname VARCHAR(32);
  v_middle_name VARCHAR(32);
  v_middle_name_chance NUMBER:=0.40;
  v_birth_date NUMBER;
  v_cnp NUMBER;
  v_year NUMBER;
  v_month NUMBER;
  v_birthdate DATE;
  v_day NUMBER;
  v_complete_cnp NUMBER;
BEGIN
  last_names:=names('Citea', 'Lazar', 'Damoc', 'Ghergu', 'Vlad', 'Chiriac', 'Tuduri', 'Macariu', 'Ababei', 'Balica', 'Boca', 'Mihaela', 'Miron', 'Carp', 'Danila', 'Crainiceanu', 'Hutanu', 'Chistol', 'Ionesi', 'Goldan', 'Ciucanu', 'Vrabie', 'Chitic', 'Dimache', 'Filibiu', 'Dochitei', 'Rosca', 'Corodescu', 'Ventaniuc', 'Harpa', 'Robu', 'Munteanu', 'Alexandru', 'Patras', 'Motrescu', 'Andrian', 'Covatariu', 'Corduneanu', 'Botezatu', 'Huma', 'Pascaru', 'Rusu', 'Moscu', 'Lupu', 'Cimpoesu', 'Rusu', 'Popa', 'Iacob', 'Tesu', 'Craciunas', 'Ciornei', 'Lupu', 'Netedu', 'Samson', 'Platon', 'Maties', 'Mihailescu', 'Edu', 'Manole', 'Mazur', 'Sleghel', 'Andros', 'Asofiei', 'Cretu', 'Iacobuta', 'Stan', 'Agape', 'Cretu', 'Aioanei', 'Suhani', 'Stoica', 'Arteni', 'Bizu', 'Huzum', 'Giurgila', 'Iftimesei', 'Luca', 'Lazar', 'Mihalcea', 'Burloiu', 'Neghina', 'Stefan', 'Chmilevski', 'Anghelina', 'Arhire', 'Miron', 'Popa', 'Iordache-tiroiu', 'Dascalu', 'Nechita', 'Dorneanu', 'Gherman', 'Gherase', 'Mazareanu', 'Ghibirdic', 'Tincu', 'Popa', 'Matei', 'Dudau', 'Calinescu', 'Pojar', 'Timofte', 'Miron', 'Maganu', 'Vinatoru', 'Olariu', 'Duceac', 'Trifan', 'Scortanu', 'Balan', 'Iovu', 'Munteanu', 'Minghel', 'Lungu', 'Dascalu', 'Razvan', 'Avram', 'Ababei', 'Ursu', 'Durnea', 'Vicol', 'Spiridon', 'Jitariuc', 'Grama', 'Poenariu', 'Galatanu', 'Rusu', 'Munteanu', 'Romanescu', 'Talif', 'Perciun', 'Nicu', 'Leon', 'Alexandru', 'Belciuganu', 'Boistean', 'Agafitei', 'Leonte', 'Florescu', 'Hodoreanu', 'Ionita', 'Benchea', 'Tirpescu', 'Zazuleac', 'Popovici', 'Sandu', 'Alexii', 'Curca', 'Chelaru', 'Opariuc', 'Juravle', 'Buza', 'Olarasu', 'Manolache', 'Chirila', 'Coseru', 'Perju', 'Cebere', 'Romanescu', 'Dobos', 'Toncu', 'Pintilie', 'Andonesei', 'Mihai', 'Diaconu', 'Pascaru', 'Minea', 'Banu', 'Sparhat', 'Latu', 'Pila', 'Arvinte', 'Dogaru', 'Avadanei', 'Daniel', 'Petcu', 'Grigore', 'Bilan', 'Ciobotaru', 'Marton', 'Popa', 'Cosnita', 'Grosu', 'Mihai', 'Sandu', 'Vasiliu', 'Riscanu', 'Arhire', 'Lungu', 'Catiru', 'Dima', 'Caraiman', 'Corciu', 'Reut', 'Iacob', 'Dodan', 'Arhip', 'Fedeles', 'Luncasu', 'Hociung', 'Purice', 'Mangalagiu', 'Popa', 'Alexe', 'Ionita', 'Ciocoiu', 'Stavarache', 'Olaru', 'Gurau', 'Dragomir', 'Andrei', 'Corneanu', 'Negrutu', 'Cojocariu', 'Glodeanu', 'Tifrea', 'Voaides', 'Hostiuc', 'Bordeianu-cocea', 'Patriche', 'Grosu', 'Negrus', 'Romaniuc', 'Irimia', 'Strainu', 'Moniry-abyaneh', 'Giosanu', 'Rusu', 'Ichim', 'Vrabie', 'Predoaia', 'Sandu', 'Clatinici', 'Filip', 'Antonie', 'Paparuz', 'Lates', 'Macoveschi', 'Stingaciu', 'Simionesei', 'Stefanita', 'Jecu', 'Bazgan', 'Bulbuc-aioanei', 'Lupu', 'Popovici', 'Anita', 'Postolache', 'Ciobanu-mologhianu', 'Gorgan', 'Palihovici', 'Toma', 'Ciobanu', 'Roman', 'Iosub', 'Andrici', 'Rusu', 'Pantiruc', 'Ionesei', 'Maxim', 'Acasandrei', 'Pintilie', 'Ciofu', 'Cazacu', 'Barbieru', 'Balan', 'Simiganoschi', 'Otrocol', 'Bursuc', 'Zamosteanu', 'Cojocaru', 'Eusebiu', 'Eduard', 'Tudose', 'Negruser', 'Fedeles', 'Leleu', 'Chirila', 'Herdes', 'Calancea', 'Gavrilovici', 'Martinas', 'Ungureanu', 'Belcescu', 'Silitra', 'Popa', 'Chiriac', 'Tuiu', 'Ilie', 'Chicos', 'Catonoiu', 'Iacob', 'Iordan', 'Puiu', 'Lungu', 'Gherca', 'Nica', 'Simion', 'Tudosa', 'Bute', 'Corfu', 'Grigoriu', 'Stoian', 'Micu', 'Luca', 'Ambroci', 'Cazamir', 'Braescu', 'Lucaci', 'Danila', 'Marcu', 'Mazilu', 'Cozmiuc', 'Dragomirescu', 'Ferestraoaru', 'Popescu', 'Manolache', 'Plugariu', 'Cusmuliuc', 'Insuratelu', 'Chilaboc', 'Barzu', 'Frunza', 'Onu', 'Teclici', 'Patachi', 'Haba', 'Piriu', 'Darie', 'Lupu', 'Dragoman', 'Gitlan', 'Nemtoc', 'Simon', 'Apostol', 'Bejenaru', 'Chirila', 'Tanasa', 'Damian', 'Bivol', 'Borcan', 'Pantiru', 'Ulinici', 'Filimon', 'Motroi', 'Ionita', 'Catana', 'Chelmus', 'Turcu', 'Rosca', 'Leonte', 'Procop', 'Prodan', 'Trifan', 'Vasilache', 'Lungeanu', 'Matrana', 'Pascaru', 'Bodnar', 'Varlan', 'Poputoaia', 'Rusu', 'Mihalachi', 'Tofan', 'Sandulache', 'Popescu', 'Cozma', 'Mihaila', 'Daneliuc', 'Scurtu', 'Butacu', 'Leustean', 'Miron', 'Oprea', 'Coca', 'Musca', 'Roman', 'Urse', 'Milut', 'Boca', 'Folvaiter', 'Murarasu', 'Olanuta', 'Alexandrescu', 'Dochitoiu', 'Condurache', 'Iancu', 'Vulpescu', 'Morosanu', 'Asaftei', 'Riza', 'Alexandru', 'Chile', 'Simionescu', 'Ursachi', 'Ostafe', 'Rachieru', 'Larion', 'Andronic', 'Minuti', 'Oana', 'Ungureanu', 'Bradea', 'Mitan', 'Prisecaru', 'Varvaroi', 'Maftei', 'Jitca', 'Vidru', 'Costan', 'Dinu', 'Marinov', 'Sava', 'Alexandru', 'Harabula', 'Baciu', 'Grozavu', 'Gavriliuc', 'Balan', 'Iordache', 'Birsanu', 'Clim', 'Joldescu', 'Cristea', 'Dorneanu', 'Hardon', 'Rusu', 'Unghianu', 'Chelmu', 'Adascalitei', 'Nastaca', 'Chibici', 'Popa', 'Ursachi', 'Cumpata', 'Mutescu', 'Afanasie', 'Matcovici', 'Ursache', 'Dascalu', 'Vlad', 'Apetrei', 'Stiufliuc', 'Simionescu', 'Rosca', 'Capusneanu', 'Dragan', 'Dima', 'Samson', 'Lucaci', 'Vcosmin', 'Crucerescu', 'Ivascu', 'Lucasi', 'Bejan', 'Domnaru', 'Mazilu', 'Creanga', 'Budaca', 'Teodorescu', 'Amarghioalei', 'Cobuz', 'Paparuz', 'Aungurenci', 'Cretu', 'Aioanei', 'Tabusca', 'Sofian', 'Babei', 'Ungureanu', 'Melniciuc-puica', 'Morarescu', 'Toader', 'Roman', 'Cehan', 'Balan', 'Mataca', 'Sitaru', 'Lupu', 'Frumosu', 'Costan', 'Bulai', 'Carbune', 'Boca', 'Mihociu', 'Varteniuc', 'Perju', 'Luca', 'Stolnicu', 'Cernescu', 'Soficu', 'Stoleru', 'Burlacu', 'Herscovici', 'Cojocariu', 'Savescu', 'Sfarghiu', 'Gavrilita', 'Lupascu', 'Stolniceanu', 'Antochi', 'Vasiliu', 'Dascalescu', 'Vasilache', 'Corodescu', 'Podaru', 'Arvinte', 'Schifirnet', 'Leuciuc', 'Strimtu', 'Spiridon');
  first_names:=names('Alexandra', 'Mihaela', 'Valentin', 'Andreea', 'Alexandru', 'Cosmin', 'Eduard', 'Camelia', 'Adina', 'Ema', 'Victor', 'Breaban', 'Alexandru', 'Paula', 'Marius', 'Catalin', 'Dan', 'Ana', 'Cristian', 'Denise', 'Niculita', 'Victor', 'Andrei', 'Nicolae', 'Anca', 'Cosmin', 'Alexandru', 'Andrei', 'Vladimir', 'Codrin', 'Ioan', 'Silviu', 'Dan', 'Silviu', 'Tudor', 'Diana', 'Simina', 'Florian', 'Andra', 'Cristian', 'Cosmin', 'Madalina', 'George', 'Ioana', 'Razvan', 'Andrei', 'Anca', 'Radu', 'Andrei', 'Andrei', 'Giani', 'Catalin', 'Mircea', 'Andreea', 'Stefan', 'Petruta', 'Richard', 'Dorin', 'Catalin', 'Iaroslav', 'Emma', 'Emil', 'Cristian', 'Vlad', 'Tudor', 'Iustin', 'Petru', 'Eusebiu', 'Iolanda', 'Dimitrie', 'Stefan', 'Vasile', 'Dan', 'George', 'Andreea', 'Ioan', 'Iulian', 'Lucian', 'Alexandra', 'Cosmin', 'Madalina', 'Stolniceanu', 'Monica', 'Elena', 'Ionut', 'Radu', 'Ileana', 'Roland', 'Bianca', 'Georgiana', 'Adrian', 'Dan', 'Raluca', 'Andrei', 'George', 'Elvis', 'Codrin', 'Bogdan', 'Andreea', 'Monica', 'Raluca', 'Diana', 'Gabriel', 'Mihai', 'Razvan', 'Constantin', 'Bogdan', 'Alexandru', 'Stefana', 'Anca', 'Gabriel', 'Ilie', 'Alexandra', 'Ana', 'Ana', 'Romanescu', 'Andreea', 'Georgiana', 'Vlad', 'Dumitru', 'Robert', 'Andra', 'Sebastian', 'Dragos', 'George', 'Mircea', 'Alex', 'Ionel', 'Razvan', 'Victor', 'Alexandru', 'Andrei', 'Daniel', 'Munteanu', 'Adrian', 'Sergiu', 'Bogdan', 'Codrin', 'Razvan', 'Paul', 'Eduard', 'Vlad', 'Nicu', 'Vadim', 'Alexandru', 'Daniel', 'Georgiana', 'Ilie', 'Stefan', 'Ioana', 'Oana', 'Madalina', 'Loredana', 'Irinel', 'Mihaela', 'Xena', 'Andrei', 'Octavian', 'Stefan', 'Iulia', 'Daniel', 'Cosmin', 'Samuel', 'Paul', 'Dan', 'Ilona', 'Vlad', 'Ionut', 'Cosmin', 'Bogdan', 'Cristian', 'Rares', 'Laurentiu', 'Larisa', 'Timofte', 'Raluca', 'Marius', 'Tudor', 'Robert', 'Adrian', 'Andrei', 'Ioan', 'Alexandru', 'Teodor', 'Matei', 'Paula', 'Andrei', 'Dorin', 'Damian', 'Daniel', 'Vlad', 'Stefan', 'Mihai', 'Alexandru', 'Cosmin', 'Alexandru', 'Andrei', 'Andreia', 'Anca', 'Oana', 'Dumitru', 'Ioan', 'Camil', 'Razvan', 'Laura', 'Tudor', 'Simona', 'Marius', 'Marian', 'Irina', 'Iulian', 'Ana', 'Ioana', 'Florin', 'Irina', 'George', 'Alexandru', 'Danut', 'Andrei', 'Giulio', 'Ilie', 'Bogdan', 'Radu', 'Iustin', 'Emanuela', 'Daniel', 'George', 'Rbogdan', 'Mihai', 'Tudor', 'Ionut', 'Diana', 'Paul', 'Marian', 'Andrei', 'Cristina', 'Ioan', 'Victor', 'Stefan', 'Loredana', 'Alexandru', 'Catalin', 'Dorian', 'Elisa', 'Teodor', 'Sebastian', 'Elvis', 'Alexandru', 'Bogdan', 'Elena', 'Andrei', 'Marius', 'Alexandru', 'Stefan', 'Stefana', 'Larisa', 'Gabriel', 'Andreea', 'Gabriel', 'Dragos', 'Beatrice', 'Andrei', 'Vlad', 'Vlad', 'Ana', 'Dan', 'Daniela', 'Robert', 'Antonia', 'Catalin', 'Cristian', 'Cretu', 'Tofan', 'Alexandru', 'Tudor', 'Daniel', 'Alexandru', 'Andrei', 'Andrei', 'Cristina', 'Eugen', 'Alexandru', 'Robert', 'Cristina', 'Dragos', 'Lucian', 'Dorin', 'Costel', 'Ionut', 'Raluca', 'Malina', 'Cristian', 'Vlad', 'Danut', 'Radu', 'Razvan', 'Razvan', 'Cosmin', 'Ovidiu', 'Iulian', 'Alexandru', 'Anca', 'Ioan', 'Matei', 'Andrei', 'Cosmin', 'Delia', 'Ana', 'Diana', 'Codrin', 'Alexandru', 'George', 'Ionut', 'Catalin', 'Andrei', 'Cosmin', 'Ecaterina', 'Raluca', 'Ciprian', 'Madalina', 'Ecaterina', 'Gabriel', 'Teodor', 'Stefan', 'Radu', 'Paula', 'Gabriela', 'Adrian', 'Sergiu', 'Razvan', 'Andreas', 'Ionut', 'Ciprian', 'Stefania', 'Constantin', 'George', 'Loredana', 'Petru', 'Bogdan', 'Daniel', 'Andreea', 'Paul', 'Cristina', 'Lucian', 'Valeriu', 'Alexandru', 'Vasile', 'Rares', 'Nicusor', 'Andreea', 'Maria', 'Vladimir', 'Marius', 'Tamara', 'Diana', 'Ionut', 'Emanuela', 'Georgiana', 'Ana', 'Simona', 'Alexandru', 'Cristian', 'Bogdan', 'Cosmin', 'Denisa', 'Dimitrie', 'Laurentiu', 'Andrei', 'Ilie', 'Vlad', 'Robert', 'Andrei', 'Sergiu', 'Ionut', 'Alina', 'Ioana', 'Simona', 'Daniel', 'Camelia', 'Eleonora', 'Alexandra', 'Stefana', 'Alexandru', 'Aurelian', 'Alexandru', 'Vasile', 'Beatrice', 'Radu', 'George', 'Andreea', 'Adrian', 'Spridonica', 'Ovidiu', 'Darius', 'Anca', 'Iosif', 'Larisa', 'Dragos', 'Teodora', 'Vladut', 'Daniel', 'Daria', 'Rares', 'Theodor', 'Codrina', 'Theodora', 'Ervin', 'Beniamin', 'Vlad', 'George', 'Georgiana', 'Bogdan', 'Fabian', 'Gabriel', 'Adrian', 'Filip', 'Andrei', 'Samuel', 'Sabin', 'Marian', 'Maria', 'Andrei', 'Catalin', 'Cristian', 'Dragos', 'Elena', 'Silviu', 'Anda', 'Claudiu', 'Mihai', 'Andrei', 'Bianca', 'Petrut', 'Georgiana', 'Lucian', 'Alexandru', 'Guler', 'Stefan', 'Alexandru', 'Vlad', 'Victor', 'Alin', 'Gabriel', 'Cristian', 'Valentin', 'Claudia', 'Silviu', 'Rares', 'Georgiana', 'Marius', 'Ion', 'Gabriela', 'Claudia', 'Octavian', 'Alexandru', 'Florin', 'Irina', 'Eduard', 'Andrei', 'Mirela', 'Cezar', 'Manuela', 'Andreea', 'Andra', 'Dragos', 'Bogdan', 'George', 'Daniel', 'Mihail', 'Teofil', 'Andrei', 'Stefana', 'Nicusor', 'Dan', 'Gheorghe', 'George', 'Ioana', 'Cristian', 'Bogdan', 'Vasilica', 'Iuliana', 'George', 'Ioan', 'Vlad', 'Andrei', 'Sanziana', 'Radu', 'Simona', 'Stefan', 'Corneliu', 'Georgiana', 'Liviu', 'Robert', 'Vladut', 'Sabina', 'Andrei', 'Rolland', 'Matei', 'Stefan', 'Alexandru', 'Ioana', 'Cezar', 'Mihai', 'Mihnea', 'Rares', 'Razvan', 'Cosmin', 'Nicolae', 'Gheorghe', 'Ana');
  FOR index_ IN 1..10000 LOOP
    v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
    v_first_name:=first_names(v_random_number);
    v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
    v_last_name:=last_names(v_random_number);
    v_birthdate:=ADD_MONTHS(TO_DATE('01 01 1950','dd mm yyyy'),DBMS_RANDOM.VALUE(1,550));
    v_birthdate:=v_birthdate+DBMS_RANDOM.VALUE(0,32);
    IF v_first_name LIKE '%a' THEN
        v_cnp:=2;
      ELSE
        v_cnp:=1;
    END IF;
    v_year:=TRUNC(DBMS_RANDOM.VALUE(49,99));
    v_month:=TRUNC(DBMS_RANDOM.VALUE(1,12));
    v_day:=TRUNC(DBMS_RANDOM.VALUE(1,28));
    v_complete_cnp:=v_cnp||v_year;
    
    IF v_month<10 THEN
      v_complete_cnp:=v_complete_cnp||'0'||v_month;
    ELSE
      v_complete_cnp:=v_complete_cnp||v_month;
    END IF;
    
    IF v_day<10 THEN
      v_complete_cnp:=v_complete_cnp||'0'||v_day;
    ELSE
      v_complete_cnp:=v_complete_cnp||v_day;
    END IF;
    v_complete_cnp:=v_complete_cnp||seq_CNP.nextval;
    IF DBMS_RANDOM.VALUE(0,1)<0.4 THEN
      v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
      v_middle_name:=first_names(v_random_number);
      WHILE (v_middle_name LIKE '%a' AND v_first_name NOT LIKE '%a') OR (v_middle_name NOT LIKE '%a' AND v_first_name LIKE '%a') LOOP
        v_random_number:=TRUNC(DBMS_RANDOM.VALUE(1,500));
        v_middle_name:=first_names(v_random_number);
      END LOOP;
      
      INSERT INTO VISITORS VALUES(v_complete_cnp,v_first_name,v_middle_name,v_last_name,v_birthdate,NULL,NULL,DEFAULT,0);
    ELSE
      INSERT INTO VISITORS VALUES(v_complete_cnp,v_first_name,NULL,v_last_name,v_birthdate,NULL,NULL,DEFAULT,0);
    END IF;
  END LOOP;
END;
/
DECLARE
  v_convict_id NUMBER;
  v_nr_of_visits NUMBER;
  v_visit_date DATE;
BEGIN
  FOR index_ IN 1..10000 LOOP
    v_nr_of_visits:=TRUNC(DBMS_RANDOM.VALUE(0,56));
    FOR index_2_ IN 1..v_nr_of_visits LOOP
      INSERT INTO VISITS VALUES(seq_VISITS.nextval,index_,DEFAULT,NULL,NULL,NULL,NULL,NULL,NULL,0);
    END LOOP;
  END LOOP;
END;
/
DECLARE
  TYPE ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  CURSOR visitor_ids IS SELECT cnp FROM VISITORS;
  vis_ids ids;
  v_nr_of_visits NUMBER;
  v_visitor_id NUMBER;
  v_index NUMBER;
BEGIN
  v_index:=0;
  FOR line IN visitor_ids LOOP
    vis_ids(v_index):=line.cnp;
    v_index:=v_index+1;
  END LOOP;
  SELECT COUNT(1) INTO v_nr_of_visits FROM VISITS;
  FOR index_ IN 1..v_nr_of_visits LOOP
    INSERT INTO PRISONER_VISITORS VALUES(index_,vis_ids(TRUNC(DBMS_RANDOM.VALUE(1,10000))));
  END LOOP;
END;