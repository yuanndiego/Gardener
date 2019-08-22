require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'gardener_db'
}

ActiveRecord::Base.establish_connection(options)
ActiveRecord::Base.logger = Logger.new(STDOUT)
