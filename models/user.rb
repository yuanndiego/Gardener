class User < ActiveRecord::Base
    has_secure_password
    has_many :todos

    validates :username, :email, :password_digest, presence: true
    validates :email, :username, uniqueness: true

end