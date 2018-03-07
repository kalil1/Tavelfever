require "weather_forecaster/version"
require "weather_forecaster/weather_forecast_api"

module WeatherForecaster
  def self.forecast(city, count_days=nil)
  	w = WeatherForecastApi.new
  	count_days ||= 1
  	w.query(city, count_days) 
  end
end
