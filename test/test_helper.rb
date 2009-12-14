require 'rubygems'
require 'test/unit'
require 'mocha'
require 'webrat'

lib_path = File.expand_path(File.dirname(__FILE__) + "/../lib/")
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

require 'seleniumrc_fu_webrat_mapper'

Webrat.configure do |config|
  config.mode = :rails
end
