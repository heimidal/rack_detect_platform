# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack_detect_platform}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Rose"]
  s.date = %q{2010-08-31}
  s.description = %q{Very simple Rack middleware to set an env variable based on user agent}
  s.email = %q{brian@heimidal.net}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "Gemfile",
     "Gemfile.lock",
     "README",
     "Rakefile",
     "VERSION",
     "lib/rack/detect_platform.rb",
     "rack_detect_platform.gemspec",
     "spec/detect_platform_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/heimidal/rack_detect_platform}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Very simple Rack middleware to set an env variable based on user agent}
  s.test_files = [
    "spec/detect_platform_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 2.0.0.beta.20"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["= 2.0.0.beta.20"])
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 2.0.0.beta.20"])
    s.add_dependency(%q<rack>, [">= 0"])
  end
end

