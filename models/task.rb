class Task < ActiveRecord::Base
    has_many :todos
    belongs_to :plant
end
