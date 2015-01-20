require 'active_record'
require 'mysql2'
require 'logger'

ActiveRecord::Base.logger = Logger.new('debug.log')
configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration['test'])

# TODO change it to your local table name
# TODO use config-setting
class LocalPost < ActiveRecord::Base
  self.table_name = 'refinery_blog_posts'
end
