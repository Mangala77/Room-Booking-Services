# -*- encoding: utf-8 -*-
# stub: json_matchers 0.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "json_matchers".freeze
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sean Doyle".freeze]
  s.date = "2017-10-03"
  s.description = "Validate your Rails JSON API's JSON".freeze
  s.email = ["sean.p.doyle24@gmail.com".freeze]
  s.homepage = "https://github.com/thoughtbot/json_matchers".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Validate your Rails JSON API's JSON".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json-schema>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.0"])
    else
      s.add_dependency(%q<json-schema>.freeze, ["~> 2.7"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.0"])
    end
  else
    s.add_dependency(%q<json-schema>.freeze, ["~> 2.7"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.0"])
  end
end
