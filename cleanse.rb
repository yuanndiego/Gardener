require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/task'
require_relative 'models/todo'

Todo.delete_all
Task.delete_all
Plant.delete_all
User.delete_all