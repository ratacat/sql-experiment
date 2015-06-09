


create table owners (
	owner_id serial primary key,
	name varchar(255),
	age integer
)

create table properties ( 
	property_id serial primary key,
	name varchar(255),
	num_units integer,
	owner_id integer references owners(owner_id)
)

-- 1. Show all the tables.
\dt
-- 2. Show all the users. 
\du
-- 3. Show all the data in the owners table.
\d+ owners
-- 4. Show the names of all owners. 
select name from owners;
-- 5. Show the ages of all of the owners in ascending order. 
select age from owners order by age asc;
-- 6. Show the name of an owner whose name is Donald. 
select name from owners where name = 'Donald';
-- 7. Show the age of all owners who are older than 30.
select age from owners where age > 30; 
-- 8. Show the name of all owners whose name starts with an E.
select name from owner where lower(name) similar to '(e)%'; 
-- 9. Add an owner named John who is 33 years old to the owners table.
insert into owners (name,age) values ('John',33);
-- 10. Add an owner named Jane who is 43 years old to the owners table. 
insert into owners (name,age) values ('Jane',43);
-- 11. Change Jane's age to 30. 
update owners set age = 30 where name = 'Jane';
-- 12. Change Jane's name to Janet. 
update owners set name = 'Janet' where name = 'Jane';
-- 13. Add a property named Archstone that has 20 units. 
insert into properties (name,num_units,owner_id) values ('Archstone', 20, 12);
-- 14. Delete the owner named Jane. 
delete from owners where name = 'Jane';
-- 15. Show all of the properties in alphabetical order that are not named Archstone and do not have an id of 3 or 5. 
select * from properties where name != 'Archstone' and property_id != 3 and property_id != 5;
-- 16. Count the total number of rows in the properties table.
select count(*) from properties;
-- 17. Show the highest age of all owners.
select max(age) from owners;
-- 18. Show the names of the first three owners in your owners table.
select * from owners limit 3;
-- 19. Create a foreign key that references the owner_id in the owners table and forces the constraint ON DELETE NO ACTION. 
alter table owners alter column owner_id integer references owners(owner_id);
-- 20. Show all of the information from the owners table and the properties table in one joined table.  
select (o.id,name,age) from owners full join properties on property_id=o.id;

ERROR:  missing FROM-clause entry for table "o"
LINE 1: ...e,age) from owners full join properties on property_id=o.id;