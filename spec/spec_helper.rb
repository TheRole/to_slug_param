# This file is copied to rspec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
ENV['RAILS_VERSION'] ||= '6'

require File.expand_path("../../../rails#{ENV.fetch('RAILS_VERSION')}-app/config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in rspec/support/ and its subdirectories.
# Dir[Rails.root.join("rspec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.order = "random"
end
