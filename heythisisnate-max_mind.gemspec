# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{heythisisnate-max_mind}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["P J Kelly", "Nate Clark"]
  s.date = %q{2009-05-11}
  s.description = %q{Ruby library for interacting with the MaxMind GeoIP Web Services}
  s.email = %q{nate@nateclark.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "History.txt",
     "Manifest.txt",
     "PostInstall.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/autotest/discover.rb",
     "lib/max_mind.rb",
     "lib/max_mind/service.rb",
     "lib/max_mind/service/city.rb",
     "lib/max_mind/service/city_isp_org.rb",
     "lib/max_mind/service/country.rb",
     "script/console",
     "script/destroy",
     "script/generate",
     "spec/city_isp_org_spec.rb",
     "spec/city_spec.rb",
     "spec/country_spec.rb",
     "spec/max_mind_spec.rb",
     "spec/service_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "tasks/rspec.rake"
  ]
  s.homepage = %q{http://github.com/heythisisnate/max_mind}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Ruby library for interacting with the MaxMind GeoIP Web Services}
  s.test_files = [
    "spec/city_isp_org_spec.rb",
     "spec/city_spec.rb",
     "spec/country_spec.rb",
     "spec/max_mind_spec.rb",
     "spec/service_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
