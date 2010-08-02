require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'cucumber'
require 'cucumber/rake/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "simply_stored_scaffold"
    gem.summary = "A simple scaffold generator for simply_stored"
    gem.description = "A simple scaffold generator for Couchrest + couch_potato + simply_stored combo interface for Rails to CouchDB"
    gem.email = "vincenzo.rivello@gmail.com"
    gem.homepage = "http://github.com/enzor/simply_stored_scaffold"
    gem.authors = ["Vincenzo Rivello"]
    gem.files = FileList['rails_generators/**/**/**/**']
    gem.test_files = FileList['features/**/**']
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency("couchrest",">= 0.37")
    gem.add_dependency("couch_potato",">= 0.3.0")
    gem.add_dependency("simply_stored", ">= 0.3.6")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress"
end


task :test => :check_dependencies

task :default => [:features]

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simply_stored_scaffold #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
