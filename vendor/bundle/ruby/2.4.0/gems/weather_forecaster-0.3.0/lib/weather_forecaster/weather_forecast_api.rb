require 'httparty'
require 'json'
require 'timeout'

module WeatherForecaster
	class WeatherForecastApi
		def initialize			
			@client = "http://api.openweathermap.org/data/2.5/forecast/daily"				
		end

		def query(city, count)
			result = {}
			begin
				status = Timeout::timeout(5){
					result = HTTParty.get(@client, :query => {:q=> city, :cnt => count})	    
		    }
			rescue Timeout::Error => e				
				puts "Taking too long time", :status => 500
				return
			end		
			return WeatherForecastResponse.new(result) if result
		end	
	end	

	class WeatherForecastResponse
		attr_reader :city, :day_temp, :pressure, :country, :list_details, :latitude, :longitude, :status, :message

		def initialize(result)
			detail = result.parsed_response
      if detail['cod'] == "200" 
  			@city = detail['city']['name']
  			@country = detail['city']['country']
  			@latitude = detail['city']['coord']['lat']
  			@longitude = detail['city']['coord']['lon']
        @status = "ok"
  			@list_details = [ ]
  			detail['list'].each do |list|
    			  @list_details << { 
    				  :date => DateTime.strptime(list['dt'].to_s,'%s').strftime,
    					:day_temp => list['temp']['day'],
    					:night_temp => list['temp']['night'],
    					:weather_description => list['weather'][0]['description'],
    					:pressure => list['pressure'],
    					:humidity => list['humidity']
    				}
  			end		
      else
        @status = "not_ok" 
        @message = [ ] 
  		end	
    end  
			
	end
end
