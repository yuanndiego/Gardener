require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'gardener_db'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
ActiveRecord::Base.logger = Logger.new(STDOUT)
