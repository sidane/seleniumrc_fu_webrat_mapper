require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the webrat_seleniumrc_fu_mappings plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the webrat_seleniumrc_fu_mappings plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Vendor::Plugins::WebratSeleniumrcFuMappings'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "seleniumrc_fc_webrat_mapper"
    gemspec.summary = "For simplifying migrating of Seleniumrc_fu Rails plugin tests to Webrat tests"
    gemspec.email = "niall@4l.ie"
    gemspec.homepage = "http://github.com/Sidane/seleniumrc_fu_webrat_mapper"
    gemspec.authors = ["Niall Mullally"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
