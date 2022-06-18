create table ESTUDIANTE
(
    ID_ESTUDIANTE INTEGER,
    NOMBRE_EST    VARCHAR2(40),
    FECHA_INGRESO_EST DATE,
    NUMERO_REPET_EST NUMERIC,
    constraint PK_ESTUDIANTE primary key (ID_ESTUDIANTE)
);

CREATE TABLE MATRICULA
(
    ID_MATRICULA INTEGER,
    ID_ESTUDIANTE INTEGER,
    FECHA_MATRI DATE,
    NIVEL_MATRI NUMERIC,
    constrainT PK_MATRICULA primary key (ID_MATRICULA)
);
insert into estudiante values (1,'Ariel','01/02/2001',0);
insert into matricula values (1,1,'01/02/2001',1);
insert into matricula values (2,1,'01/02/2002',1);
insert into matricula values (3,1,'01/02/2003',1);
insert into matricula values (4,1,'01/02/2004',1);

create or replace trigger ControlMatri
BEFORE INSERT OR DELETE on Matricula
FOR EACH ROW
declare valor number(4):=0;
PRAGMA AUTONOMOUS_TRANSACTION;
begin
    IF INSERTING THEN
        select COUNT(*) into valor from matricula where Id_Estudiante = :new.Id_Estudiante and Nivel_matri = :new.nivel_matri;
        If valor>=1 then
        update estudiante set Numero_repet_est = valor  where Id_estudiante = :new.Id_Estudiante;
        end if;
    ELSIF  DELETING THEN
     select COUNT(*) into valor from matricula where Id_Estudiante = :old.Id_Estudiante and Nivel_matri = :old.nivel_matri;
        If valor>1 then
            update estudiante set Numero_repet_est = Numero_repet_est-1 where Id_estudiante = :old.Id_Estudiante;
            end if;
        end if;
    commit;
end;