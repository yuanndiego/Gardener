class Todo < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant
    belongs_to :task
end

