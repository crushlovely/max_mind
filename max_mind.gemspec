# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'max_mind/version'

Gem::Specification.new do |s|
  s.name = "max_mind"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["PJ Kelly", "Nate Clark"]
  s.date = %q{2009-10-22}
  s.description = %q{Ruby library for interacting with the MaxMind GeoIP Web Services.}
  s.email = ["pj@crushlovely.com", "nate@nateclark.com"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = Dir.glob("{lib}/**/*") + %w(README.rdoc)
  s.homepage = %q{http://github.com/crushlovely/max_mind}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby library for interacting with the MaxMind GeoIP Web Services.}
  s.test_files = [
    "spec/city_isp_org_spec.rb",
     "spec/city_spec.rb",
     "spec/country_spec.rb",
     "spec/max_mind_spec.rb",
     "spec/service_spec.rb",
     "spec/spec_helper.rb"
  ]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
