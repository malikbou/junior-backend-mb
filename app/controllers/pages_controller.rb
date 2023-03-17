require "json"
require "open-uri"

class PagesController < ApplicationController
  def home
    url = "https://api.github.com/users/ssaunier"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
    @username = @user["name"]
    @bio = @user["bio"]
  end
end
