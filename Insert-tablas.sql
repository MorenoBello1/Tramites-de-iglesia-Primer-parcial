
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           INTEGER              not null,
   ID_PADRINAJE         INTEGER,
   NOMBRE_C             VARCHAR2(40),
   APELLIDO_C           VARCHAR2(40),
   CEDULA_C             VARCHAR2(10),
   DIRECCION_C          VARCHAR2(35),
   CORREO_C             VARCHAR2(40),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on CLIENTE (
   ID_PADRINAJE ASC
);

/*==============================================================*/
/* Table: EXTRASERVICIO                                         */
/*==============================================================*/
create table EXTRASERVICIO 
(
   ID_EXTRASERVICIO     INTEGER              not null,
   ID_SACRAMENTO        INTEGER,
   TIPO_EXS             VARCHAR2(60),
   PAGO_EXS             NUMBER(6,2),
   FECHA_EXS            DATE,
   constraint PK_EXTRASERVICIO primary key (ID_EXTRASERVICIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on EXTRASERVICIO (
   ID_SACRAMENTO ASC
);

/*==============================================================*/
/* Table: PADRINAJE                                             */
/*==============================================================*/
create table PADRINAJE 
(
   ID_PADRINAJE         INTEGER              not null,
   NOMBRE_P             VARCHAR2(40),
   APELLID_P            VARCHAR2(40),
   CEDULA_P             VARCHAR2(10),
   TIPO_P               VARCHAR2(40),
   constraint PK_PADRINAJE primary key (ID_PADRINAJE)
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL 
(
   ID_PERSONAL          INTEGER              not null,
   ID_ROL               INTEGER,
   APELLIDO_P           VARCHAR2(40),
   FECHANACIMIENTO_P    DATE,
   CORREO_P             VARCHAR2(30),
   TELEFONO1_P          VARCHAR2(10),
   TELEFONO2_P          VARCHAR2(10),
   INGRESOLABORAL_P     DATE,
   NOMBRE_P             VARCHAR2(40),
   CEDULA_P             VARCHAR2(10),
   constraint PK_PERSONAL primary key (ID_PERSONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on PERSONAL (
   ID_ROL ASC
);

/*==============================================================*/
/* Table: REQUISITO                                             */
/*==============================================================*/
create table REQUISITO 
(
   ID_REQUISITO         INTEGER              not null,
   ID_SACRAMENTO        INTEGER,
   NOMBRE_R             VARCHAR2(100),
   constraint PK_REQUISITO primary key (ID_REQUISITO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on REQUISITO (
   ID_SACRAMENTO ASC
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL 
(
   ID_ROL               INTEGER              not null,
   ID_SACRAMENTO        INTEGER,
   NOMBRETIPO_ROL       VARCHAR2(40),
   constraint PK_ROL primary key (ID_ROL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on ROL (
   ID_SACRAMENTO ASC
);

/*==============================================================*/
/* Table: SACRAMENTO                                            */
/*==============================================================*/
create table SACRAMENTO 
(
   ID_SACRAMENTO        INTEGER              not null,
   ID_SOLICITUD         INTEGER,
   ID_PADRINAJE         INTEGER,
   SAC_ID_SACRAMENTO    INTEGER,
   TIPO_S               VARCHAR2(30),
   PRECIO_S             NUMBER(6,2),
   FECHA_S              DATE,
   constraint PK_SACRAMENTO primary key (ID_SACRAMENTO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on SACRAMENTO (
   ID_SOLICITUD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on SACRAMENTO (
   ID_PADRINAJE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on SACRAMENTO (
   SAC_ID_SACRAMENTO ASC
);

/*==============================================================*/
/* Table: SOLICITUD_DE_CLIENTE                                  */
/*==============================================================*/
create table SOLICITUD_DE_CLIENTE 
(
   ID_SOLICITUD         INTEGER              not null,
   ID_CLIENTE           INTEGER,
   FECHA_SC             DATE,
   FECHA_EJECUACION_SC  DATE,
   constraint PK_SOLICITUD_DE_CLIENTE primary key (ID_SOLICITUD)
);

/*==============================================================*/
/* Index: R4_FK                                                 */
/*==============================================================*/
create index R4_FK on SOLICITUD_DE_CLIENTE (
   ID_CLIENTE ASC
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_PADRINAJ foreign key (ID_PADRINAJE)
      references PADRINAJE (ID_PADRINAJE);

alter table EXTRASERVICIO
   add constraint FK_EXTRASER_RELATIONS_SACRAMEN foreign key (ID_SACRAMENTO)
      references SACRAMENTO (ID_SACRAMENTO);

alter table PERSONAL
   add constraint FK_PERSONAL_RELATIONS_ROL foreign key (ID_ROL)
      references ROL (ID_ROL);

alter table REQUISITO
   add constraint FK_REQUISIT_RELATIONS_SACRAMEN foreign key (ID_SACRAMENTO)
      references SACRAMENTO (ID_SACRAMENTO);

alter table ROL
   add constraint FK_ROL_RELATIONS_SACRAMEN foreign key (ID_SACRAMENTO)
      references SACRAMENTO (ID_SACRAMENTO);

alter table SACRAMENTO
   add constraint FK_SACRAMEN_RELATIONS_SACRAMEN foreign key (SAC_ID_SACRAMENTO)
      references SACRAMENTO (ID_SACRAMENTO);

alter table SACRAMENTO
   add constraint FK_SACRAMEN_RELATIONS_PADRINAJ foreign key (ID_PADRINAJE)
      references PADRINAJE (ID_PADRINAJE);

alter table SACRAMENTO
   add constraint FK_SACRAMEN_RELATIONS_SOLICITU foreign key (ID_SOLICITUD)
      references SOLICITUD_DE_CLIENTE (ID_SOLICITUD);

alter table SOLICITUD_DE_CLIENTE
   add constraint FK_SOLICITU_R4_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

--CLIENTE
insert into  Cliente values(1,1,'Manuel','1415702284','Montecristi','ManuelStacia@gmail.com','Valenzuela');
insert into  Cliente values(2,2,'Jean','1215402118','calle 15','Jean12@gmail.com','Castro');
insert into  Cliente values(3,3,'Carlos','1315201182','calle 13','Carlos131@gmail.com','Campaña');
insert into  Cliente values(4,4,'Carmen','1213102284','Altagracia','CarmenLopez@gmail.com','Lopez');
insert into  Cliente values(5,5,'Anahi','1415002134','Calle 8','Anahi2208@gmail.com','Bello');
insert into  Cliente values(6,6,'Maria','1311003281','Centro','MariaManue@gmail.com','Mora');
insert into  Cliente values(7,7,'Luis','1415702211','Los Esteros','Barc1255_@gmail.com','Stile');
insert into  Cliente values(8,8,'Alexis','1417701184','Montalvan','AleJan1@gmail.com','Campaña');
insert into  Cliente values(9,9,'Jeremy','1235401112','ave San pedro','Jeremias@gmail.com','Romero');
insert into  Cliente values(10,10,'Karen','1415702284','Montalvan','KarenVale@gmail.com','Valezuela');
insert into  Cliente values(11,11,'Anthony','1315791234','San Lucas','TonyBurg@gmail.com','Lopez');
insert into  Cliente values(12,12,'Mariana','1435701212','Montecristi','Mariablue@gmail.com','Romero');
insert into  Cliente values(13,6,'Felipe','1312502145','Albai','FelipeAso12@gmail.com','Yatra');
--SOLICITUD DE CLIENTE
insert into SOLICITUD_DE_CLIENTE values (1,1,'11-07-2022','01-06-2022');
insert into SOLICITUD_DE_CLIENTE values (2,2,'12-01-2022','22-12-2021');
insert into SOLICITUD_DE_CLIENTE values (3,3,'01-07-2021','24-06-2021');
insert into SOLICITUD_DE_CLIENTE values (4,4,'26-02-2022','02-02-2022');
insert into SOLICITUD_DE_CLIENTE values (5,5,'10-11-2020','12-01-2020');
insert into SOLICITUD_DE_CLIENTE values (6,6,'17-04-2019','24-03-2019');
insert into SOLICITUD_DE_CLIENTE values (7,7,'30-11-2021','02-11-2021');
insert into SOLICITUD_DE_CLIENTE values (8,8,'01-06-2022','17-05-2022');
insert into SOLICITUD_DE_CLIENTE values (9,9,'02-06-2021','01-03-2021');
insert into SOLICITUD_DE_CLIENTE values (10,10,'22-02-2018','17-01-2018');
insert into SOLICITUD_DE_CLIENTE values (11,11,'02-01-2022','01-12-2021');
insert into SOLICITUD_DE_CLIENTE values (12,12,'03-01-2022','20-12-2021');
insert into SOLICITUD_DE_CLIENTE values (13,13,'20-12-2019','12-11-2019');

--SACRAMENTO
insert into Sacramento (id_sacramento) values(1);
insert into Sacramento values (1,1,1,1,'Bautizo',150,'12-07-2022');
insert into Sacramento values (2,2,2,2,'Bautizo',150,'12-01-2022');
insert into Sacramento values (3,3,3,3,'Confirmacion',220,'01-07-2021');
insert into Sacramento values (4,4,4,4,'Confirmacion',220,'26-02-2022');
insert into Sacramento values (5,5,5,5,'Matrimonio',220,'10-11-2020');
insert into Sacramento values (6,6,6,6,'Bautizo',150,'17-04-2019');
insert into Sacramento values (7,7,7,7,'Bautizo',150,'30-11-2021');
insert into Sacramento values (8,8,8,8,'Matrimonio',220,'22-07-2022');
insert into Sacramento values (9,9,9,9,'Eucaristia',280,'12-08-2021');
insert into Sacramento values (10,10,10,10,'Matrimonio',220,'22-02-2018');
insert into Sacramento values (11,11,11,11,'Confirmacion',220,'02-02-2022');
insert into Sacramento values (12,12,12,12,'Bautizo',150,'03-01-2022');
insert into Sacramento values (13,13,6,13,'Confirmacion',220,'21-12-2019');
--EXTRASERVICIO
insert into Extraservicio values(1,1,'Coro',200,'12-07-2022');
insert into Extraservicio values(2,1,'Globos',200,'12-01-2022');
insert into Extraservicio values(3,2,'Coro',200,'12-07-2022');
insert into Extraservicio values(4,3,'Arreglo',200,'01-07-2021');
insert into Extraservicio values(5,4,'Coro',200,'26-02-2022');
insert into Extraservicio values(6,5,'Coro',200,'26-02-2022');
insert into Extraservicio values(7,6,'Coro',200,'10-11-2020');
insert into Extraservicio values(8,7,'Arreglo',200,'17-04-2019');
insert into Extraservicio values(9,8,'Florales',200,'30-11-2021');
insert into Extraservicio values(10,9,'Coro',200,'22-07-2022');
insert into Extraservicio values(11,10,'Arreglo',200,'12-08-2021');
insert into Extraservicio values(12,11,'Arrelgo',200,'02-02-2022');
insert into Extraservicio values(13,12,'Florales',200,'21-12-2019');
--Requisito
insert into requisito values (1,1,'bautizo,confirmacion,matrimonio');
insert into requisito values (2,2,'bautizo,confirmacion,matrimonio');
insert into requisito values (3,3,'Bautizo,Primera comunión,may 11 años');
insert into requisito values (4,4,'Bautizo,Primera comunión,may 11 años');
insert into requisito values (5,5,'Acta Bautizo,confirmacion,DNI');
insert into requisito values (6,6,'bautizo,confirmacion,matrimonio');
insert into requisito values (7,7,'bautizo,confirmacion,matrimonio');
insert into requisito values (8,8,'Acta Bautizo,confirmacion,DNI');
insert into requisito values (9,9,'Bautizado, Catequesis, Confesion');
insert into requisito values (10,10,'Acta Bautizo,confirmacion,DNI');
insert into requisito values (11,11,'Bautizo,Primera comunión,may 11 años');
insert into requisito values (12,12,'bautizo,confirmacion,matrimonio');
insert into requisito values (13,13,'Bautizo,Primera comunión,may 11 años');
--PERSONAL
insert into PERSONAL  values (1,1,'Zamora','22-08-1965','Zamora1965@hotmail.com','0989947291','0987046477','12-02-1995','Carlos','1313257901');
insert into PERSONAL  values (2,2,'Paredez','01-02-1990','Barcelo123@hotmail.com','0991942291',NULL,'22-01-2000','Augusto','1412217802');
insert into PERSONAL  values (3,3,'Alvarado','12-04-1982','Alvarado_@hotmail.com','0919942211','0991046473','12-12-2001','Martina','1423192101');
insert into PERSONAL  values (4,4,'Padilla','24-10-1997','PadillaSinpadilla@hotmail.com','0989147220','0983016272','02-09-2000','Maria','1316721611');
insert into PERSONAL  values (5,5,'Mendoza','29-01-1969','Mendoza@gmail.com','0983941290','0997046487','30-01-1995','Paula','1513252990');
insert into PERSONAL  values (6,6,'Toledo','02-07-1970','ZToled@hotmail.com','0988927291','0987142412','01-02-1990','Jalia','1411221601');
insert into PERSONAL  values (7,7,'Ramirez','12-01-1977','Ramirez22909@hotmail.com','0982942201','0997046156','10-02-1999','Emma','1412267101');
insert into PERSONAL  values (8,8,'Arena','21-03-1988','Arena_123_2@hotmail.com','0999912210',NULL,'22-08-2000','Valeria','1314150001');
insert into PERSONAL  values (9,9,'Mendoza','13-12-1989','MendozaCa@gmail.com','0989911295',NULL,'01-05-1998','Daniela','1314153109');
insert into PERSONAL  values (10,10,'Vargas','11-02-1977','Varg965@hotmail.com','0989922240',NULL,'27-01-1998','Alba','1414220901');
insert into PERSONAL  values (11,11,'Vargas','02-08-1979','BbTUmba_@gmail.com','0989947293',NULL,'12-05-1999','Sara','1314152001');
insert into PERSONAL  values (12,12,'Balentin','12-08-1988','Balent@hotmail.com','0919947281','0981456421','16-07-1999','Carlos','1314202829');
insert into PERSONAL  values (13,13,'Merino','02-10-1990','Merin_A12@gmail.com','0989147399','0988801498','29-05-1995','Noa','1413221802');

 
--PADRINAJE 
Insert into padrinaje values(1,'Sebastian','Moreira','1314857210','Padrino');
Insert into padrinaje values(2,'Carlos','Peralta','1412857154','Padrino');
Insert into padrinaje values(3,'Marlon','Paredez','1314821290','Padrino');
Insert into padrinaje values(4,'Mario','Cardenas','1325857220','Padrino');
Insert into padrinaje values(5,'Alex','Polanco','1484857211','Testigo');
Insert into padrinaje values(6,'Sebas','Nuñez','1304572102','Padrino');
Insert into padrinaje values(7,'Santy','Palacio','1314843721','Padrino');
Insert into padrinaje values(8,'Sariel','Heredia','1314857210','Testigo');
Insert into padrinaje values(9,'Uriel','Moreira','1214847212','Padrino');
Insert into padrinaje values(10,'Sebastian','Moreira','1314857210','Testigo');
Insert into padrinaje values(11,'Mario','Cardenas','1325857220','Padrino');
Insert into padrinaje values(12,'Yelena','Chancay','1313351201','Padrino');
--ROL
insert into ROL values(1,1,'Sacerdote');
insert into ROL values(2,2,'Sacerdote');
insert into ROL values(3,3,'Sacerdote');
insert into ROL values(4,4,'Parroco');
insert into ROL values(5,5,'Parroco');
insert into ROL values(6,6,'Sacerdote');
insert into ROL values(7,7,'Monagillo');
insert into ROL values(8,8,'Sacerdote');
insert into ROL values(9,9,'Obispo');
insert into ROL values(10,10,'Sacerdote');
insert into ROL values(11,11,'Parroco');
insert into ROL values(12,12,'Parroco');
insert into ROL values(13,13,'Sacerdote');

 