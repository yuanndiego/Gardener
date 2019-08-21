require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/task'
require_relative 'models/todo'

u1 = User.new()
u1.username = 'Jenny Black'
u1.email = '1@1.com'
u1.password = 'pudding'
u1.save

u2 = User.new()
u2.username = 'Fenton Badgerton'
u2.email = '2@2.com'
u2.password = 'a'
u2.save

# seed data for plants
p1 = Plant.new
p2 = Plant.new
p3 = Plant.new

p1.common_name = 'Yellow Peach Tree'
p2.common_name = 'Lemon Tree'
p3.common_name = 'Dwarf Red Fuji Apple Tree'

p1.scientific_name = 'Prunus Persica'
p2.scientific_name = 'Citrus × limon'
p3.scientific_name = 'Malus domestica'

p1.image_url = 'https://cdn.thetreecenter.com/c/uploads/peach-glohaven-1.jpg'
p2.image_url = 'https://gardeners.s3.amazonaws.com/p/FRLEM22602_3.jpg'
p3.image_url = 'https://www.plantnet.com.au/wp-content/uploads/plantnet-rootstock-apple-Red-Fuji.jpg'

p1.save
p2.save
p3.save

# seed data for tasks

t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new

t1.plant_id = p1.id
t2.plant_id = p1.id
t3.plant_id = p1.id
t4.plant_id = p1.id
t5.plant_id = p1.id

t1.name = 'Prune'
t2.name = 'Spray Pesticide'
t3.name = 'Fertilize'
t4.name = 'Lay Beetle Traps'
t5.name = 'Fertilize'

t2.description = 'Copper spray eg. copper hydroxide or copper oxychloride'
t3.description = 'High nitrogen (e.g. 22:5:8 NPK)'
t4.description = 'Carpophilus Catcha Trapping System - attract-and-kill traps'
t5.description = 'High nitrogen (e.g. 22:5:8 NPK)'

t1.due_date = '2020-06-30'
t2.due_date = '2020-07-07'
t3.due_date = '2020-09-07'
t4.due_date = '2020-09-14'
t5.due_date = '2020-11-30'

t1.save
t2.save
t3.save
t4.save
t5.save

# these tasks are for lemons.

t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new
t6 = Task.new
t7 = Task.new
t8 = Task.new

t1.plant_id = p2.id
t2.plant_id = p2.id
t3.plant_id = p2.id
t4.plant_id = p2.id
t5.plant_id = p2.id
t6.plant_id = p2.id
t7.plant_id = p2.id
t8.plant_id = p2.id

t1.name = 'Fertilize'
t2.name = 'Iron Sulphate'
t3.name = 'Iron Sulphate'
t4.name = 'Seaweed Solution'
t5.name = 'Fertilize'
t6.name = 'Iron Sulphate'
t7.name = 'Fertilize'
t8.name = 'Fertilize'

t1.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t2.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t3.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t4.description = 'Water in well with a diluted seaweed solution'
t5.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t6.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t7.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'
t8.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'

t1.due_date = '2020-01-07'
t2.due_date = '2020-02-07'
t3.due_date = '2020-03-31'
t4.due_date = '2020-02-07'
t5.due_date = '2020-09-14'
t6.due_date = '2020-10-07'
t7.due_date = '2020-10-21'
t8.due_date = '2020-11-30'

t1.save
t2.save
t3.save
t4.save
t5.save
t6.save
t7.save
t8.save

# these tasks are for Fuji Apples.

t1 = Task.new
t2 = Task.new
t3 = Task.new

t1.plant_id = p3.id
t2.plant_id = p3.id
t3.plant_id = p3.id

t1.name = 'Fertilize'
t2.name = 'Prune'
t3.name = 'Fertilize'

t1.description = 'Manures and compost or Dynamic Lifter for Fruit & Citrus'
t3.description = 'Manures and compost or Dynamic Lifter for Fruit & Citrus'

t1.due_date = '2020-01-21'
t2.due_date = '2020-06-30'
t3.due_date = '2020-09-07'

t1.save
t2.save
t3.save

# Add u1 Todo

p1.tasks.each do |task|
    td = Todo.new
    td.user_id = u1.id
    td.plant_id = task.plant_id
    td.task_id = task.id
    td.complete = false;
    td.save
end

p2.tasks.each do |task|
    td = Todo.new
    td.user_id = u1.id
    td.plant_id = task.plant_id
    td.task_id = task.id
    td.complete = false;
    td.save
end

p3.tasks.each do |task|
    td = Todo.new
    td.user_id = u1.id
    td.plant_id = task.plant_id
    td.task_id = task.id
    td.complete = false;
    td.save
end
# Add u2 Todo

p1.tasks.each do |task|
    td = Todo.new
    td.user_id = u2.id
    td.plant_id = task.plant_id
    td.task_id = task.id
    td.complete = false;
    td.save
end
