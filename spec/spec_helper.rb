gem 'rspec', '~> 2.14'
require 'rspec'
require 'ruby_parser'
require 'sexp_path'
require 'source_matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["./spec/support/**/*.rb"].each {|f| require f}
