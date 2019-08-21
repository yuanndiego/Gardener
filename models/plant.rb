class Plant < ActiveRecord::Base
    has_many :tasks
    has_many :todos

    validates :image_url, :common_name, presence: true
    validates :image_url, uniqueness: true
end

