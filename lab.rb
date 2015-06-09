require 'pg'
require 'ffaker'
db = PG.connect(dbname: "apartment_lab")

def init (dbase)
	dbase.exec("create table owners ( "+
		"owner_id serial primary key,"+
		"name varchar(255),"+
		"age integer"+
		")")

	dbase.exec("create table properties ( "+
		"property_id serial primary key,"+
		"name varchar(255),"+
		"num_units integer,"+
		"owner_id integer references owners(owner_id)"+
		")")

end

def addOwner(dbase)
	dbase.exec("insert into owners (name,age) values ($1,$2)",[FFaker::Name.name,19+rand(70)])
end

# 10.times do 
# 	addOwner(db)
# end

def addProperty(dbase)
	dbase.exec("insert into properties (name,num_units,owner_id) values ($1,$2,$3)",[FFaker::AddressUS.street_address,1+rand(5),1+rand(9)])
end

# 10.times do
# 	addProperty(db)
# end