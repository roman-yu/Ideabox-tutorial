require 'bundler'
Bundler.require
require 'ideabox/db_config'
# require 'yaml'

environment = ENV.fetch('RACK_ENV') { 'development' }
# db_options = YAML.load(File.read('./config/database.yml')[environment])
config = DBConfig.new(environment).options
ActiveRecord::Base.establish_connection(config)

require 'ideabox'