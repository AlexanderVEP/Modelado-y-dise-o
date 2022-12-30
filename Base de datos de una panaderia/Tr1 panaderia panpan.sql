create database panaderia
use panaderia
---Tabla panpan
create table panpan(
clave_pa int,
nom_pa varchar(50),
ubic_pa varchar(80),
hora_pa datetime,
telf_pa bigint,
constraint pk_pa primary key (clave_pa)
)
insert into panpan values(1,'la merced','calle lima','12:00','12345678')
insert into panpan values(2,'la esquina','avenida los alcanfores','10:00','987654321')
insert into panpan values(3,'los mas pedidos','mayo','10:00','654987123')
insert into panpan values(4,'san ramon','miraflores','11:00','258741963')
insert into panpan values(5,'perene','puntallacu','14:00','963852741')
select * from panpan

--tabla proovedor
create table proovedor(
clave_pro int,
nom_pro varchar(50),
ubic_pro varchar(80),
telf_pro bigint,
constraint pk_pro primary key (clave_pro)
)
insert into proovedor values(1536,'maria','lima','12345678')
insert into proovedor values(2789,'juana','chiclayo','987654321')
insert into proovedor values(3874,'lucia','pucallpa','654987123')
insert into proovedor values(4154,'lucho','miraflores','258741963')
insert into proovedor values(5742,'marcos','puntallacu','963852741')
select * from proovedor


---tabla empleados
create table empleados(
clave_emp int,
nom_emp varchar(50),
ape_emp varchar(50),
edad_emp int,
gen_emp varchar(50),
cargo_emp varchar(80),
constraint pk_emp primary key (clave_emp)
)
insert into empleados values (1521,'luis','vilca','20','masculino','panadero')
insert into empleados values (2545,'angel','martin','22','masculino','amasador')
insert into empleados values (3785,'miguel','smith','25','masculino','decorador')
insert into empleados values (4698,'luigi','james','27','masculino','cajero')
insert into empleados values (5783,'marcela','torres','30','femenino','vendedora')
select * from empleados

---tabla suministros
create table suministros(
clave_su int,
nom_su varchar(80),
constraint pk_csum primary key (clave_su)
)
insert into suministros values(1,'harina')
insert into suministros values(2,'huevo')
insert into suministros values(3,'aceite')
insert into suministros values(4,'azucar')
insert into suministros values(5,'leche')
insert into suministros values(6,'moldes')
insert into suministros values(7,'matequilla')
insert into suministros values(8,'chocolate')
insert into suministros values(9,'queso')
insert into suministros values(10,'guantes')
select * from suministros

--tabla de equipos
create table equipos(
clave_eq int,
nom_eq varchar(50),
constraint pk_eq primary key (clave_eq)
)
insert into equipos values (1,'horno')
insert into equipos values (2,'vandejas')
insert into equipos values (3,'mesas')
insert into equipos values (4,'batidora')
insert into equipos values (5,'moldes')
select *  from equipos

--tabla cliente
create table cliente(
clave_cli int,
nom_cli varchar(50),
apell_cli varchar(50),
dir_cli varchar(90),
ci_cli bigint,
constraint pk_ccli primary key (clave_cli)
)
insert into cliente values (1,'lucia','nadia','lima','022345')
insert into cliente values (2,'marcelo','nuñez','huancayo','021345')
insert into cliente values (3,'lucho','gonzales','lima','052345')
insert into cliente values (4,'marcela','gomez','chiclayo','042345')
insert into cliente values (5,'roberto','pusanes','chiclayo','082345')
select *  from cliente

--tabla detalle de venta
create table venta(
clave_ven int,
preci_ven float,
total_ven int,
constraint pk_cven primary key (clave_ven)
)

insert into venta values (1,'12','15')
insert into venta values (2,'17','18')
insert into venta values (3,'16','14')
insert into venta values (4,'13','27')
insert into venta values (5,'19','35')
select *  from venta

--tabla pago
create table pago(
clave_pago int,
efec_pago float,
tarjet_pago float,
constraint pk_cpago primary key (clave_pago)
)

insert into pago values (1,'5','15')
insert into pago values (2,'8','88')
insert into pago values (3,'3','84')
insert into pago values (4,'1','67')
insert into pago values (5,'4','35')
select *  from pago

--tabla factura en efectivo
create table factura(
clave_fac int,
nom_fac varchar(50),
dir_fac varchar(50),
fe_fac datetime,
constraint pk_cfac primary key (clave_fac)
)

insert into factura values (1,'alex','junin','10:00')
insert into factura values (2,'juana','pucallpa','14:00')
insert into factura values (3,'lucia','yunguyu','10:00')
insert into factura values (4,'matias','lima','10:00')
insert into factura values (5,'teresa','huancayo','10:00')
select *  from factura

--tabla factura con tarjeta
create table tarjeta(
clave_tar int,
nom_tar varchar(100),
corr_tar varchar,
telf_tar bigint,
constraint pk_ctar primary key (clave_tar)
)

insert into tarjeta values (1,'maria','alejadro@gmail.com','15412454')
insert into tarjeta values (2,'lucha','maria@gmail.com','4557450')
insert into tarjeta values (3,'rosmery','marcus@gmail.com','154454512')
insert into tarjeta values (4,'andrea','lucia@gmail.com','154845452')
insert into tarjeta values (5,'felicia','mateo@gmail.com','47414542')
select *  from tarjeta

--tabla panaderia--trabajador
create table pan_tra(
clave_pa3 int,
clave_tra2 int,
constraint fk_fpa3 foreign key (clave_pa3) references panpan(clave_pa),
constraint fk_fpa2 foreign key (clave_tra2) references empleados (clave_emp)
)

insert into pan_tra values (1,15)
insert into pan_tra values (2,88)
insert into pan_tra values (3,84)
insert into pan_tra values (4,6)
insert into pan_tra values (5,35)
select *  from pan_tra

--tabka panaderia-proovedor
create table pan_pro(
clave_pa1 int,
clave_pro1 int,
constraint fk_fpa1 foreign key (clave_pa1) references panpan (clave_pa),
constraint fk_fpro1 foreign key (clave_pro1) references proovedor (clave_pro)
)
insert into pan_pro values (11,15)
insert into pan_pro values (27,88)
insert into pan_pro values (35,84)
insert into pan_pro values (64,6)
insert into pan_pro values (57,35)
select *  from pan_pro

--tabla empleados-cliente
create table cli_emp(
clave_cli int,
clave_emp int,
constraint fk_fcli1 foreign key (clave_cli) references cliente (clave_cli),
constraint fk_emp1 foreign key (clave_emp) references empleados (clave_emp)
)
insert into cli_emp values (21,55)
insert into cli_emp values (97,48)
insert into cli_emp values (65,64)
insert into cli_emp values (34,65)
insert into cli_emp values (67,31)
select *  from cli_emp

--tabla detalle venta-cliente
create table ven_cli(
clave_ven1 int,
clave_cli2 int,
constraint fk_fven1 foreign key (clave_ven1) references venta (clave_ven),
constraint fk_fcli2 foreign key (clave_cli2) references cliente (clave_cli)
)
insert into ven_cli values (1,5)
insert into ven_cli values (2,4)
insert into ven_cli values (3,6)
insert into ven_cli values (4,6)
insert into ven_cli values (5,3)
select *  from ven_cli

--tabla cliente-pago
create table cli_pag(
clave_cli3 int,
clave_pago1 int,
constraint fk_fcli3 foreign key (clave_cli3) references cliente (clave_cli),
constraint fk_fpago1 foreign key (clave_pago1) references pago (clave_pago)
)
insert into cli_pag values (1,5)
insert into cli_pag values (2,8)
insert into cli_pag values (3,4)
insert into cli_pag values (4,5)
insert into cli_pag values (5,1)
select *  from cli_pag

--tabla pago-factura efectivo
create table pag_fac(
clave_pago2 int,
clave_fac1 int,
constraint fk_fpago2 foreign key (clave_pago2) references pago (clave_pago),
constraint fk_ffac1 foreign key (clave_fac1) references factura (clave_fac)
)
insert into pag_fac values (1,55)
insert into pag_fac values (2,68)
insert into pag_fac values (3,34)
insert into pag_fac values (4,15)
insert into pag_fac values (5,11)
select *  from pag_fac

--tabla pago tarjeta
create table pag_tar(
clave_pago3 int,
clave_tar1 int,
constraint fk_fpago3 foreign key (clave_pago3) references pago (clave_pago),
constraint fk_ftar1 foreign key (clave_tar1) references tarjeta (clave_tar)
)
insert into pag_tar values (11,55)
insert into pag_tar values (22,68)
insert into pag_tar values (37,34)
insert into pag_tar values (45,15)
insert into pag_tar values (56,11)
select *  from pag_tar

--comando para hacer cambios
update panpan
set nom_pa = 'alexander'
where clave_pa = 2
select*from panpan 
----------------------------------
update cliente
set apell_cli = 'nuñez'
where clave_cli = 2
select*from cliente 
----------------------------------
update empleados
set nom_emp = 'luis'
where clave_emp = 1521
select*from empleados 
----------------------------------
update proovedor
set nom_pro = 'maria'
where clave_pro = 1536
select*from proovedor 
----------------------------------
update factura
set dir_fac = 'yunguyu'
where clave_fac = 3
select*from factura 
----------------------------------

select nom_pa,nom_cli
from panpan  inner join cliente on panpan. clave_pa=cliente.clave_cli 
select*from panpan
----------------------------------------------------------------------
select apell_cli,nom_pa
from cliente  inner join panpan on panpan. clave_pa=cliente.clave_cli 
select*from cliente
----------------------------------------------------------------------
select ubic_pro,nom_emp
from proovedor  inner join empleados on proovedor. clave_pro=empleados.cargo_emp 
select*from proovedor
----------------------------------------------------------------------
select nom_cli,nom_emp
from cliente  inner join empleados on cliente. clave_cli=empleados.clave_emp 
select*from cliente
----------------------------------------------------------------------
--fila de comando para unir tablas
select nom_pa,nom_cli
from panpan inner join cliente on panpan.clave_pa=cliente.clave_cli
----------------------------------------------------------------------
select nom_emp,edad_emp,nom_pa
from empleados  inner join panpan on empleados. clave_emp=panpan.clave_pa 
where edad_emp>5
----------------------------------------------------------------------
select nom_pro,nom_emp
from proovedor  inner join empleados on proovedor. clave_pro=empleados.clave_emp 
where nom_emp='angel'
----------------------------------------------------------------------






select * from panpan
select * from proovedor
select * from empleados
select * from suministros
select *  from equipos
select *  from cliente
select *  from venta
select *  from pago
select *  from factura
select *  from tarjeta

select*from cliente order by clave_cli desc

