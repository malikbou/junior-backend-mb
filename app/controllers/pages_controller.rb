require 'net/http'
require 'uri'

class PagesController < ApplicationController
  def home
    api_key = ENV["MAPBOX_API_KEY"]
    @latitude = 52.494857
    @longitude = 13.437641
    # url = URI("https://api.mapbox.com/geocoding/v5/mapbox.places/#{@longitude},#{@latitude}.json?type=poi&access_token=#{api_key}")
    url = URI("https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{@longitude},#{@latitude}&access_token=#{api_key}")
    response = Net::HTTP.get(url)
    @json = JSON.parse(response)
    @result = @json["features"]
  end
end
