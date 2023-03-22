require 'net/http'
require 'uri'

class PagesController < ApplicationController
  def home

  end

  def museums
    api_key = ENV["MAPBOX_API_KEY"]
    # @latitude = 52.494857
    # @longitude = 13.437641
    @latitude = params[:lat]
    @longitude = params[:long]
    @member = params[:member]

    url = URI("https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{@longitude},#{@latitude}&access_token=#{api_key}")
    response = Net::HTTP.get(url)
    @json = JSON.parse(response)
    @result = @json["features"]
    @museums = Hash.new{|hsh,key| hsh[key] = [] }
    # add everything to a JSON object
    @result.each do |museum|
      zipcode = museum["place_name"].split(",")[-2]
      @museums[zipcode.to_i].push(museum["place_name"])
    end
  end
end
