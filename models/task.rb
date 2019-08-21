class Task < ActiveRecord::Base
    has_many :todos
    belongs_to :plant

    validates :plant_id, :name, :due_date, presence: true
end
