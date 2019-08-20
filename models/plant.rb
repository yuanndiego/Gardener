class Plant < ActiveRecord::Base
    has_many :tasks
    has_many :todos
end