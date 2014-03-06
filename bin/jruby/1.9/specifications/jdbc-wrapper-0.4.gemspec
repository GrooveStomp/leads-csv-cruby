# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jdbc-wrapper"
  s.version = "0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Larry Myers"]
  s.date = "2008-04-03"
  s.email = "larry@larrymyers.com"
  s.homepage = "http://jdbc-wrapper.rubyforge.org/"
  s.require_paths = ["lib"]
  s.rubyforge_project = "JDBC Wrapper"
  s.rubygems_version = "1.8.24"
  s.summary = "A basic JDBC wrapper for JRuby"

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
