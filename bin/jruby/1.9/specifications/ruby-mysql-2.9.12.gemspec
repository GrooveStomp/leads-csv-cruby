# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby-mysql"
  s.version = "2.9.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tomita Masahiro"]
  s.date = "2013-12-17"
  s.description = "This is MySQL connector. pure Ruby version"
  s.email = "tommy@tmtm.org"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/tmtm/ruby-mysql"
  s.licenses = ["Ruby's"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "MySQL connector"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
