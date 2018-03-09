class OpenWeatherApi

  def initialize(api_key)
    @key = api_key
    @url = "https://api.openweathermap.org/"

  end

  def get_weather(city)
    url = @url + "data/2.5/weather?q=#{city}"
    url << "&APPID=#{@key}"
    HTTParty.get(url)
  end

end


weather = OpenWeatherApi.new("dae8d10e4ffe898434f2932fc31d48d2")
weather.get_weather("miami")
