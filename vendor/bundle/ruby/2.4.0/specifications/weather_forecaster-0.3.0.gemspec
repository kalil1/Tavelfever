# -*- encoding: utf-8 -*-
# stub: weather_forecaster 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "weather_forecaster".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["SANTOSH TURAMARI".freeze]
  s.bindir = "exe".freeze
  s.date = "2015-07-09"
  s.description = "WeatherForecaster accepts the city name Ex: London or city name followed by country code Ex: London, GB\n                          It can accept the number of days from the current day to get the weather details. It provides the weather information as follows.\n                            - City name which you are searching for.\n                            - Country code.\n                            - Latitude, Longitude.\n                            - Day and night temperature values in Kelvin.  \n                            - Pressure and humidity\n                            - Weather Description.\n                            - Current Date Time.".freeze
  s.email = ["santosh.turamari85@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "This gem gives the accurate weather forecast details of city".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_runtime_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_runtime_dependency(%q<rspec>.freeze, ["~> 0"])
      s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 0"])
      s.add_dependency(%q<httparty>.freeze, ["~> 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 0"])
    s.add_dependency(%q<httparty>.freeze, ["~> 0"])
  end
end
