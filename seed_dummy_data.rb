require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/task'
require_relative 'models/todo'


# seek data for user
insert into Users (username, email, password_digest) values ('Jenny Black', '1@1.com', 'pudding');



# seed data for plants

insert into Plants (common_name, scientific_name, image_url) values ('Yellow Peach Tree', 'Prunus Persica', 'https://cdn.thetreecenter.com/c/uploads/peach-glohaven-1.jpg');

insert into Plants (common_name, scientific_name, image_url) values ('Lemon Tree', 'Citrus × limon', 'https://gardeners.s3.amazonaws.com/p/FRLEM22602_3.jpg');

insert into Plants (common_name, scientific_name, image_url) values ('Dwarf Red Fuji Apple Tree', 'Malus domestica', 'https://www.plantnet.com.au/wp-content/uploads/plantnet-rootstock-apple-Red-Fuji.jpg');


# seed data for tasks

insert into Tasks (plant_id, name, due_date) values (1, 'Prune', '2020-06-30');

insert into Tasks (plant_id, name, description, due_date) values (1, 'Spray Pesticide', 'Copper spray eg. copper hydroxide or copper oxychloride', '2020-07-07');

insert into Tasks (plant_id, name, description, due_date) values (1, 'Fertilize', 'High nitrogen (e.g. 22:5:8 NPK)', '2020-09-07');

insert into Tasks (plant_id, name, description, due_date) values (1, 'Lay Beetle Traps', 'Carpophilus Catcha Trapping System - attract-and-kill traps', '2020-09-14');

insert into Tasks (plant_id, name, description, due_date) values (1, 'Fertilize', 'High nitrogen (e.g. 22:5:8 NPK)', '2020-11-30');



# these tasks are for lemons.
insert into Tasks (plant_id, name, description, due_date) values (2, 'Fertilize', 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone', '2020-01-07');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Iron Sulphate', 'One tablespoon in 4 and half litres of water and apply to trees', '2020-02-07');


insert into Tasks (plant_id, name, description, due_date) values (2, 'Iron Sulphate', 'One tablespoon in 4 and half litres of water and apply to trees', '2020-03-31');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Seaweed Solution', 'Water in well with a diluted seaweed solution', '2020-02-07');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Fertilize', 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone', '2020-09-14');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Iron Sulphate', 'One tablespoon in 4 and half litres of water and apply to trees', '2020-10-07');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Fertilize', 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone', '2020-10-21');

insert into Tasks (plant_id, name, description, due_date) values (2, 'Fertilize', 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone', '2020-11-30');


# these tasks are for Fuji Apples.
insert into Tasks (plant_id, name, description, due_date) values (3, 'Fertilize', 'Manures and compost or Dynamic Lifter for Fruit & Citrus', '2020-01-21');

insert into Tasks (plant_id, name, due_date) values (3, 'Prune', '2020-06-30');

insert into Tasks (plant_id, name, description, due_date) values (3, 'Fertilize', 'Manures and compost or Dynamic Lifter for Fruit & Citrus', '2020-09-07');