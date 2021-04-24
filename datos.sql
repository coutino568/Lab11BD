
---definicion tablas 

create table producto (
	idmodelo int primary key,
	modelo varchar (30),
	fabricante varchar(20),
	tipo varchar(25)
		
)



create table pc (
	idpc int primary key,
	idmodelo int,
	velocidad float,
	ram float,
	disco float,
	precio float,
	constraint refpc_producto foreign key (idmodelo) references producto(idmodelo)
)




----------- inserts
insert into producto values 
(1,'inspirion','Dell','PC'),
(2,'inspirion Ti','Dell','Laptop'),
(3,'raptor','Asus','PC'),
(4,'predator','Lenovo','PC'),
(5,'cannon xp','HP','Impresora'),
(6,'cannon 3000','HP','Impresora'),
(7,'predator supreme','HP','PC'),
(8,'aligator','Dell','Laptop'),
(9,'razor x','Asus','Laptop')



insert into pc
(idpc, idmodelo , velocidad, ram ,disco ,precio) values 
(1,1,2500,8000,1000,500),
(2,1,3000,8000,1000,650),
(3,2,3000,16000,500,800),
(4,3,2500,8000,1000,900),
(5,4,3000,16000,500,890),
(6,4,1500,16000,1000,550),
(7,7,1200,8000,1000,780),
(8,8,6000,16000,1000,1200),
(9,9,4000,16000,1000,800),
(10,7,1500,8000,850,850),
(11,5,1000,1000,150,300),
(12,6,1000,1000,200,250)



--------------- PREGUNTAS 


--PREGUNTA 1 :
--pt 1 : querry que se necesita hacer 

select pc.idmodelo, modelo, precio from pc
join producto
on pc.idmodelo = producto.idmodelo
where velocidad = 2500 and ram = 8000

--pt 2: proceso 


create or replace function search1(myram int, myspeed int)
	returns table (idmodelo numeric, modelo varchar, precio numeric)
	as 
	$$
	select pc.idmodelo, modelo, precio from pc
	join producto
	on pc.idmodelo = producto.idmodelo
	where velocidad = myspeed and ram = myram
	$$
language sql



----------------------
--PREGUNTA 2 :
--pt 1 : querry que se necesita hacer 

select count (*) from producto where idmodelo= 1
delete from pc where idmodelo = 1
delete from producto where idmodelo = 1



--pt 2: proceso 

Create Procedure delete1 ( idmodel INT)
language sql
as $$
	delete FROM pc WHERE idmodelo=idmodel;
	delete from producto where idmodelo = idmodel;
$$;



---------------------
--PREGUNTA 3 :
--pt 1 : querry que se necesita hacer 



--pt 2: proceso 





--------------------
--PREGUNTA 4 :
--pt 1 : querry que se necesita hacer 




--pt 2: proceso 