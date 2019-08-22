class Todo < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant
    belongs_to :task

    validates :user_id, :plant_id, :task_id, presence: true
    validates :user_id, :plant_id, :task_id, numericality: true
end

