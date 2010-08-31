require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run specs.'
task :default => :noop

desc 'Generate documentation for the spec plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Rack::DetectPlatform'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rack_detect_platform"
    gemspec.summary = "Very simple Rack middleware to set an env variable based on user agent"
    gemspec.description = "Very simple Rack middleware to set an env variable based on user agent"
    gemspec.email = "brian@heimidal.net"
    gemspec.homepage = "http://github.com/heimidal/rack_detect_platform"
    gemspec.authors = ["Brian Rose"]
    gemspec.add_development_dependency('rspec', '2.0.0.beta.20')
    gemspec.add_dependency('rack')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

Jeweler::GemcutterTasks.new