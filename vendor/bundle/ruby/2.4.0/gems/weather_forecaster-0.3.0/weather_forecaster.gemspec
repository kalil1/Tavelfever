# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather_forecaster/version'

Gem::Specification.new do |spec|
  spec.name          = "weather_forecaster"
  spec.version       = WeatherForecaster::VERSION
  spec.authors       = ["SANTOSH TURAMARI"]
  spec.email         = ["santosh.turamari85@gmail.com"]

  spec.summary       = %q{This gem gives the accurate weather forecast details of city}
  spec.description   = %q{WeatherForecaster accepts the city name Ex: London or city name followed by country code Ex: London, GB
                          It can accept the number of days from the current day to get the weather details. It provides the weather information as follows.
                            - City name which you are searching for.
                            - Country code.
                            - Latitude, Longitude.
                            - Day and night temperature values in Kelvin.  
                            - Pressure and humidity
                            - Weather Description.
                            - Current Date Time.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.10"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec", "~> 0"
  spec.add_dependency "httparty", "~> 0"
end
